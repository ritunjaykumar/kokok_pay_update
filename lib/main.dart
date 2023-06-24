 import 'package:flutter/material.dart';

import 'application/application.dart';
import 'application/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await onApplicationStart(); //for getIt
  runApp(const MyApp());
}
