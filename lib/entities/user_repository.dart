import 'package:dwu_project/db/data.dart';
import 'package:dwu_project/entities/user.dart';

class UserRepository {
  final DBHelper _dbHelper = DBHelper();

  Future<bool> newUser(User obj) async {
    var db = await _dbHelper.obtemDB();
    var rows = await db.insert('user', obj.toMap());
    return rows > 0;
  }

  Future<bool> updateUser(User obj) async {
    var db = await _dbHelper.obtemDB();
    var rows = await db
        .update('user', obj.toMap(), where: 'id = ?', whereArgs: [obj.id]);
    return rows > 0;
  }

  Future<bool> deleteUser(User obj) async {
    var db = await _dbHelper.obtemDB();
    var rows = await db.delete(
      'user',
      where: 'id = ?',
      whereArgs: [obj.id],
    );
    return rows > 0;
  }

  Future<List<User>> getUsers() async {
    try {
      var db = await _dbHelper.obtemDB();
      var data = await db.query('user');

      print(data);

      var users = data.map((e) => User.fromMap(e)).toList();
      return users;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
