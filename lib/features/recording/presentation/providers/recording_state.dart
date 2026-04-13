import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/recording_error.dart';
import '../../domain/models/recording_note.dart';

part 'recording_state.freezed.dart';

enum ProcessingStep { transcribing, summarising }

@freezed
sealed class RecordingState with _$RecordingState {
  const factory RecordingState.idle() = Idle;
  const factory RecordingState.recording({
    required Duration elapsed,
    @Default('') String transcript,
  }) = Recording;
  const factory RecordingState.processing({required ProcessingStep step}) =
      Processing;
  const factory RecordingState.done({required RecordingNote note}) = Done;
  const factory RecordingState.error({required RecordingError error}) = Error;
}
