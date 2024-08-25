import 'package:app_sqlite_flutter/src/app/tarefa/tarefa_entity.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_entity.dart';
import 'package:flutter/material.dart';

class TarefaForm extends StatelessWidget {
  TarefaForm({super.key, required this.tarefas, TarefaEntity? entity}) : this.entity = entity ?? TarefaEntity.vazio(tarefa: tarefas.id!);

  final TarefasEntity tarefas;
  final TarefaEntity entity;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de tarefa - DETALHE"),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0 * 3),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText  : "Descrição da tarefa",
                      hintText  : "Descrição da tarefa"
                    ),
                    initialValue: entity.description,
                    onChanged: (v) => entity.setDescription(v),
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Informe uma descrição";
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pop(context, entity);
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
