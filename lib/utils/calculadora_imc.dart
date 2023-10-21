import 'package:desafio_imc/classe/pessoa.dart';

double calcularIMC(Pessoa pessoa) {
  if (pessoa.altura <= 0 || pessoa.peso <= 0) {
    return 0;
  }
  double imcCalc = pessoa.peso / (pessoa.altura * pessoa.altura);

  pessoa.historicoIMC.add(imcCalc);

  return imcCalc;
}
