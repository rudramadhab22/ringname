import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/caller_model.dart';

class DatabaseHelper {
  static const _databaseName = "RingNameDatabase.db";
  static const _databaseVersion = 1;
  static const tableCallers = 'callers';

  // Make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Open the database (and create it if it doesn't exist)
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableCallers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        phoneNumber TEXT NOT NULL UNIQUE,
        customName TEXT NOT NULL,
        createdAt TEXT NOT NULL
      )
    ''');
  }

  // Helper methods

  // Inserts a row in the database
  Future<int> insertCaller(CallerModel caller) async {
    Database db = await instance.database;
    return await db.insert(
      tableCallers,
      caller.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get all callers
  Future<List<CallerModel>> getAllCallers() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableCallers,
      orderBy: 'customName ASC',
    );
    return List.generate(maps.length, (i) {
      return CallerModel.fromMap(maps[i]);
    });
  }

  // Get a specific caller by phone number
  Future<CallerModel?> getCallerByNumber(String phoneNumber) async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableCallers,
      where: 'phoneNumber = ?',
      whereArgs: [phoneNumber],
    );

    if (maps.isNotEmpty) {
      return CallerModel.fromMap(maps.first);
    }
    return null;
  }

  // Search callers by name or phone number
  Future<List<CallerModel>> searchCallers(String query) async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableCallers,
      where: 'customName LIKE ? OR phoneNumber LIKE ?',
      whereArgs: ['%$query%', '%$query%'],
      orderBy: 'customName ASC',
    );
    return List.generate(maps.length, (i) {
      return CallerModel.fromMap(maps[i]);
    });
  }

  // Update a caller
  Future<int> updateCaller(CallerModel caller) async {
    Database db = await instance.database;
    return await db.update(
      tableCallers,
      caller.toMap(),
      where: 'id = ?',
      whereArgs: [caller.id],
    );
  }

  // Delete a caller
  Future<int> deleteCaller(int id) async {
    Database db = await instance.database;
    return await db.delete(
      tableCallers,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
