import 'package:floor/floor.dart';

@Entity(tableName: 'Admins')
class TestModel {
  @PrimaryKey(autoGenerate: true)
  int? key;
  @ColumnInfo(name: 'Data')
  String? data;
}