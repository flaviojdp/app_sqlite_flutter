import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_entity.dart';
import 'package:flutter/material.dart';

class TarefasForm extends StatelessWidget {
  TarefasForm({super.key});

  final TarefasEntity entity = TarefasEntity.vazio();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de tarefas"),
      ),
      body: Container(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Cadastrar..."),
                Text("Cadastrar..."),
                TextFormField(
                  onChanged: (v) => entity.description = v,
                  validator: (v) {
                    if (v == null || (v != null && v!.isEmpty)) {
                      return "Informe uma descrição";
                    }
                  },
                ),
              ],
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
