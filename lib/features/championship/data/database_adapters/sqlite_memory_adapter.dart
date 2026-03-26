import '../../../../core/database/app_database.dart';

class SqliteMemoryAdapter {
  const SqliteMemoryAdapter(this.database);
  final AppDatabase database;
}
