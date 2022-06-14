import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomRight,
                color: Colors.black,
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 100),
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.black,
                child: Column(children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          calcButton('AC', Colors.white60, Colors.black, 80),
                          calcButton('7', Colors.white38, Colors.white, 80),
                          calcButton('4', Colors.white38, Colors.white, 80),
                          calcButton('1', Colors.white38, Colors.white, 80),
                        ],
                      ),
                      Column(
                        children: [
                          calcButton('+/-', Colors.white60, Colors.black, 80),
                          calcButton('8', Colors.white38, Colors.white, 80),
                          calcButton('5', Colors.white38, Colors.white, 80),
                          calcButton('2', Colors.white38, Colors.white, 80),
                        ],
                      ),
                      Column(
                        children: [
                          calcButton('%', Colors.white60, Colors.black, 80),
                          calcButton('9', Colors.white38, Colors.white, 80),
                          calcButton('6', Colors.white38, Colors.white, 80),
                          calcButton('3', Colors.white38, Colors.white, 80),
                        ],
                      ),
                      Column(
                        children: [
                          calcButton('/', Colors.orange, Colors.white, 80),
                          calcButton('x', Colors.orange, Colors.white, 80),
                          calcButton('-', Colors.orange, Colors.white, 80),
                          calcButton('+', Colors.orange, Colors.white, 80),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      calcButton('0', Colors.white38, Colors.white, 175),
                      calcButton('.', Colors.white38, Colors.white, 80),
                      calcButton('=', Colors.white38, Colors.white, 80)
                    ],
                  )
                ]),
              ))
        ],
      ),
    );
  }

  Widget calcButton(String text, Color colour, Color tcolor, double size) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () => btnClicked(text),
        child: Container(
          height: 80,
          width: size,
          decoration: BoxDecoration(
              color: colour, borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Text(text, style: TextStyle(color: tcolor, fontSize: 45)),
          ),
        ),
      ),
    );
  }

  String res = '';
  String text = '';
  late int first;
  late int second;
  late String opp;
  void btnClicked(String btnText) {
    if (btnText == 'AC') {
      res = '';
      text = '';
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/') {
      first = int.parse(text);
      res = '';
      opp = btnText;
    } else if (btnText == '=') {
      second = int.parse(text);
      if (opp == '+') {
        res = (first + second).toString();
      }
      if (opp == '-') {
        res = (first - second).toString();
      }
      if (opp == 'x') {
        res = (first * second).toString();
      }
      if (opp == '/') {
        res = (first ~/ second).toString();
      }
      if (opp == '%') {
        res = (first % second).toString();
      }
    } else {
      res = int.parse(text + btnText).toString();
    }

    setState(() {
      text = res;
    });
  }
}
