import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:my_news/firebase_options.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(await builder());
}
