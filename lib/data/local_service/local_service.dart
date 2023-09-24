import 'package:architecture/config/logger.dart';
import 'package:architecture/data/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:architecture/data/keys/local_keys.dart';
import 'package:sqflite/sqflite.dart';

class LocalService{
  static final _instance = LocalService._();
  static LocalService get = _instance;
  bool isInitialized = false;
  late Database _db;

  LocalService._();

  Future<Database> db() async {
    if (!isInitialized) await _init();
    return _db;
  }


  Future _init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, LocalKeys().dbName);

    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(ContactDao().createTableQuery);
        });
    isInitialized = true;
  }
  void deleteAllTables() async {
    var connection = _db;
    await connection.rawDelete("delete from ${ContactDao().tableName}");

    Logger.info(tag: "deleteAllTablesTAG", message: "All local database deleted successfully");
  }
}