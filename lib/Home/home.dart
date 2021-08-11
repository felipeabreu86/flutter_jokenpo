import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var opcoesJogo = ["papel", "pedra", "tesoura"];
  var escolhaUsuario = -1;
  var escolhaApp = -1;

  void jogar() {
    escolhaUsuario = Random().nextInt(opcoesJogo.length);
    escolhaApp = Random().nextInt(opcoesJogo.length);
    setState(() {});
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
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App:",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset("assets/images/padrao.png"),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha uma opção abaixo:",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/images/pedra.png",
                  height: 95,
                ),
                Image.asset(
                  "assets/images/papel.png",
                  height: 95,
                ),
                Image.asset(
                  "assets/images/tesoura.png",
                  height: 95,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
