import 'package:floor/floor.dart';

@Entity(tableName: 'Admins')
class TestModel {
  @PrimaryKey(autoGenerate: true)
  int? key;

  @ColumnInfo(name: 'Data')
  String? data;

  TestModel({this.key, this.data});

  // From JSON method
  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      key: json['key'] as int?,
      data: json['Data'] as String?,
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'Data': data,
    };
  }
}
