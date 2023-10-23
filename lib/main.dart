import 'package:desafio_imc/my_app.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //Força a reinicialização quando configurado o banco SQLITE.

  runApp(const MyApp());
}
