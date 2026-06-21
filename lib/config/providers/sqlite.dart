import 'dart:io';
import 'package:sqflite/sqflite.dart' show Database, getDatabasesPath, openDatabase;
import 'package:flutter/services.dart';
import 'package:path/path.dart' show join;

Future<Database> openAppDatabase() async {
  final dbPath = join(await getDatabasesPath(), 'app.db');

  if (await File(dbPath).exists()) {
    return openDatabase(dbPath);
  }

  final bytes = await rootBundle.load('assets/db/app.db');
  await File(dbPath).writeAsBytes(bytes.buffer.asUint8List());

  return openDatabase(dbPath);
}
