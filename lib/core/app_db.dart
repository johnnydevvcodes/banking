import 'dart:async';

import 'package:bankingapp/core/app_db_interface.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDatabase extends AppDatabaseApi {
  //Completer is used for transforming synchronous code into asynchronous code.
  Completer<Database>? _dbOpenCompleter;

  @override
  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _openDatabase();
    }
    return _dbOpenCompleter!.future;
  }

  Future _openDatabase() async {
    // Get a platform-specific directory where persistent app data can be stored
    final appDocumentDir = await getApplicationDocumentsDirectory();
    // make sure it exists
    await appDocumentDir.create(recursive: true);
    // Path with the form: /platform-specific-directory/bankingapp.db
    final dbPath = join(appDocumentDir.path, 'bankingapp.db');

    final db = await databaseFactoryIo.openDatabase(dbPath);

    // Any code awaiting the Completer's future will now start executing
    _dbOpenCompleter!.complete(db);
  }

}
