import 'package:avaliacao_1/model/transacao_model.dart';
import 'package:flutter/material.dart';

class TransacaoController extends ChangeNotifier{
    var lstTransacoes = <TransacaoModel>[];
    var id = 1;

    void adicionarTransacao(TransacaoModel transacao) {

        if(transacao.valor <= 0.0 && transacao.descricao.trim().isEmpty && transacao.tipo == 'entrada') {
            throw Exception('Valor inválido ou descrição vazia');
        }
        
        lstTransacoes.add(transacao);
        id++;
        notifyListeners();
    }

    List<TransacaoModel> consultarTransacao() {
        return lstTransacoes;
    }

    void atualizarTransacao(int index, TransacaoModel transacao) {
      
      if (index < 0 || index >= lstTransacoes.length) {
        throw Exception('Índice inválido');
      }

      lstTransacoes[index] = transacao;
      notifyListeners();
    }

    void removerTransacao(int index) {

        lstTransacoes.removeAt(index);
        notifyListeners();
    }
}