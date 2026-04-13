import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/services/adapty_service.dart';
import 'core/services/adjust_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  await Future.wait([AdjustService.init(), AdaptyService.init()]);

  await AdjustService.requestATT();

  runApp(const ProviderScope(child: NoteRecorderApp()));
}
