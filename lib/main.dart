//import 'dart:ffi';
//import 'dart:js';

import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());


class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        colorScheme: ColorScheme( //Varias coisas de cores nao funcionaram aqui
          primary: Colors.green[900],
          onPrimary: Colors.white, // Cor do "Criando transferencia" e do texto do botão confirmar
          primaryVariant: Colors.orange,

          background: Colors.blueAccent[700],
          onBackground: Colors.black,

          secondary: Colors.blueAccent[700], //Cor botao de adicionar transferencia
          onSecondary: Colors.white, //Cor do texto do botao de +
          secondaryVariant: Colors.deepOrange,

          error: Colors.black,
          onError: Colors.white,

          surface: Colors.white,
          onSurface: Colors.black, //Cor da linha do formulario

          brightness: Brightness.light,

        ),

      ),
      home: ListaTransferencias(),//Tela ou Widget que vai aparecer primeiro no App
    );
  }
}



