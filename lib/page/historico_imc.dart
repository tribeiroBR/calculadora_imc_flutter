import 'package:desafio_imc/classe/navigation_bar.dart';
import 'package:desafio_imc/classe/pessoa.dart';
import 'package:desafio_imc/page/home.dart';
import 'package:flutter/material.dart';

class HistoricoIMC extends StatefulWidget {
  final Pessoa pessoa; // Adicione o parâmetro pessoa ao construtor

  HistoricoIMC({required this.pessoa, Key? key}) : super(key: key);

  @override
  _HistoricoIMCState createState() => _HistoricoIMCState();
}

class _HistoricoIMCState extends State<HistoricoIMC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Histórico IMC"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Card(
            elevation: 8,
            child: Column(
              children: widget.pessoa.getHistoricoIMC.map((imc) {
                return ListTile(
                    // title: Text("Medidas de IMC: ${imc.toStringAsFixed(2)}"),
                    title: Text.rich(TextSpan(
                        text: "Medidas de IMC: ",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold), // Estilo padrão
                        children: [
                      TextSpan(
                          text: imc.toStringAsFixed(2),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: imc < 16
                                  ? Colors.red
                                  : (imc > 25
                                      ? Colors.red
                                      : (imc >= 16 && imc < 18
                                          ? Colors.yellow
                                          : Colors
                                              .green))) // Texto do IMC em negrito
                          )
                    ])));
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onTap: (value) {
          if (value == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
          }
        },
      ),
    );
  }
}
