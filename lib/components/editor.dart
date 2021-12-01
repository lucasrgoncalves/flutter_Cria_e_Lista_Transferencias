import 'package:flutter/material.dart';

class Editor extends StatelessWidget {

  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  Editor ({this.controlador, this.rotulo, this.dica, this.icone}); //Colocado {} e ? na declaracao de variaveis para que icone ficasse opcional

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(16.0),// Espaçamento Top, Buttom, Left e Right das bordas
      child: TextField(
        controller: controlador, // Informando controller que foi criado para pegar valor digitado
        style: TextStyle(fontSize: 24.0), // Alterando tamanho da fonte
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null, //Utilizada verificação para remover espaçamento começo da linha
          labelText: rotulo, // Inserindo Label
          hintText: dica, // Inserindo sugestão, semelhante ao placeholder
        ),
        keyboardType: TextInputType.number, // Forçando teclado a ficar aparecendo apenas com números
      ),
    );
  }
}