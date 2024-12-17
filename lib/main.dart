import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MaterialApp(
    home: Calculator(),
  ));
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = '';
  String result = '';
  void onButtonPressed(String values) {
    display += values;
  }

  void evaluateExpression() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(display);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        result = eval.toString();
        display = result;
      });
    } catch (e) {
      setState(() {
        display = 'error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  display,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 300.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // clear sign
                TextButton(
                  onPressed: () {
                    setState(() {
                      display = '';
                    });
                  },
                  child: const Text(
                    'c',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                // divider sign
                TextButton(
                  onPressed: () {
                    setState(() {
                      onButtonPressed('/');
                    });
                  },
                  child: const Text(
                    '÷',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                // multiplication sign
                TextButton(
                  onPressed: () {
                    setState(() {
                      onButtonPressed('*');
                    });
                  },
                  child: const Text(
                    'x',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                // backspace
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (display == 'error') {
                        display = '';
                      } else {
                        display = display.substring(0, display.length - 1);
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.backspace,
                    color: Colors.lightBlue,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      onButtonPressed('7');
                    });
                  },
                  child: const Text(
                    '7',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      onButtonPressed('8');
                    });
                  },
                  child: const Text(
                    '8',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      onButtonPressed('9');
                    });
                  },
                  child: const Text(
                    '9',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      onButtonPressed('−');
                    });
                  },
                  child: const Text(
                    '-',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.lightBlue,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      onButtonPressed('4');
                    });
                  },
                  child: const Text(
                    '4',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      onButtonPressed('5');
                    });
                  },
                  child: const Text(
                    '5',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      onButtonPressed('6');
                    });
                  },
                  child: const Text(
                    '6',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      onButtonPressed('+');
                    });
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.lightBlue,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      onButtonPressed('1');
                    });
                  },
                  child: const Text(
                    '1',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      onButtonPressed('2');
                    });
                  },
                  child: const Text(
                    '2',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      onButtonPressed('3');
                    });
                  },
                  child: const Text(
                    '3',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      evaluateExpression();
                    });
                  },
                  child: const Text(
                    '=',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.lightBlue,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      onButtonPressed('* 0.01');
                    });
                  },
                  child: const Text(
                    '%',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      onButtonPressed('0');
                    });
                  },
                  child: const Text(
                    '0',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      onButtonPressed('.');
                    });
                  },
                  child: const Text(
                    '.',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      onButtonPressed('*');
                    });
                  },
                  icon: const Icon(
                    Icons.phone_android_rounded,
                    color: Colors.lightBlue,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
