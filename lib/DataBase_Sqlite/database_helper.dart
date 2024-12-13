import 'package:banco_azteca/DataBase_Sqlite/modelDatabase/Payment_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'payments.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE payments (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            amount REAL,
            service TEXT,
            payment_type TEXT,
            persona TEXT 
          )
        ''');
      },
    );
  }

  Future<int> insertPayment(Payment payment) async {
    final db = await database;
    return await db.insert('payments', payment.toMap());
  }

  Future<List<Payment>> getPayments() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('payments');

    return List.generate(maps.length, (i) => Payment.fromMap(maps[i]));
  }
}
