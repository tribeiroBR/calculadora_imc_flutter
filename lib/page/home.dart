import 'package:desafio_imc/classe/pessoa.dart';
import 'package:desafio_imc/page/historico_imc.dart';
import 'package:desafio_imc/utils/calculadora_imc.dart';
import 'package:flutter/material.dart';
import 'package:desafio_imc/classe/navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var alturaController = TextEditingController();
  var pesoController = TextEditingController();

  Pessoa pessoa = Pessoa(altura: 0.0, peso: 0.0);
  double imcCalculado = 0.0;

  int posicaoPagina = 0; //Índice de Guia Selecionada

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Calculadora de IMC"),
          automaticallyImplyLeading: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(children: [
            Image.asset(
              "lib/image/imc.jpg",
            ),
            const SizedBox(
              height: 25,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Altura",
                prefixIcon: Icon(Icons.height),
              ),
              controller: alturaController,
              onChanged: (text) {
                pessoa.altura = double.tryParse(text) ?? 0.0;
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Peso",
                prefixIcon: Icon(Icons.fitness_center),
              ),
              controller: pesoController,
              onChanged: (text) {
                pessoa.peso = double.tryParse(text) ?? 0.0;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                imcCalculado = calcularIMC(pessoa);
                for (var imc in pessoa.historicoIMC) {
                  debugPrint("Histórico de IMC: $imc");
                }
                pesoController.clear();
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text("Calcular IMC"),
            ),
            const SizedBox(
              height: 90,
            ),
            CustomBottomNavigationBar(
                currentIndex: posicaoPagina, // Defina o índice atual da guia
                onTap: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                  if (value == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HistoricoIMC(pessoa: pessoa)));
                  }
                }),
          ]),
        ),
      ),
    );
  }
}
