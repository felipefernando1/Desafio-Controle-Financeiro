import 'package:avaliacao_1/controller/transacao_controller.dart';
import 'package:avaliacao_1/model/transacao_model.dart';
import 'package:flutter/material.dart';

class TransacaoView extends StatefulWidget {
  const TransacaoView({super.key});

  @override
  State<TransacaoView> createState() => _TransacaoViewState();
}

class _TransacaoViewState extends State<TransacaoView> {
  final controller = TransacaoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Desafio Controle Financeiro',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return ListView.builder(
            itemCount: controller.lstTransacoes.length,
            itemBuilder: (context, index) {
              return controller.lstTransacoes.isEmpty
                  ? Center(child: Text('Nenhuma transação encontrada.'))
                  : Column(
                      children: [
                        Text(controller.lstTransacoes[index].descricao, style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(controller.lstTransacoes[index].valor.toString()),
                        Text(controller.lstTransacoes[index].tipo),
                        Text(controller.lstTransacoes[index].data.toString()),
                        const SizedBox(height: 4.0),
                        IconButton(onPressed: () {
                          controller.removerTransacao(index);
                        }, icon: Icon(Icons.delete)),
                        const SizedBox(height: 30.0),
                      ],
                    );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.adicionarTransacao(
            TransacaoModel(
              id: 1,
              descricao: 'Teste',
              valor: 10.0,
              tipo: 'entrada',
              data: DateTime.now(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
