import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_dataon/models/base_response.dart';
import 'package:test_dataon/models/user_model.dart';

class UserService {
  static final UserService instance = UserService._init();

  static Database? _database;

  UserService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('activities.db');
    return _database!;
  }

  static const String _tableUser = 'users';
  static const String _columnFullName = 'fullName';
  static const String _columnUserName = 'userName';
  static const String _columnPassword = 'password';
  static const String _columnPhoto = 'photo';

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute("CREATE TABLE $_tableUser ("
        " $_columnFullName TEXT, "
        " $_columnUserName TEXT, "
        " $_columnPassword TEXT, "
        " $_columnPhoto TEXT, "
        " PRIMARY KEY ($_columnUserName)"
        ")");
  }

  Future<int> register(User users) async {
    final db = await instance.database;

    var id = await db.insert(_tableUser, users.toJson());
    return id;
  }

  Future<BaseResponse> readUsers(String userName) async {
    final db = await instance.database;

    final res = await db.rawQuery(
        "SELECT * FROM $_tableUser WHERE $_columnUserName = '$userName'");

    if (res.isNotEmpty) {
      return BaseResponse(success: true, data: User.fromJson(res.first));
    } else {
      return BaseResponse(success: false, data: null);
    }
  }

  Future<BaseResponse> login(String userName, String password) async {
    var db = await instance.database;
    var response = await db.rawQuery(
        "SELECT * FROM $_tableUser WHERE $_columnUserName = '$userName' AND $_columnPassword = '$password'");
    if (response.isNotEmpty) {
      User user = User.fromJson(response.first);
      return BaseResponse(success: true, data: user);
    }
    return BaseResponse(success: false, data: null);
  }

  Future<int> updateUser(User users) async {
    final db = await instance.database;
    return await db.update(_tableUser, users.toJson(),
        where: '$_columnUserName = ?', whereArgs: [users.userName]);
  }
}
