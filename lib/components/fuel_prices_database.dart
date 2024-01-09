import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:venom/components/default_price_database.dart';
import 'package:venom/components/price_object.dart';

class PricesDatabase {
  static const _databaseName = 'prices.db';
  static const _databaseVersion = 1;

  static const table = 'fuel_prices';
  static const columnId = 'id';
  static const columnPrice = 'price';
  static const columnPlaceOfPurchase = 'place_of_purchase';

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, _databaseName);
    return await openDatabase(
      databasePath,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnPrice REAL NOT NULL,
        $columnPlaceOfPurchase TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertFuelPrice(FuelPrice fuelPrice) async {
    final db = await database;
    return await db.insert(
      table,
      fuelPrice.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<FuelPrice>> fuelPrices() async {
    final db = await database;
    final maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return FuelPrice(
        id: maps[i][columnId] as int?,
        price: maps[i][columnPrice] as double,
        placeOfPurchase: maps[i][columnPlaceOfPurchase] as String,
      );
    });
  }

  Future<FuelPrice> getFuelPrice(int id) async {
    final db = await database;
    final maps = await db.query(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return FuelPrice(
        id: maps[0][columnId] as int?,
        price: maps[0][columnPrice] as double,
        placeOfPurchase: maps[0][columnPlaceOfPurchase] as String,
      );
    } else {
      throw Exception('Fuel price not found');
    }
  }

  Future<void> deleteFuelPrice(int id) async {
    final db = await database;
    final fuelPrice = await getFuelPrice(id);
    await db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
    final defaultPriceDatabase = DefaultPriceDatabase.instance;
    final defaultPrice = await defaultPriceDatabase.defaultPrice();
    if (fuelPrice.price == double.parse(defaultPrice.fuelPrice)) {
      final fuelPrices = await fuelPricesList();
      if (fuelPrices.isNotEmpty) {
        final nextFuelPrice = fuelPrices.first;
        await defaultPriceDatabase.insertDefaultPrice(DefaultPriceObject(
          fuelPrice: nextFuelPrice.price.toString(),
          placeOfPurchase: nextFuelPrice.placeOfPurchase,
        ));
      } else {
        await defaultPriceDatabase.insertDefaultPrice(DefaultPriceObject(
          fuelPrice: '0',
          placeOfPurchase: 'No data',
        ));
      }
    }
  }

  Future<List<FuelPrice>> fuelPricesList() async {
    final db = await database;
    final maps = await db.query(
      table,
      orderBy: '$columnId DESC',
    );
    return List.generate(maps.length, (i) {
      return FuelPrice(
        id: maps[i][columnId] as int?,
        price: maps[i][columnPrice] as double,
        placeOfPurchase: maps[i][columnPlaceOfPurchase] as String,
      );
    });
  }
}
