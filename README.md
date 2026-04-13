# Recorder

A mobile app that records what you say, transcribes it in real time, and uses AI to turn it into structured notes — complete with a summary, key highlights, action items, and a speaker-labelled transcript.

## What it does

1. **Record** — Tap the microphone and start talking. Words appear on screen as you speak.
2. **Transcribe** — Speech is converted to text live on your device (no cloud STT service needed).
3. **Summarise** — When you stop, the transcript is sent to Gemini AI, which generates a title, summary, highlights, and action items.
4. **Review** — The finished note is presented in three tabs: Summary, Actions, and Transcript.
5. **Paywall** — Displays a paywall to the user to subscribe to a premium plan.

## Demo Videos

- [**Permissions, Paywall & Recording**](videos/permissions_paywall_recording.mp4) — Full happy path: granting microphone and speech permissions, viewing the paywall, recording audio, and reviewing the generated note.
- [**Multiple Recordings**](videos/multiple_recordings.mp4) — Back-to-back recordings showing the complete flow from start to finish, including retrying and starting over.
- [**No Internet Connection**](videos/no_internet_connection.mp4) — How the app handles being offline: recording and transcription work locally, and the AI summarisation step fails gracefully with a retry option.

## How it works (technical overview)

The app uses the device's built-in speech recognition (`speech_to_text` package) as the sole microphone consumer — there is no separate audio recording step. While the user speaks, recognised words accumulate in real time and are displayed on the recording screen via a 1-second timer tick.

When the user stops, the full transcript is sent to the **Gemini 2.5 Flash** REST API, which returns structured JSON. The response is parsed into a `RecordingNote` model and displayed across three tabs.

State is managed with **Riverpod + Freezed** sealed classes. The recording flow is a finite state machine:

```
Idle → Recording(elapsed, transcript) → Processing(step) → Done(note)
                                                          ↘ Error(error)
```

Errors are also a sealed type with four variants, each with its own recovery screen:

```
MicDenied · SpeechToTextDenied · STTFailed(message) · AIFailed(message)
```

## Setup

### Prerequisites

- Flutter SDK 3.12+ (beta channel)
- iOS Simulator or Android Emulator with microphone support
- A `.env` file with the required API keys (see step 2)

### 1. Install dependencies

```bash
flutter pub get
```

### 2. Configure environment variables

Create a `.env` file in the project root:

```
GEMINI_API_KEY=your-gemini-key
GEMINI_MODEL=gemini-2.5-flash
ADJUST_APP_TOKEN=your-adjust-app-token
ADAPTY_API_KEY=your-adapty-production-key
ADAPTY_SANDBOX_API_KEY=your-adapty-sandbox-key
```

### 3. Generate code

Freezed and JSON serialization require a build step:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. Run

```bash
flutter run
```

## Architecture

### Project structure

```
lib/
├── core/
│   ├── error/              # RecordingError sealed class
│   ├── services/           # Adjust (attribution), Adapty (subscriptions)
│   └── utils/              # Shared helpers (duration formatting)
├── features/recording/
│   ├── domain/
│   │   ├── interfaces/     # Abstract contracts (STTRepository, AIProcessorService)
│   │   ├── implementations/# Concrete classes (Gemini, OpenAI, STT, processors)
│   │   └── models/         # RecordingNote, ActionItem, TranscriptEntry (freezed)
│   └── presentation/
│       ├── providers/      # Riverpod notifier + state definitions
│       ├── screens/        # Recording, Processing, Error, Note Detail
│       └── widgets/        # Timer, waveform, summary/actions/transcript tabs
└── shared/
    └── theme/              # Colours, text styles
```

### State management — Riverpod + Freezed

Riverpod provides compile-safe dependency injection without requiring `BuildContext` in business logic. Freezed sealed classes make the recording state machine exhaustive — if a new state or error variant is added, the compiler flags every `switch` that doesn't handle it.

### AI provider — modular

The AI layer is behind an abstract `AIProcessorService` interface. Two implementations exist:

- `GeminiRepositoryImpl` — Gemini 2.5 Flash REST API (active)
- `AIRepositoryImpl` — OpenAI GPT-4o-mini (available, one-line provider swap) I didn't had a openai key so I used gemini instead but it could be swapped easily.

Both include retry logic with exponential backoff for transient errors (503, 429).

## Key decisions

| Decision         | Choice                              | Reasoning                                                                              |
| ---------------- | ----------------------------------- | -------------------------------------------------------------------------------------- |
| State management | Riverpod + Freezed                  | Compile-safe providers, sealed states with exhaustive switch, no BuildContext in logic |
| Architecture     | Feature-based clean architecture    | Clear separation of UI, domain, and data layers per feature                            |
| Speech-to-text   | `speech_to_text` (device-native)    | Zero config for reviewers, no API key needed, works on simulators                      |
| AI summarisation | Gemini 2.5 Flash                    | Free tier sufficient for the challenge, fast implementation, structured JSON output    |
| Audio capture    | None (STT is the sole mic consumer) | Removed the `record` package — no audio file is needed since STT runs live             |
| Local storage    | None                                | Notes are not persisted between sessions; scope was limited to the recording flow      |

## SDK integration

### Adjust (attribution)

- Initialised on app launch with automatic environment switching (`sandbox` in debug, `production` in release builds via `kReleaseMode`)
- Tracks a `recording_completed` event when a recording finishes

### Adapty (subscriptions)

- Initialised on app launch with environment-aware API keys (sandbox key in debug, production key in release)
- `showPaywall()` fetches and presents the paywall UI
- `hasActiveSubscription()` checks the user's entitlement status

## Screens

1. **Idle** — Microphone button to start recording, "Fetch Paywall" button for subscription testing
2. **Recording** — Live timer, animated waveform, real-time transcript, cancel (with confirmation dialog) and stop buttons
3. **Processing** — Two-step progress indicator: "Transcribing audio..." then "Generating summary..."
4. **Note Detail** — Title, metadata (date, duration, speakers), three tabs: Summary (AI card + key highlights), Actions (checkable items), Transcript (speaker-labelled with timestamps)
5. **Error** — Contextual per failure: microphone denied and speech recognition denied lead to Settings, STT failure offers retry, AI failure offers retry without re-recording
