import 'dart:io';

import 'package:ecommerce/Modal/Cartmodal.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "cart_database.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE CartItems(
        id INTEGER PRIMARY KEY,
        productName TEXT,
        productQuantity INTEGER,
        productImage TEXT,
        productPrice REAL,
        initialPrice REAL,
        productDescription TEXT,
        productId TEXT,
        VariationTblId TEXT,
        Color TEXT,
        Size TEXT
       
      )
    ''');
  }

  Future<int> insertCartItem(CartItem item) async {
    var dbClient = await db;
    return await dbClient.insert("CartItems", item.toMap());
  }

  Future<List<CartItem>> getCartList() async {
    var dbClimet = await db;
    final List<Map<String, Object?>> queryResult =
        await dbClimet.query('CartItems');
    return queryResult.map((e) => CartItem.fromMap(e)).toList();
  }

  Future<List<CartItem>> getCartItems() async {
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient.query("CartItems");
    List<CartItem> cartItems = [];
    if (maps.isNotEmpty) {
      for (var map in maps) {
        cartItems.add(CartItem.fromMap(map));
      }
    }
    return cartItems;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }

  Future<int> delete(int id) async {
    var dbClimet = await db;

    return await dbClimet.delete('CartItems', where: 'id=?', whereArgs: [id]);
  }

  Future<int> updateQuantityCartItems(CartItem item) async {
    var dbClimet = await db;
    return await dbClimet!.update(
      'CartItems',
      item.toMap(),
      where: 'id=?',
      whereArgs: [item.id],
    );
  }

  void deletecartTable() async {
    final database = await openDatabase('cart_database.db');

    // Delete the table if it exists
    await database.execute('DROP TABLE IF EXISTS CartItems');

    // Close the database when done
    await database.close();
  }
}
