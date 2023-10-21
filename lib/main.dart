import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String input = "";
  String result = "";
  bool darkMode = false;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        input = "";
        result = "";
      } else if (buttonText == "=") {
        try {
          result = evaluarExpresion(input).toString();
        } catch (e) {
          result = "Error";
        }
      } else {
        input += buttonText;
      }
    });
  }

  void _calcularRaizCuadrada(String buttonText) {
    setState(() {
      try {
        if (input.isNotEmpty) {
          final inputNumber = double.parse(input);
          result = (inputNumber >= 0) ? (sqrt(inputNumber)).toString() : "Error";
          input = "";
        }
      } catch (e) {
        result = "Error";
      }
    });
  }

  double evaluarExpresion(String expresion) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expresion);
      ContextModel cm = ContextModel();
      return exp.evaluate(EvaluationType.REAL, cm);
    } catch (e) {
      return double.nan;
    }
  }

  void _toggleDarkMode() {
    setState(() {
      darkMode = !darkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: darkMode
          ? ThemeData.dark()
          : ThemeData(
              primarySwatch: Colors.blue,
            ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Text(
                input,
                style: TextStyle(fontSize: 24),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Text(
                result,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              child: IconButton(
                icon: Icon(
                  darkMode ? Icons.brightness_4 : Icons.brightness_7,
                  color: Colors.black,
                ),
                onPressed: _toggleDarkMode,
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return CalculatorButton(
                      text: "C",
                      fillColor: Colors.orange,
                      textColor: Colors.white,
                      callback: _buttonPressed,
                    );
                  } else if (index == 15) {
                    return CalculatorButton(
                      text: "+",
                      fillColor: Colors.black54,
                      textColor: Colors.white,
                      callback: _buttonPressed,
                    );
                  } else if (index == 11) {
                    return CalculatorButton(
                      text: "-",
                      fillColor: Colors.black54,
                      textColor: Colors.white,
                      callback: _buttonPressed,
                    );
                  } else if (index == 7) {
                    return CalculatorButton(
                      text: "*",
                      fillColor: Colors.black54,
                      textColor: Colors.white,
                      callback: _buttonPressed,
                    );
                  } else if (index == 3) {
                    return CalculatorButton(
                      text: "/",
                      fillColor: Colors.black54,
                      textColor: Colors.white,
                      callback: _buttonPressed,
                    );
                  } else if (index == 2) {
                    return CalculatorButton(
                      text: "√",
                      fillColor: Colors.black54,
                      textColor: Colors.white,
                      callback: _calcularRaizCuadrada,
                    );
                  } else if (index == 4) {
                    return CalculatorButton(
                      text: "7",
                      fillColor: Colors.white,
                      callback: _buttonPressed,
                    );
                  } else if (index == 5) {
                    return CalculatorButton(
                      text: "8",
                      fillColor: Colors.white,
                      callback: _buttonPressed,
                    );
                  } else if (index == 6) {
                    return CalculatorButton(
                      text: "9",
                      fillColor: Colors.white,
                      callback: _buttonPressed,
                    );
                  } else if (index == 8) {
                    return CalculatorButton(
                      text: "4",
                      fillColor: Colors.white,
                      callback: _buttonPressed,
                    );
                  } else if (index == 9) {
                    return CalculatorButton(
                      text: "5",
                      fillColor: Colors.white,
                      callback: _buttonPressed,
                    );
                  } else if (index == 10) {
                    return CalculatorButton(
                      text: "6",
                      fillColor: Colors.white,
                      callback: _buttonPressed,
                    );
                  } else if (index == 12) {
                    return CalculatorButton(
                      text: "1",
                      fillColor: Colors.white,
                      callback: _buttonPressed,
                    );
                  } else if (index == 13) {
                    return CalculatorButton(
                      text: "2",
                      fillColor: Colors.white,
                      callback: _buttonPressed,
                    );
                  } else if (index == 14) {
                    return CalculatorButton(
                      text: "3",
                      fillColor: Colors.white,
                      callback: _buttonPressed,
                    );
                  } else if (index == 17) {
                    return CalculatorButton(
                      text: ".",
                      fillColor: Colors.white,
                      callback: _buttonPressed,
                    );
                  } else if (index == 16) {
                    return CalculatorButton(
                      text: "0",
                      fillColor: Colors.white,
                      callback: _buttonPressed,
                    );
                  } else if (index == 1) {
                    return CalculatorButton(
                      text: "00",
                      fillColor: Colors.orange,
                      textColor: Colors.white,
                      callback: _buttonPressed,
                    );
                  } else if (index == 18) {
                    return CalculatorButton(
                      text: "=",
                      fillColor: Colors.orange,
                      textColor: Colors.white,
                      callback: _buttonPressed,
                    );
                  }
                  return Container();
                },
                itemCount: 19, // Aumenta el itemCount a 19 para incluir el botón de la raíz cuadrada.
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color fillColor;
  final Color textColor;
  final Function callback;

  CalculatorButton({
    required this.text,
    this.fillColor = Colors.white,
    this.textColor = Colors.black,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback(text);
      },
      child: Material( // Agregamos un Material alrededor del botón
        elevation: 4, // Configuramos la elevación para la sombra
        borderRadius: BorderRadius.circular(8),
        color: fillColor,
        child: InkWell( // Envolvemos el botón en un InkWell para que sea táctil
          onTap: () {
            callback(text);
          },
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 24,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
