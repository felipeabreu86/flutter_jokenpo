import 'package:flutter/material.dart';
import 'dart:math';

enum OpcoesJogo { pedra, papel, tesoura }

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

/// Classe que implementa o estado e o layout do aplicativo
class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _resultado = "Escolha uma opção abaixo:";
  var _msgEmpate = "Parece que tivemos um empate.";
  var _msgVitoria = "Você ganhou! Parabéns!";
  var _msgDerrota = "Você perdeu... Tente novamente.";

  /// Classe que implementa a regra do jogo JokenPo
  void _jogar(OpcoesJogo escolha) {
    var _indexEscolhaApp = Random().nextInt(OpcoesJogo.values.length);
    var _escolhaApp = OpcoesJogo.values[_indexEscolhaApp];
    // Atualiza o estado das imagens e dos textos
    setState(() {
      switch (_escolhaApp) {
        case OpcoesJogo.pedra:
          _imagemApp = AssetImage("images/pedra.png");
          if (escolha.index == OpcoesJogo.pedra.index) {
            _resultado = _msgEmpate;
          } else if (escolha.index == OpcoesJogo.papel.index) {
            _resultado = _msgVitoria;
          } else {
            _resultado = _msgDerrota;
          }
          break;
        case OpcoesJogo.papel:
          _imagemApp = AssetImage("images/papel.png");
          if (escolha.index == OpcoesJogo.papel.index) {
            _resultado = _msgEmpate;
          } else if (escolha.index == OpcoesJogo.tesoura.index) {
            _resultado = _msgVitoria;
          } else {
            _resultado = _msgDerrota;
          }
          break;
        case OpcoesJogo.tesoura:
          _imagemApp = AssetImage("images/tesoura.png");
          if (escolha.index == OpcoesJogo.tesoura.index) {
            _resultado = _msgEmpate;
          } else if (escolha.index == OpcoesJogo.pedra.index) {
            _resultado = _msgVitoria;
          } else {
            _resultado = _msgDerrota;
          }
          break;
      }
    });
  }

  // Definicao do layout do aplicativo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.lightBlueAccent),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Texto - Escolha do App
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App:",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // Imagem - Escolha do App
            Image(image: this._imagemApp),
            // Texto - Escolha do usuario
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                _resultado,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // Imagens - Escolha do usuario
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _jogar(OpcoesJogo.pedra),
                  child: Image.asset("images/pedra.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => _jogar(OpcoesJogo.papel),
                  child: Image.asset("images/papel.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => _jogar(OpcoesJogo.tesoura),
                  child: Image.asset("images/tesoura.png", height: 100),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
