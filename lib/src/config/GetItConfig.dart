import 'package:app_sqlite_flutter/src/app/parse/tbl_tarefas_repository_domain.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_services.dart';
import 'package:app_sqlite_flutter/src/drift/db_drift.dart';
import 'package:app_sqlite_flutter/src/drift/repositories/tbl_tarefas_repository.dart';
import 'package:get_it/get_it.dart';

class GetItConfig {
  static GetIt get getIt {
    return GetIt.instance;
  }

  static void setup(){
    getIt.registerLazySingleton(() => DbDrift());
    getIt.registerLazySingleton(() => TblTarefasRepository(GetIt.I()));
    getIt.registerLazySingleton(() => TblTarefasRepositoryDomain(GetIt.I()));
    getIt.registerLazySingleton(() => TarefasServices(GetIt.I<TblTarefasRepositoryDomain>()));
  }
}
