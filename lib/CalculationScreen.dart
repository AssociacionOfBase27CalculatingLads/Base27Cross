import 'package:flutter/material.dart';

import 'package:rust_combo_test/CalculationScreen.dart';

import 'dart:ffi';
import 'dart:io';
import 'bridge_generated.dart';

const base = "rust";
final path = Platform.isWindows ? "$base.dll" : "lib$base.so";
late final dylib = Platform.isIOS
    ? DynamicLibrary.process()
    : Platform.isMacOS
        ? DynamicLibrary.executable()
        : DynamicLibrary.open(path);
late final api = RustImpl(dylib);

class CalculationPage extends StatefulWidget {
  CalculationPage({Key? key}) : super(key: key);

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

List<String> calculation = [];

class _CalculationPageState extends State<CalculationPage> {
  late Future<String> result;

  @override
  void initState() {
    super.initState();
    result = api.getNewBongal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bongal calculator™"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              width: double.infinity,
              constraints: BoxConstraints(minHeight: 100, maxHeight: 200),
              child: Text("${stringFromList(calculation)}", style: TextStyle(fontSize: 18)),
            ),
            Container(
              child: Column(children: [
                Row(children: [
                  symbolButton("0"),
                  symbolButton("1"),
                  symbolButton("2"),
                  symbolButton("3"),
                  symbolButton("4"),
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          bool remove = true;
                          if (calculation.last == " ") {
                            calculation.removeLast();
                            if (calculation.last == "(") {
                              remove = false;
                            }
                            calculation.removeLast();
                          } else if (calculation.last == ")") {
                            calculation.removeLast();
                          }
                          if (remove) {
                            calculation.removeLast();
                          }
                          setState(() {});
                        },
                        child: Text("⌫",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),
                  ),
                ]),
                Row(children: [
                  symbolButton("4"),
                  symbolButton("5"),
                  symbolButton("6"),
                  symbolButton("7"),
                  symbolButton("8"),
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          calculation.clear();
                          setState(() {});
                        },
                        child: Text("C",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),
                  ),
                ]),
                Row(children: [
                  symbolButton("9"),
                  symbolButton("α"),
                  symbolButton("β"),
                  symbolButton("γ"),
                  symbolButton("δ"),
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          calculation.add(" ");
                          calculation.add("+");
                          calculation.add(" ");
                          setState(() {});
                        },
                        child: Text("+",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange))),
                  ),
                ]),
                Row(children: [
                  symbolButton("ρ"),
                  symbolButton("F"),
                  symbolButton("η"),
                  symbolButton("∅"),
                  symbolButton("c"),
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          calculation.add(" ");
                          calculation.add("-");
                          calculation.add(" ");
                          setState(() {});
                        },
                        child: Text("-",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange))),
                  ),
                ]),
                Row(children: [
                  symbolButton("K"),
                  symbolButton("ʎ"),
                  symbolButton("u"),
                  symbolButton("V"),
                  symbolButton("Ś"),
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          calculation.add(" ");
                          calculation.add("*");
                          calculation.add(" ");
                          setState(() {});
                        },
                        child: Text("*",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange))),
                  ),
                ]),
                Row(children: [
                  symbolButton("O"),
                  symbolButton("π"),
                  symbolButton("P"),
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          calculation.add("(");
                          calculation.add(" ");
                          setState(() {});
                        },
                        child: Text("(",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange))),
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          calculation.add(" ");
                          calculation.add(")");
                          setState(() {});
                        },
                        child: Text(")",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange))),
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          // calculation.add("0");
                          result = api.calculateBongal(argss: stringFromList(calculation));
                          print(result);
                          setState(() {});
                        },
                        child: Text("=",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green))),
                  ),
                ]),
              ]),
            ),
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade500, borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              width: double.infinity,
              child: FutureBuilder(
                future: Future.wait([result]),
                builder: ((context, snapshot) {
                  return Text("${snapshot.data?[0] ?? "NONE"}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black));
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  symbolButton(String symbol) {
    return Expanded(
      child: TextButton(
          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey.shade200)),
          onPressed: () {
            calculation.add(symbol);
            setState(() {});
          },
          child: Text(symbol)),
    );
  }

  String stringFromList(List<String> args) {
    String result = "";
    for (String arg in args) {
      result += arg;
    }
    return result;
  }
}
