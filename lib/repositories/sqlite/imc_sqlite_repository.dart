import 'package:desafio_imc/model/imc_sqlite_model.dart';
import 'package:desafio_imc/repositories/sqlite/sqlitedatabase.dart';

class IMCSQLiteRepository {
  Future<List<IMCSQLiteModel>> obterDados() async {
    List<IMCSQLiteModel> home = [];
    var dbIMC = await SQLiteDataBase().obterDataBase();
    var result =
        await dbIMC.rawQuery('SELECT id, nome, altura, peso from user');
    for (var element in result) {
      home.add(IMCSQLiteModel(
          int.parse(element["id"].toString()),
          element["nome"].toString(),
          double.parse(element["altura"].toString()),
          double.parse(element["peso"].toString())));
    }
    return home;
  }

  Future<void> salvar(IMCSQLiteModel imcsqLiteModel) async {
    var dbIMC = await SQLiteDataBase().obterDataBase();
    await dbIMC.rawInsert('INSERT INTO user (nome, altura, peso) values(?,?)',
        [imcsqLiteModel.nome, imcsqLiteModel.altura, imcsqLiteModel.peso]);
  }

  Future<void> update(IMCSQLiteModel imcsqLiteModel) async {
    var dbIMC = await SQLiteDataBase().obterDataBase();
    await dbIMC
        .rawInsert('UPDATE user SET nome =?, altura =?, peso =? WHERE id = ?', [
      imcsqLiteModel.nome,
      imcsqLiteModel.altura,
      imcsqLiteModel.peso,
      imcsqLiteModel.id
    ]);
  }

  Future<void> delete(int id) async {
    var dbIMC = await SQLiteDataBase().obterDataBase();
    await dbIMC.rawInsert('DELETE user WHERE id = ?', [id]);
  }
}
