import 'package:app_sqlite_flutter/src/app_sqlite_flutter.dart';
import 'package:app_sqlite_flutter/src/config/GetItConfig.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetItConfig.setup();
  runApp(const AppSqliteFlutter());
}