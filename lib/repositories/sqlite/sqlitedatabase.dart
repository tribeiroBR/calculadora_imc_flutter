import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart'; //Pacote que possibilidade utilizar o sqlite
import 'package:path/path.dart'
    as path; //Pacote que armazena o local onde ficará salvo o banco

//MAP para criar o versionamento do banco
Map<int, String> scripts = {
  1: ''' CREATE TABLE user (
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      nome TEXT,
      altura REAL,
      peso REAL
  );'''
};

class SQLiteDataBase {
  static Database? dbIMC;

  //Valida se o data base existe ou não.
  // Se ele não existir, chama o métoro para criar
  // Se ele não estiver vazio, retornar o próprio database.

  Future<Database> obterDataBase() async {
    if (dbIMC == null) {
      return await iniciarBancoDeDados();
    } else {
      return dbIMC!;
    }
  }

  //Método para iniciar o banco de dados:
  Future<Database> iniciarBancoDeDados() async {
    var db = await openDatabase(
        path.join(await getDatabasesPath(), 'database.dbIMC'),
        version: scripts.length, onCreate: (Database dbIMC, int version) async {
      for (var i = 1; i <= scripts.length; i++) {
        await dbIMC.execute(scripts[i]!);
        debugPrint(scripts[i]!);
      }
    }, onUpgrade: (Database dbIMC, int oldVersion, int newVersion) async {
      for (var i = oldVersion + 1; i <= scripts.length; i++) {
        await dbIMC.execute(scripts[i]!);
        debugPrint(scripts[i]!);
      }
    });
    return db;
  }
}
