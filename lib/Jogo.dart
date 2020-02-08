import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _resultado = "Escolha uma opção abaixo:";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("JokenPo"),
        ),
        body: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.lightBlueAccent)),
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
              Image.asset("images/padrao.png"),
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
                  Image.asset("images/pedra.png", height: 100),
                  Image.asset("images/papel.png", height: 100),
                  Image.asset("images/tesoura.png", height: 100),
                ],
              )
            ],
          ),
        ));
  }
}
