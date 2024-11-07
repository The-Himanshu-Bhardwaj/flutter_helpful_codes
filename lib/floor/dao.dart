import 'package:floor/floor.dart';
import 'test_model.dart';

@dao
abstract class DatabaseDao {

  // ITEMS
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertInItemsTable(TestModel model);

  @Query('DELETE FROM Data')
  Future<void> deleteItemsTable();

}