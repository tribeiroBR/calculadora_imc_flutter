class Pessoa {
  double peso = 0;
  double? altura = 0;
  List<double> historicoIMC = [];
  String? nome;

  Pessoa({this.nome, this.altura, required this.peso});

  double? get getPeso => peso;
  double? get getAltura => altura;
  List<double> get getHistoricoIMC => historicoIMC;
  String? get getNome => nome;
}
