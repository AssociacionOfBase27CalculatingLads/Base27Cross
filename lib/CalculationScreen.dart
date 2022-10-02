import 'package:flutter/material.dart';

class CalculationPage extends StatefulWidget {
  CalculationPage({Key? key}) : super(key: key);

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

List<String> calculation = [];

class _CalculationPageState extends State<CalculationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bongal calculator"),
        ),
        body: Column(
          children: [
            Container(
              child: Column(children: [
                Row(children: [
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                ]),
                Row(children: [
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                ]),
                Row(children: [
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                ]),
                Row(children: [
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                ]),
                Row(children: [
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                  TextButton(onPressed: () {}, child: Text("0")),
                ]),
              ]),
            ),
          ],
        ));
  }
}
