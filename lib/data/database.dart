import 'package:mysql1/mysql1.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Database {
  static final Database _instance = Database._internal();
  MySqlConnection? _connection;

  factory Database() {
    return _instance;
  }

  Database._internal();

  Future<void> openConnection() async {
    await dotenv.load(fileName: ".env");
    if (_connection == null) {
      final settings = ConnectionSettings(
        host: dotenv.env['HOST']!,
        user: dotenv.env['USER']!,
        password: dotenv.env['PASSWORD']!,
        db: dotenv.env['DB']!,
      );
      _connection = await MySqlConnection.connect(settings);
    }
  }

  Future<void> closeConnection() async {
    await _connection?.close();
    _connection = null;
  }

  MySqlConnection get connection {
    if (_connection == null) {
      throw Exception('Database connection is not open');
    }
    return _connection!;
  }
}
