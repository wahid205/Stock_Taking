import 'package:sqflite/sqflite.dart';

abstract class Models {
  readData(String sql);
  deleteData(String sql);
  updateData(String sql);
  insertData(String sql);
  intialDb();
}
