import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_jokenpo/util/enums.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

/// Classe que implementa o estado e o layout do aplicativo
class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _tituloApp = "JokenPo";
  var _resultado = "Escolha uma opção abaixo:";
  var _msgEmpate = "Parece que tivemos um empate.";
  var _msgVitoria = "Você ganhou! Parabéns!";
  var _msgDerrota = "Você perdeu... Tente novamente.";
  var _selectedIndex = 0;
  var _resultUsuario = 0;
  var _resultApp = 0;
  var _empates = 0;

  /// Classe que implementa a regra do jogo JokenPo
  void _jogar(OpcoesJogo escolhaUsuario) {
    var _indexEscolhaApp = Random().nextInt(OpcoesJogo.values.length);
    var _escolhaApp = OpcoesJogo.values[_indexEscolhaApp];
    // Atualiza o estado das imagens e dos textos
    setState(() {
      switch (_escolhaApp) {
        case OpcoesJogo.pedra:
          _imagemApp = AssetImage("images/pedra.png");
          if (escolhaUsuario.index == OpcoesJogo.pedra.index) {
            _resultado = _msgEmpate;
            ++_empates;
          } else if (escolhaUsuario.index == OpcoesJogo.papel.index) {
            _resultado = _msgVitoria;
            ++_resultUsuario;
          } else {
            _resultado = _msgDerrota;
            ++_resultApp;
          }
          break;
        case OpcoesJogo.papel:
          _imagemApp = AssetImage("images/papel.png");
          if (escolhaUsuario.index == OpcoesJogo.papel.index) {
            _resultado = _msgEmpate;
            ++_empates;
          } else if (escolhaUsuario.index == OpcoesJogo.tesoura.index) {
            _resultado = _msgVitoria;
            ++_resultUsuario;
          } else {
            _resultado = _msgDerrota;
            ++_resultApp;
          }
          break;
        case OpcoesJogo.tesoura:
          _imagemApp = AssetImage("images/tesoura.png");
          if (escolhaUsuario.index == OpcoesJogo.tesoura.index) {
            _resultado = _msgEmpate;
            ++_empates;
          } else if (escolhaUsuario.index == OpcoesJogo.pedra.index) {
            _resultado = _msgVitoria;
            ++_resultUsuario;
          } else {
            _resultado = _msgDerrota;
            ++_resultApp;
          }
          break;
      }
    });
  }

  /// Atualiza o index do item selecionado no bottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// Definicao do layout do aplicativo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(_tituloApp),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 5, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Texto - Escolha do App
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 10),
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
                padding: EdgeInsets.only(top: 10, bottom: 16),
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
              ),
              // Placar
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: "Você "),
                      TextSpan(
                        text: "$_resultUsuario",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      TextSpan(text: " x "),
                      TextSpan(
                        text: "$_resultApp",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      TextSpan(text: " App"),
                    ],
                  ),
                ),
              ),
              Text(
                "Empates: $_empates",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
