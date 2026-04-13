import 'package:freezed_annotation/freezed_annotation.dart';

part 'recording_error.freezed.dart';

@freezed
sealed class RecordingError with _$RecordingError {
  const factory RecordingError.micDenied() = MicDenied;
  const factory RecordingError.speechToTextDenied() = SpeechToTextDenied;
  const factory RecordingError.sttFailed({String? message}) = STTFailed;
  const factory RecordingError.aiFailed({String? message}) = AIFailed;
}
