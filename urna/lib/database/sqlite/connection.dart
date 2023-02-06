import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:urna/database/sqlite/script.dart';

class Connection {
  static Database? _db;

  static Future<Database?> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'banco_eleicao');
      //deleteDatabase(path);
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.execute(createTableZona);
          db.execute(createTableSessao);
          db.execute(createTableEleitor);
          db.execute(createTableCargos);
          db.execute(createTableCandidato);
          db.execute(createTableVotos);
        },
      );
    }
    return _db;
  }
}
