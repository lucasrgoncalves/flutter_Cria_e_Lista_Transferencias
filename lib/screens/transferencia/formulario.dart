import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

//Criação das constantes para melhoria do código
const _tituloAppBar = 'Criando Transferência';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _rotuloCampoNumeroConta = 'Número da Conta';
const _dicaCampoNumeroConta = '0000';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia>{
  final TextEditingController _controladorCampoNumeroConta = TextEditingController(); //Criando variáveis para pegar valor digitado
  final TextEditingController _controladorCampoValor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_tituloAppBar),), //Titulo da parte superior do App
        body: SingleChildScrollView(// Vai abrigar a coluna para que funcione o app na horizontal ou vertical
          child: Column( //Coluna que vai abrigar o esqueleto do App
            children: <Widget>[
              Editor(controlador: _controladorCampoNumeroConta, rotulo: _rotuloCampoNumeroConta, dica: _dicaCampoNumeroConta),
              Editor(controlador: _controladorCampoValor, rotulo: _rotuloCampoValor, dica: _dicaCampoValor, icone: Icons.monetization_on),
              const SizedBox(height: 30),
              ElevatedButton( // Substitui o RaisedButton que está deprecated
                onPressed: () {
                  //debugPrint('clicou no confirmar');
                  //debugPrint(_controladorCampoNumeroConta.text);
                  _criaTransferencia(context);
                },
                child: const Text(_textoBotaoConfirmar), // Inserindo nome no botão
              ),
            ],
          ),
        )
    );
  }

  void _criaTransferencia(BuildContext context) {
    final numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final valor = double.tryParse(_controladorCampoValor.text);

    if(numeroConta != null && valor != null){
      final transferenciaCriada = Transferencia(valor, numeroConta);
      //debugPrint('Criando transferência');
      //debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada); //Volta para a tela anterior que lista as transferencias
    }
  }
}