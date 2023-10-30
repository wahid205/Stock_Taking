import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:stocktaking_app/data/dataabstract.dart';

class Itemsdb extends Models {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  @override
  intialDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'wahid.db');
    Database myDb = await openDatabase(path, onCreate: _oncreate);
  }

  _oncreate(Database db, int version) async {
    await db.execute('''CREATE TABLE "item"( ItemID TEXT PRIMARY KEY,
          ItemName TEXT,
          ItemBarcode TEXT UNIQUE,
          ItemPrice REAL,
          ItemQuantity INTEGER)''');
    await db.execute('''
        CREATE TABLE StockRecords (
          RecordDocumentNumber INTEGER AUROINCREMENT,
          RecordTime TEXT,
          ItemID TEXT,
          ItemQuantity INTEGER,
          PRIMARY KEY (RecordDocumentNumber, RecordTime, ItemID),
          FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
        )
      ''');
    print("crated");
  }

  @override
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  @override
  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  @override
  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  @override
  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
