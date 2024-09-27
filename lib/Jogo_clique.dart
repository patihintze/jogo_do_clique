
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Jogo_clique extends StatefulWidget {
  Jogo_clique({super.key});
  final String title = "Jogo do clique";

  @override
  State<Jogo_clique> createState() => _Jogo_cliqueState();
}

class _Jogo_cliqueState extends State<Jogo_clique> {
  int _contador = 0;
  int _seconds = 10;
  Timer? _timer;
  bool _fimTempo = false;
  bool _inicioTempo = false;

  void _startTimer() {
    if (!_inicioTempo){
      _fimTempo = false;
      _inicioTempo = true;
      _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
        setState(() {
          if (_seconds > 0){
            _seconds--;
          } else {
            _timer?.cancel();
            _fimTempo = true;
          };
        });
      });
    }
  }

  void _contar(){
    setState(() {
      _contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40, bottom: 60),
            child: Text(
              "Clique no botão o máximo de vezes que conseguir!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(
              "$_contador",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            ]
          ),
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 40)),
              ElevatedButton(
                onPressed: (){
                  _contar();
                  _startTimer();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  padding: EdgeInsets.all(20),
                ),
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: 100)),
              Text(
                textAlign: TextAlign.center,
                "Tempo: $_seconds segundos",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          if (_fimTempo)
            Text(
              textAlign: TextAlign.center,
              "O tempo acabou.\n"
              "Você clicou $_contador vezes, parabéns!!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}