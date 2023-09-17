import 'package:architecture/config/logger.dart';
import 'package:architecture/data/local_service/dao.dart';
import 'package:architecture/data/local_service/local_service.dart';
import 'package:architecture/domain/entity/contact_entity.dart';

class ContactDao extends IDao<ContactEntity>{
  LocalService service = LocalService.get;

  final colId="id";
  final colFirstName="firstName";
  final colLastName="lastName";
  final colCompanyName="companyName";
  final colPhone="phone";
  final colEmail="email";
  final colDateOfBirth="dateOfBirth";
  final colProfile="profile";
  final colAddon="addOn";

  @override
  String get tableName => "contacts";

  @override
  String get createTableQuery => "CREATE TABLE $tableName($colId INTEGER PRIMARY KEY AUTOINCREMENT,"
      " $colFirstName TEXT,"
      " $colLastName TEXT,"
      " $colCompanyName TEXT,"
      " $colPhone TEXT,"
      " $colEmail TEXT,"
      " $colDateOfBirth TEXT,"
      " $colProfile BLOB,"
      " $colAddon TEXT)";



  @override
  Future<int> insertDB(Map<String, dynamic> entity) async{
    final db = await service.db();
    entity['addOn'] = DateTime.now().millisecondsSinceEpoch;
    int id = await db.insert(tableName, entity);
    Logger.debug(tag: "Table $tableName: $id",message: "Inserted id = $id");
    return id;
  }


  @override
  Future<int> deleteDB() async{
    try {
      final db = await service.db();
      int isDeleted = await db.delete(tableName);
      Logger.debug(tag:"Table $tableName Deleted",message: isDeleted);
      return isDeleted;
    } catch (e) {
      Logger.debug(tag:"Table $tableName Error",message: e);
      throw Exception(e);
    }
  }

  @override
  List<ContactEntity> fromList(List<Map<String, dynamic>> query) {
    // TODO: implement fromList
    throw UnimplementedError();
  }

  @override
  ContactEntity fromMap(Map<String, dynamic> query) {
    // TODO: implement fromMap
    throw UnimplementedError();
  }

  @override
  Future<List<ContactEntity>> getAllData(String id) {
    // TODO: implement getAllData
    throw UnimplementedError();
  }

  @override
  Future<int> insertAll(List<ContactEntity> list) {
    // TODO: implement insertAll
    throw UnimplementedError();
  }


  @override
  ContactEntity toMap(ContactEntity object) {
    // TODO: implement toMap
    throw UnimplementedError();
  }

  @override
  Future<ContactEntity> updateDB(ContactEntity entity) {
    // TODO: implement updateDB
    throw UnimplementedError();
  }

}