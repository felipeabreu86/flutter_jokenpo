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
          } else if (escolhaUsuario.index == OpcoesJogo.papel.index) {
            _resultado = _msgVitoria;
          } else {
            _resultado = _msgDerrota;
          }
          break;
        case OpcoesJogo.papel:
          _imagemApp = AssetImage("images/papel.png");
          if (escolhaUsuario.index == OpcoesJogo.papel.index) {
            _resultado = _msgEmpate;
          } else if (escolhaUsuario.index == OpcoesJogo.tesoura.index) {
            _resultado = _msgVitoria;
          } else {
            _resultado = _msgDerrota;
          }
          break;
        case OpcoesJogo.tesoura:
          _imagemApp = AssetImage("images/tesoura.png");
          if (escolhaUsuario.index == OpcoesJogo.tesoura.index) {
            _resultado = _msgEmpate;
          } else if (escolhaUsuario.index == OpcoesJogo.pedra.index) {
            _resultado = _msgVitoria;
          } else {
            _resultado = _msgDerrota;
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
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.lightBlue),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Principal'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('Placar'),
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.deepPurple,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
