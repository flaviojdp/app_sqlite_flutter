import 'package:app_sqlite_flutter/src/pages/app_home.dart';
import 'package:flutter/material.dart';

class AppSqliteFlutter extends StatelessWidget {
  const AppSqliteFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Teste',
      home: AppHome(),
    );
  }
}
