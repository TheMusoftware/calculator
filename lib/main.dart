import 'package:calculator/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

/* Variables */
num _num1 = 0;
num _num2 = 0;
String _num1Holder = "0";
String _num2Holder = "";
String _operationKey = "";
bool _isClickOperationKey = false;

void main() {
  runApp(calculator());
}

void addNum(int num) {
  if (!_isClickOperationKey) {
    if (_num1Holder.startsWith('0') && !_num1Holder.startsWith('0.'))
      _num1Holder = '';
    _num1Holder = '$_num1Holder$num';
    if (_num1Holder.startsWith('-') && _num1Holder.startsWith('0', 1)) {
      _num1Holder = _num1Holder.replaceFirst('0', '', 1);
    }
  } else {
    _num2Holder = '$_num2Holder$num';
  }
}

void operationKeyPress(String opKey) {
  if (!_isClickOperationKey) {
    _isClickOperationKey = true;
    _operationKey = opKey;
    if (_num1Holder.startsWith('-')) {
      _num1 = double.parse(_num1Holder.substring(1, _num1Holder.length)) * -1;
    } else {
      _num1 = double.parse(_num1Holder);
    }
  }
}

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: HexColor(navy),
          body: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(top: 110),
                padding: const EdgeInsets.all(24),
                height: 120,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '$_num1Holder$_operationKey$_num2Holder',
                    style: TextStyle(
                      fontSize: 48,
                      color: HexColor(sun),
                    ),
                  ),
                ),
              ),

              const Divider(),

              // 1ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("  "),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _num1Holder = "0";
                          _num2Holder = "";
                          _operationKey = "";
                          _isClickOperationKey = false;
                          _num1 = 0;
                          _num2 = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          backgroundColor: HexColor(orange),
                          foregroundColor: Colors.white),
                      child: const Text(
                        'C',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  ),
                  const Text("  "),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (!_isClickOperationKey) {
                            if (!_num1Holder.startsWith('-')) {
                              _num1Holder = '-$_num1Holder';
                            } else {
                              _num1Holder =
                                  _num1Holder.substring(1, _num1Holder.length);
                            }
                          } else {
                            if (!_num2Holder.startsWith('-')) {
                              _num2Holder = '-$_num2Holder';
                            } else {
                              _num2Holder =
                                  _num2Holder.substring(1, _num2Holder.length);
                            }
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                      ),
                      child: const Icon(CupertinoIcons.minus_slash_plus),
                    ),
                  ),
                  const Text("  "),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (!_isClickOperationKey) {
                            _num1Holder = _num1Holder.substring(
                                0, _num1Holder.length - 1);
                          } else {
                            if (_num2Holder.isEmpty) {
                              _isClickOperationKey = false;
                              _operationKey = '';
                            } else {
                              _num2Holder = _num2Holder.substring(
                                  0, _num2Holder.length - 1);
                            }
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                      ),
                      child: const Icon(CupertinoIcons.delete_left_fill),
                    ),
                  ),
                  const Text("  "),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operationKeyPress('/');
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                      ),
                      child: const Icon(CupertinoIcons.divide),
                    ),
                  ),
                  const Text("  "),
                ],
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0),
                child: Divider(
                  color: Colors.transparent,
                  thickness: 1,
                ),
              ),

              //2ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("  "),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          addNum(7);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24), // Butonun yüksekliği
                      ),
                      child: const Text(
                        '7',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  ),
                  const Text("  "),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          addNum(8);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24), // Butonun yüksekliği
                      ),
                      child: const Text(
                        '8',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  ),
                  const Text("  "),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          addNum(9);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24), // Butonun yüksekliği
                      ),
                      child: const Text(
                        '9',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  ),
                  const Text("  "),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operationKeyPress('x');
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                      ),
                      child: const Icon(
                        CupertinoIcons.multiply,
                        size: 24,
                      ),
                    ),
                  ),
                  const Text("  "),
                ],
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0),
                child: Divider(
                  color: Colors.transparent,
                  thickness: 1,
                ),
              ),
              //3ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("  "),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          addNum(4);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24), // Butonun yüksekliği
                      ),
                      child: const Text(
                        '4',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  ),
                  const Text("  "),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          addNum(5);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24), // Butonun yüksekliği
                      ),
                      child: const Text(
                        '5',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  ),
                  const Text("  "),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          addNum(6);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24), // Butonun yüksekliği
                      ),
                      child: const Text(
                        '6',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  ),
                  const Text("  "),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operationKeyPress('-');
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                      ),
                      child: const Icon(CupertinoIcons.minus, size: 24),
                    ),
                  ),
                  const Text("  "),
                ],
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0),
                child: Divider(
                  color: Colors.transparent,
                  thickness: 1,
                ),
              ),
              //4ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("  "),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          addNum(1);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24), // Butonun yüksekliği
                      ),
                      child: const Text(
                        '1',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  ),
                  const Text("  "),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          addNum(2);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24), // Butonun yüksekliği
                      ),
                      child: const Text(
                        '2',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  ),
                  const Text("  "),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          addNum(3);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24), // Butonun yüksekliği
                      ),
                      child: const Text(
                        '3',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  ),
                  const Text("  "),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operationKeyPress('+');
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                      ),
                      child: const Icon(CupertinoIcons.plus),
                    ),
                  ),
                  const Text("  "),
                ],
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0),
                child: Divider(
                  color: Colors.transparent,
                  thickness: 1,
                ),
              ),
              //5ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("  "), // Sol boşluk

                  // 0 butonu, 2 birim yer kaplayacak
                  Expanded(
                    flex: 2, // Bu buton 2 birim yer kaplar
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (!_isClickOperationKey) {
                            if (_num1Holder.isNotEmpty &&
                                !_num1Holder.startsWith('0')) {
                              _num1Holder = '${_num1Holder}0';
                            }
                          } else {
                            _num2Holder = '${_num2Holder}0';
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24), // Butonun yüksekliği
                      ),
                      child: const Text(
                        '0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  ),

                  const Text("  "), // Boşluk

                  // . butonu, 1 birim yer kaplayacak
                  Expanded(
                    flex: 1, // Bu buton 1 birim yer kaplar
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (!_isClickOperationKey) {
                            if (!_num1Holder.contains('.'))
                              _num1Holder = '$_num1Holder.';
                          } else {
                            if (_num2Holder.isEmpty) {
                              _num2Holder = '0';
                            }
                            if (!_num2Holder.contains('.'))
                              _num2Holder = '$_num2Holder.';
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                      ),
                      child: const Text(
                        '.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  ),

                  const Text("  "), // Boşluk

                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_isClickOperationKey) {
                            if (_num2Holder.startsWith('-')) {
                              _num2 = double.parse(_num2Holder.substring(
                                      1, _num2Holder.length)) *
                                  -1;
                            } else {
                              _num2 = double.parse(_num2Holder);
                            }

                            switch (_operationKey) {
                              case '+':
                                {
                                  _num1 = _num1 + _num2;
                                }
                              case '-':
                                {
                                  _num1 = _num1 - _num2;
                                }
                              case 'x':
                                {
                                  _num1 = _num1 * _num2;
                                }
                              case '/':
                                {
                                  if (_num2 == 0) {
                                    _num1Holder = 'Error';
                                    _num2Holder = '';
                                    _operationKey = '';
                                    _isClickOperationKey = false;
                                    return;
                                  } else {
                                    _num1 = _num1 / _num2;
                                  }
                                }
                            }

                            if (_num1 % 1 == 0)
                              _num1Holder = _num1.toInt().toString();
                            else {
                              _num1Holder = _num1.toString();
                            }
                            _num2Holder = '';
                            _operationKey = '';
                            _isClickOperationKey = false;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                      ),
                      child: const Icon(
                        CupertinoIcons.equal,
                        size: 24,
                      ),
                    ),
                  ),

                  const Text("  "), // Boşluk
                ],
              ),
            ],
          )),
    );
  }
}
