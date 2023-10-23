import 'package:shared_preferences/shared_preferences.dart';

//Armazenar as chaves para o SharedPreference
enum StorageChaves { chaveDadoUsuarioNome, chaveDadoUsuarioAltura }

class AppStorageService {
  //Criar o set para salvar no SharedPreference:
  Future<void> _setString(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setString(chave, value);
  }

  Future<void> _setDouble(String chave, double value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setDouble(chave, value);
  }

  //Salvando os valores nas chaves criadas:
  Future<void> setNomeUsuario(String nome) async {
    await _setString(StorageChaves.chaveDadoUsuarioNome.toString(), nome);
  }

  Future<void> setAlturaUsuario(double altura) async {
    await _setDouble(StorageChaves.chaveDadoUsuarioAltura.toString(), altura);
  }

  //Criando o get para o SharedPreference:

  Future<String> _getString(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

  Future<double> _getDouble(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }

  //Criando a funão GET para recuperar os valores armazenados no SharedPreferences no APP:
  Future<String> getNomeUsuario() async {
    return _getString(StorageChaves.chaveDadoUsuarioNome.toString());
  }

  Future<double> getAlturaUsuario() async {
    return _getDouble(StorageChaves.chaveDadoUsuarioAltura.toString());
  }
}
