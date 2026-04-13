# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Flutter app ("recording_challenge") that records audio, transcribes via device-native STT in real-time, and generates structured notes (summary, action items, speaker-labelled transcript) using Gemini 2.5 Flash.

## Build & Development Commands

```bash
# Install dependencies
flutter pub get

# Code generation (freezed models + JSON serializable) — run after changing any @freezed or @JsonSerializable class
dart run build_runner build --delete-conflicting-outputs

# Run the app
flutter run

# Run tests
flutter test
# Single test file
flutter test test/widget_test.dart

# Lint
flutter analyze
```

## Environment

- Requires Flutter SDK 3.12+ (beta channel)
- Requires `.env` file in project root with: `OPENAI_API_KEY`, `GEMINI_API_KEY`, `ADJUST_APP_TOKEN`, `ADJUST_EVENT_TOKEN`, `ADAPTY_API_KEY`, `ADAPTY_SANDBOX_API_KEY`
- iOS needs microphone + speech recognition permissions; Android needs microphone permission

## Architecture

**State management:** Riverpod + Freezed sealed classes. The central state machine is `RecordingState` (Idle | Recording | Processing | Done | Error) in `lib/features/recording/presentation/providers/recording_state.dart`. `RecordingNotifier` in `recording_providers.dart` drives all transitions.

**Feature-based clean architecture:**
- `domain/interfaces/` — abstract contracts (`AIProcessorService`, `STTRepository`)
- `domain/implementations/` — concrete implementations. AI has two: `GeminiRepositoryImpl` (active) and `ai_repository_impl.dart` (OpenAI, unused). STT uses `SpeechToTextProcessor` wrapping `STTRepositoryImpl`.
- `domain/models/` — Freezed data classes (`RecordingNote`, `TranscriptEntry`, `ActionItem`) with JSON serialization
- `presentation/providers/` — Riverpod providers wiring domain to UI
- `presentation/screens/` — screens for each state (recording, processing, note detail, error)
- `presentation/widgets/` — reusable widgets (tabs for note detail, timer, waveform)

**Core services** (`lib/core/services/`): `AdjustService` (attribution tracking) and `AdaptyService` (subscriptions) — both initialized at app startup in `main.dart`.

**Key data flow:** Record -> live STT accumulates transcript during recording -> on stop, transcript feeds into `AIProcessor.generateNote()` -> Gemini returns structured JSON parsed into `RecordingNote`.

## Freezed / Code Generation

Models annotated with `@freezed` have companion `.freezed.dart` and `.g.dart` files. After modifying any model in `domain/models/` or sealed classes like `RecordingState` / `RecordingError`, regenerate with `dart run build_runner build --delete-conflicting-outputs`. Never hand-edit `.freezed.dart` or `.g.dart` files.
