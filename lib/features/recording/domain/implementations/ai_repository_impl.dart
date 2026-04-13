import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/utils/duration_format.dart';
import '../interfaces/ai_processor_service.dart';
import '../models/recording_note.dart';

class AIRepositoryImpl implements AIProcessorService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.openai.com/v1',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  @override
  Future<RecordingNote> generateNote({
    required String transcript,
    required Duration duration,
  }) async {
    final apiKey = dotenv.env['OPENAI_API_KEY'] ?? '';
    _dio.options.headers['Authorization'] = 'Bearer $apiKey';

    debugPrint(
      '[OpenAIRepo] Generating note (${transcript.length} chars, ${duration.toShortString()})',
    );

    const maxRetries = 3;

    for (var attempt = 1; attempt <= maxRetries; attempt++) {
      try {
        final response = await _dio.post(
          '/chat/completions',
          data: {
            'model': 'gpt-4o-mini',
            'response_format': {'type': 'json_object'},
            'messages': [
              {
                'role': 'system',
                'content':
                    '''You are a meeting notes assistant. Analyze the transcript and return a JSON object with exactly this structure:
{
  "title": "A short descriptive title for this recording",
  "summary": "A concise 2-3 sentence summary of the recording",
  "keyHighlights": ["highlight 1", "highlight 2", "highlight 3"],
  "actionItems": [{"text": "action item description"}],
  "transcript": [{"speaker": "Speaker 1", "text": "what they said", "timestamp": "0:00"}]
}

If the transcript is from a single person, use "You" as the speaker name.
If you can identify multiple speakers, label them appropriately.
Extract real action items and highlights from the content.
Generate realistic timestamps based on the recording duration.''',
              },
              {
                'role': 'user',
                'content':
                    'Recording duration: ${duration.toShortString()}\n\nTranscript:\n$transcript',
              },
            ],
          },
        );

        final content =
            response.data['choices'][0]['message']['content'] as String;
        final json = jsonDecode(content) as Map<String, dynamic>;
        return RecordingNote.fromAIResponse(json, duration);
      } on DioException catch (e) {
        final status = e.response?.statusCode;
        if ((status == 503 || status == 429) && attempt < maxRetries) {
          final delay = Duration(seconds: attempt * 2);
          debugPrint(
            '[OpenAIRepo] $status — retrying in ${delay.inSeconds}s (attempt $attempt/$maxRetries)',
          );
          await Future.delayed(delay);
          continue;
        }
        rethrow;
      }
    }

    throw Exception('OpenAI API failed after $maxRetries attempts');
  }
}
