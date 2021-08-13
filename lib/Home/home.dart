import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var imagemApp = AssetImage("assets/images/padrao.png");
  var mensagem = "Escolha uma opção abaixo:";
  int vitorias = 0;
  int derrotas = 0;
  int empates = 0;

  void validarJogada(String escolhaUsuario) {
    var opcoesJogo = ["papel", "pedra", "tesoura"];
    var escolhaApp = opcoesJogo[Random().nextInt(opcoesJogo.length)];

    // Atualização da escolha do app
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this.imagemApp = AssetImage("assets/images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this.imagemApp = AssetImage("assets/images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this.imagemApp = AssetImage("assets/images/tesoura.png");
        });
        break;
    }

    // Validação do vencedor
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this.vitorias++;
        this.mensagem = "Parabéns!!! Você ganhou :)";
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        this.derrotas++;
        this.mensagem = "Você perdeu :(";
      });
    } else {
      setState(() {
        this.empates++;
        this.mensagem = "Empatamos ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "JokenPo",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 0),
                      child: Text(
                        "Escolha do App:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Image(image: this.imagemApp),
                    Padding(
                      padding: EdgeInsets.only(top: 32, bottom: 16),
                      child: Text(
                        this.mensagem,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => validarJogada("pedra"),
                          child: Image.asset(
                            "assets/images/pedra.png",
                            height: 100,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => validarJogada("papel"),
                          child: Image.asset(
                            "assets/images/papel.png",
                            height: 100,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => validarJogada("tesoura"),
                          child: Image.asset(
                            "assets/images/tesoura.png",
                            height: 100,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 3, color: Colors.black26),
                                color: Colors.black12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Você: $vitorias",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                                Text(
                                  "App: $derrotas",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                                Text(
                                  "Empates: $empates",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
