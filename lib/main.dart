import 'package:calculator/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(calculator());
}


class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  num _num1 = 0;
  num _num2 = 0;
  num _result = 0;
  String _num1Holder = "";
  String _num2Holder = "";
  String _operationKey = "";
  bool _isClickOperationKey = false;
  bool _isClickResKey = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(16),
            child: Text(
              '$_num1Holder$_operationKey$_num2Holder',
              style: const TextStyle(fontSize: 48),
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
                      _num1Holder = "";
                      _num2Holder = "";
                      _operationKey = "";
                      _isClickOperationKey = false;
                      _isClickResKey = false;
                      _num1 = 0;
                      _num2 = 0;
                      _result = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24), // Butonun yüksekliği
                  ),
                  child: const Text(
                    'C',
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                        _num1Holder =
                            _num1Holder.substring(0, _num1Holder.length - 1);
                      } else {
                        if (_num2Holder.isEmpty) {
                          _isClickOperationKey = false;
                          _operationKey = '';
                        } else {
                          _num2Holder =
                              _num2Holder.substring(0, _num2Holder.length - 1);
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
                      if (!_isClickOperationKey) {
                        _isClickOperationKey = true;
                        _operationKey = '/';
                        if (_num1Holder.startsWith('-')) {
                          _num1Holder =
                              _num1Holder.substring(1, _num1Holder.length);
                          _num1 = double.parse(_num1Holder)*-1;
                        } else {
                          _num1 = double.parse(_num1Holder);
                        }
                      }
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
          const Divider(
            color: Colors.transparent,
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
                      if (!_isClickOperationKey) {
                        _num1Holder = '${_num1Holder}7';
                      } else {
                        _num2Holder = '${_num2Holder}7';
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24), // Butonun yüksekliği
                  ),
                  child: const Text(
                    '7',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Text("  "),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (!_isClickOperationKey) {
                        _num1Holder = '${_num1Holder}8';
                      } else {
                        _num2Holder = '${_num2Holder}8';
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24), // Butonun yüksekliği
                  ),
                  child: const Text(
                    '8',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Text("  "),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (!_isClickOperationKey) {
                        _num1Holder = '${_num1Holder}9';
                      } else {
                        _num2Holder = '${_num2Holder}9';
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24), // Butonun yüksekliği
                  ),
                  child: const Text(
                    '9',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Text("  "),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (!_isClickOperationKey) {
                        _isClickOperationKey = true;
                        _operationKey = 'x';
                        if (_num1Holder.startsWith('-')) {
                          _num1Holder =
                              _num1Holder.substring(1, _num1Holder.length);
                          _num1 = double.parse(_num1Holder)*-1;
                        } else {
                          _num1 = double.parse(_num1Holder);
                        }
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                  ),
                  child: const Icon(CupertinoIcons.multiply),
                ),
              ),
              const Text("  "),
            ],
          ),
          const Divider(
            color: Colors.transparent,
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
                      if (!_isClickOperationKey) {
                        _num1Holder = '${_num1Holder}4';
                      } else {
                        _num2Holder = '${_num2Holder}4';
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24), // Butonun yüksekliği
                  ),
                  child: const Text(
                    '4',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Text("  "),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (!_isClickOperationKey) {
                        _num1Holder = '${_num1Holder}5';
                      } else {
                        _num2Holder = '${_num2Holder}5';
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24), // Butonun yüksekliği
                  ),
                  child: const Text(
                    '5',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Text("  "),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (!_isClickOperationKey) {
                        _num1Holder = '${_num1Holder}6';
                      } else {
                        _num2Holder = '${_num2Holder}6';
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24), // Butonun yüksekliği
                  ),
                  child: const Text(
                    '6',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Text("  "),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (!_isClickOperationKey) {
                        _isClickOperationKey = true;
                        _operationKey = '-';
                        if (_num1Holder.startsWith('-')) {


                          _num1 = double.parse(_num1Holder.substring(1, _num1Holder.length))*-1;
                        } else {
                          _num1 = double.parse(_num1Holder);
                        }
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                  ),
                  child: const Icon(CupertinoIcons.minus),
                ),
              ),
              const Text("  "),
            ],
          ),
          const Divider(
            color: Colors.transparent,
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
                      if (!_isClickOperationKey) {
                        _num1Holder = '${_num1Holder}1';
                      } else {
                        _num2Holder = '${_num2Holder}1';
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24), // Butonun yüksekliği
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Text("  "),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (!_isClickOperationKey) {
                        _num1Holder = '${_num1Holder}2';
                      } else {
                        _num2Holder = '${_num2Holder}2';
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24), // Butonun yüksekliği
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Text("  "),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (!_isClickOperationKey) {
                        _num1Holder = '${_num1Holder}3';
                      } else {
                        _num2Holder = '${_num2Holder}3';
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24), // Butonun yüksekliği
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Text("  "),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (!_isClickOperationKey) {
                        _isClickOperationKey = true;
                        _operationKey = '+';
                        if (_num1Holder.startsWith('-')) {
                          _num1Holder =
                              _num1Holder.substring(1, _num1Holder.length);
                          _num1 = double.parse(_num1Holder);
                        } else {
                          _num1 = double.parse(_num1Holder);
                        }
                      }
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
          const Divider(
            color: Colors.transparent,
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
                        if (_num1Holder.isNotEmpty) {
                          _num1Holder = '${_num1Holder}0';
                        }
                      } else {
                        if (_num2Holder.isNotEmpty) {
                          _num2Holder = '${_num2Holder}0';
                        }
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 24), // Butonun yüksekliği
                  ),
                  child: const Text(
                    '0',
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                        if (_num1Holder.isEmpty) {
                          _num1Holder = '0';
                        }
                        _num1Holder = '$_num1Holder.';
                      } else {
                        if (_num2Holder.isEmpty) {
                          _num2Holder = '0';
                        }
                        _num2Holder = '$_num2Holder.';
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                  ),
                  child: const Text(
                    '.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const Text("  "), // Boşluk


              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if(_isClickOperationKey){
                        if (_num2Holder.startsWith('-')) {
                          _num2Holder =
                              _num2Holder.substring(1, _num2Holder.length);
                          _num2 = double.parse(_num2Holder)*-1;
                        } else {
                          _num2 = double.parse(_num2Holder);
                        }

                        switch (_operationKey){
                          case '+': {
                            _num1 = _num1+_num2;
                          }
                          case '-' :{
                            _num1 = _num1-_num2;
                          }
                          case 'x' :{
                            _num1 = _num1*_num2;
                          }
                        }
                        _num1Holder = _num1.toString();
                        _num2Holder = '';
                        _operationKey = '';
                        _isClickOperationKey = false;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                  ),
                  child: const Icon(CupertinoIcons.equal),
                ),
              ),

              const Text("  "), // Boşluk
            ],
          )

        ],
      )),
    );
  }
}
