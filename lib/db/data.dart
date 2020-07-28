import 'package:dwu_project/entities/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  final int _version = 1;
  final String _nameDB = 'user.db';
  Database _db;
  static DBHelper _instance = DBHelper._intern();
  factory DBHelper() {
    return _instance;
  }

  DBHelper._intern();

  Future<Database> obtemDB() async {
    if (_db == null) {
      var _directory = await getApplicationDocumentsDirectory();
      var _path = join(_directory.path, _nameDB);
      _db = await openDatabase(_path, version: _version, onCreate: _onCreate);
    }
    return _db;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      create table user (
          id integer primary key autoincrement,
          name text not null,
          surname text,
          email text,
          age integer,
          salary real,
          gender text
      );
    ''');
  }
}

/* final userList = <User>[
  User.newer('Nícolas', 'Godoy', 'nico@gmail.com', 21, 1000.00, 'Masculino'),
  User.newer('Nícola', 'Godoy', 'nic@gmail.com', 21, 1000.00, 'Masculino'),
  User.newer('Nícos', 'Godoy', 'nio@gmail.com', 21, 1000.00, 'Masculino'),
  User.newer('Nlas', 'Godoy', 'nco@gmail.com', 21, 1000.00, 'Masculino'),
  User.newer('Nolas', 'Godoy', 'ico@gmail.com', 21, 1000.00, 'Masculino'),
]; */
