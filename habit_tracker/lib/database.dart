// needed for Directory()
import 'dart:io';
// needed for join()

import 'package:path/path.dart';
// needed for SQL database operations
import 'package:sqflite/sqflite.dart';
// needed for getApplicationDocumentsDirectory()
import 'package:path_provider/path_provider.dart';

// database table and column names
final String tableGoals = 'goals';
final String columnId = '_id';
final String columnName = 'name';
final String columnCategory = 'category';
final String columnCurrentStatus = 'currentStatus';
final String columnGoalStatus = 'goalStatus';
final String columnStartDate = 'startDate';
final String columnFinishDate = 'finishDate';
// final String columnMeasuredFactor = 'measuredFactor';
final String columnReward = 'reward';
final String columnOnFire = 'onFire';

// data model class
class Goal {
  int id;
  String name;
  String category;
  String currentStatus;
  String goalStatus;
  String startDate;
  String finishDate;
  // String measuredFactor;
  String reward;
  String onFire;

  Goal();

  // convenience constructor to create a Goal object
  Goal.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    category = map[columnCategory];
    currentStatus = map[columnCurrentStatus];
    goalStatus = map[columnGoalStatus];
    startDate = map[columnStartDate];
    finishDate = map[columnFinishDate];
    // measuredFactor = map[columnMeasuredFactor];
    reward = map[columnReward];
    onFire = map[columnOnFire];
  }

  // convenience method to create a Map from this Goal object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnCategory: category,
      columnCurrentStatus: currentStatus,
      columnGoalStatus: goalStatus,
      columnStartDate: startDate,
      columnFinishDate: finishDate,
      // columnMeasuredFactor: measuredFactor,
      columnReward: reward,
      columnOnFire: onFire,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}

// singleton class to manage the database
class DatabaseHelper {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "MyGoalz.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    print(path);
    print('DB Path:' + path);
    // Open the database, can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableGoals (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnCategory TEXT NOT NULL,
            $columnCurrentStatus TEXT NOT NULL,
            $columnGoalStatus TEXT NOT NULL,
            $columnStartDate TEXT NOT NULL,
            $columnFinishDate TEXT NOT NULL,
            $columnReward TEXT NOT NULL,
            $columnOnFire TEXT NOT NULL
          )
          ''');
  }

  // Database helper methods:

  Future<int> insert(Goal goal) async {
    Database db = await database;
    int id = await db.insert(tableGoals, goal.toMap());
    return id;
  }

  Future<Goal> queryGoal(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tableGoals,
        columns: [
          columnId,
          columnName,
          columnCategory,
          columnCurrentStatus,
          columnGoalStatus,
          columnStartDate,
          columnFinishDate,
          // columnMeasuredFactor,
          columnReward,
          columnOnFire
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Goal.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Goal>> queryAllGoals() async {
    Database db = await database;
    List<Map> maps = await db.query(tableGoals);
    if (maps.length > 0) {
      List<Goal> goals = [];
      maps.forEach((map) => goals.add(Goal.fromMap(map)));
      return goals;
    }
    return null;
  }

  Future<int> deleteGoal(int id) async {
    Database db = await database;
    return await db.delete(tableGoals, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Goal goal) async {
    Database db = await database;
    return await db.update(tableGoals, goal.toMap(),
        where: '$columnId = ?', whereArgs: [goal.id]);
  }
}
