import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String equel = '0';
String result = '';
String expresion = '';

class _HomeState extends State<Home> {
  void myfun(btntext) {
    setState(() {
      if (btntext == 'C') {
        equel = '0';
        btntext = '0';
      }
      if (btntext == '=') {
        expresion = equel;
        expresion = expresion.replaceAll('×', '*');
        expresion = expresion.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expresion);
          ContextModel cm = ContextModel();
          equel = "${exp.evaluate(EvaluationType.REAL, cm)}";
        } catch (e) {
          equel = "Error";
        }
      } else {
        if (equel == '0') {
          equel = btntext;
        } else {
          equel = equel + btntext;
        }
      }
    });
  }

  Widget buildbtn(
    String btntext,
    Color color,
    Color textcolor,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          myfun(btntext);
        });
      },
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(80),
          ),
          color: color,
        ),
        child: Center(
          child: Text(
            btntext,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: textcolor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 180,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 60,
                child: Text(
                  equel,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildbtn(
                    'C',
                    const Color.fromRGBO(
                      217,
                      217,
                      217,
                      1,
                    ),
                    Colors.black,
                  ),
                  buildbtn(
                    'DEL',
                    const Color.fromRGBO(217, 217, 217, 1),
                    Colors.black,
                  ),
                  buildbtn(
                    '%',
                    const Color.fromRGBO(217, 217, 217, 1),
                    Colors.black,
                  ),
                  buildbtn(
                    '÷',
                    const Color.fromRGBO(254, 194, 96, 1),
                    Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildbtn(
                    '1',
                    const Color.fromRGBO(4, 28, 50, 1),
                    Colors.white,
                  ),
                  buildbtn(
                    '2',
                    const Color.fromRGBO(4, 28, 50, 1),
                    Colors.white,
                  ),
                  buildbtn(
                    '3',
                    const Color.fromRGBO(4, 28, 50, 1),
                    Colors.white,
                  ),
                  buildbtn(
                    '×',
                    const Color.fromRGBO(4, 28, 50, 1),
                    Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildbtn(
                    '4',
                    const Color.fromRGBO(4, 28, 50, 1),
                    Colors.white,
                  ),
                  buildbtn(
                    '5',
                    const Color.fromRGBO(4, 28, 50, 1),
                    Colors.white,
                  ),
                  buildbtn(
                    '6',
                    const Color.fromRGBO(4, 28, 50, 1),
                    Colors.white,
                  ),
                  buildbtn(
                    '-',
                    const Color.fromRGBO(4, 28, 50, 1),
                    Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildbtn(
                    '7',
                    const Color.fromRGBO(4, 28, 50, 1),
                    Colors.white,
                  ),
                  buildbtn(
                    '8',
                    const Color.fromRGBO(4, 28, 50, 1),
                    Colors.white,
                  ),
                  buildbtn(
                    '9',
                    const Color.fromRGBO(4, 28, 50, 1),
                    Colors.white,
                  ),
                  buildbtn(
                    '+',
                    const Color.fromRGBO(4, 28, 50, 1),
                    Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        equel = '${equel}0';
                      });
                    },
                    child: Container(
                      width: 170,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: const Color(0xffd9d9d9),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                        child: Text(
                          "0",
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  buildbtn(
                    '.',
                    const Color.fromRGBO(4, 28, 50, 1),
                    Colors.white,
                  ),
                  buildbtn(
                    '=',
                    const Color.fromRGBO(4, 28, 50, 1),
                    Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
