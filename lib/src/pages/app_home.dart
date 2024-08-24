import 'package:app_sqlite_flutter/src/app/parse/tbl_tarefas_repository_domain.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/cp_tarefas_list.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_entity.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_repository_domain.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_services.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/views/tarefas_home.dart';
import 'package:app_sqlite_flutter/src/drift/db_drift.dart';
import 'package:app_sqlite_flutter/src/drift/repositories/tbl_tarefas_repository.dart';
import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App SQLite Flutter'),
        actions: [
        ],
      ),
      body: TarefasHome(),
    );
  }


}
