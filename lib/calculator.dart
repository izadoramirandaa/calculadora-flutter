import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'memory.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final memory = Memory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildDisplay(),
          Divider(
            height: 0.2,
          ),
          _buildKeyboard(),
        ],
      ),
    );
  }

  _buildDisplay() {
    return Expanded(
      child: Container(
          color: Colors.black,          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  memory.result,
                  maxLines: 1,
                  minFontSize: 20.0,
                  maxFontSize: 80.0,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 80.0,
                      color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }

  _buildKeyboard() {
    return Container(
      color: Colors.black,
      height: 400.0,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildButton('AC', textColor: Colors.deepOrange),
                _buildButton('DEL', textColor: Colors.deepOrange),
                _buildButton('%', textColor: Colors.deepOrange),
                _buildButton('/', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildButton('7'),
                _buildButton('8'),
                _buildButton('9'),
                _buildButton('x', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildButton('4'),
                _buildButton('5'),
                _buildButton('6'),
                _buildButton('+', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildButton('1'),
                _buildButton('2'),
                _buildButton('3'),
                _buildButton('-', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildButton('0', flex: 2),
                _buildButton('.'),
                _buildButton('=', textColor: Colors.deepOrange),
              ],
            ),
          ),
          
        ],
      ),
    );
  }

  _buildButton(
    String label, {
    Color bgColor = Colors.black,
    Color textColor = Colors.white,
    int flex = 1,
  }) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
        color: bgColor,
        child: Text(
          label,
          style: TextStyle(fontSize: 24.0, color: textColor),
        ),
        onPressed: () {
          setState(() {
           memory.applyComand(label); 
          });          
        },
      ),
    );
  }
}
