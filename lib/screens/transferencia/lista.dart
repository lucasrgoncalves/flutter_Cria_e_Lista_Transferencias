import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencias extends StatefulWidget {

  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias>{
  @override
  Widget build(context) {
    //widget._transferencias.add(Transferencia(100, 1000)); // Adicionando estaticamente toda vez que a tela atualizar
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar),),
      //body: Column( //Não oferece barra de rolagem...mostra erro na tela para vários itens
      //body: ListView( // Utilizado para itens estáticos..fornece rolagem no app
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice){
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.add), //Esse é o botão de +

        onPressed: () {
          //Utilizado para abrir a tela de formulario ao clicar no botao de +
          final Future future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida){
            Future.delayed(Duration(seconds: 1), () { //Funcao para fazer aparecer a transferencia após 1 segundo na lista de transferencias
              //debugPrint('Chegou no then do Future');
              //debugPrint('$transferenciaRecebida');
              if (transferenciaRecebida != null) { //Utilizar o setState também quando for utilizar o Future.delayed para garantir atualizacao da lista de transferencias
                setState(() { //Atualizando valores de transferencia a retornar para a tela transferencias
                  widget._transferencias.add(transferenciaRecebida);
                });
              }
            });
          });
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.valor.toStringAsFixed(2)),//TostringFixed para inserir dois numeros 0 caso o numero seja inteiro
          subtitle: Text(_transferencia.numeroConta.toString()),
        )
    );
  }
}