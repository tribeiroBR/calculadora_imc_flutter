class IMCSQLiteModel {
  int _id = 0;
  String _nome = "";
  double _altura = 0;
  double _peso = 0;

  //construtor da classe
  IMCSQLiteModel(this._id, this._nome, this._altura, this._peso);

  //Criando os get's para recuperar os valores
  int get id => _id;
  String get nome => _nome;
  double get altura => _altura;
  double get peso => _peso;

  //Criando o set para salvar / incluir valores
  set id(int id) {
    _id = id;
  }

  set nome(String nome) {
    _nome = nome;
  }

  set altura(double altura) {
    _altura = altura;
  }

  set peso(double peso) {
    _peso = peso;
  }
}
