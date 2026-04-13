import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AdaptyService {
  static Future<void> init() async {
    try {
      const useATT = true;
      // uncomment for production
      // final apiKey = kReleaseMode
      //     ? dotenv.env['ADAPTY_API_KEY'] ?? ''
      //     : dotenv.env['ADAPTY_SANDBOX_API_KEY'] ?? '';
      // use sandbox
      final apiKey = dotenv.env['ADAPTY_SANDBOX_API_KEY'] ?? '';

      await Adapty().activate(
        configuration: AdaptyConfiguration(apiKey: apiKey)
          ..withAppleIdfaCollectionDisabled(!useATT)
          ..withGoogleAdvertisingIdCollectionDisabled(!useATT),
      );
    } catch (e) {
      debugPrint('Adapty init failed (non-fatal): $e');
    }
  }

  static Future<void> showPaywall() async {
    try {
      final paywall = await Adapty().getPaywall(placementId: 'placement_id');
      final view = await AdaptyUI().createPaywallView(paywall: paywall);
      await view.present();
    } on AdaptyError catch (e) {
      debugPrint('Failed to create paywall view: $e');
    } catch (e) {
      debugPrint('Failed to create paywall view: $e');
    }
  }

  static Future<bool> hasActiveSubscription() async {
    try {
      final profile = await Adapty().getProfile();
      return profile.accessLevels['premium']?.isActive ?? false;
    } catch (e) {
      debugPrint('Adapty subscription check failed: $e');
      return false;
    }
  }
}
