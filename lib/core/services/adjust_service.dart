import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_config.dart';
import 'package:adjust_sdk/adjust_event.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AdjustService {
  static Future<void> init() async {
    final appToken = dotenv.env['ADJUST_APP_TOKEN'] ?? '';
    // Uncomment for production
    // final environment = kReleaseMode
    //     ? AdjustEnvironment.production
    //     : AdjustEnvironment.sandbox;
    final environment = AdjustEnvironment.sandbox;

    final config = AdjustConfig(appToken, environment);
    config.logLevel = kReleaseMode
        ? AdjustLogLevel.suppress
        : AdjustLogLevel.verbose;
    config.isSendingInBackgroundEnabled = true;
    config.attConsentWaitingInterval = 30;
    Adjust.initSdk(config);
  }

  static Future<void> requestATT() async {
    await Adjust.requestAppTrackingAuthorization();
  }

  static void trackRecordingComplete() {
    final eventToken = dotenv.env['ADJUST_EVENT_TOKEN'] ?? '';
    final event = AdjustEvent(eventToken);
    Adjust.trackEvent(event);
  }
}
