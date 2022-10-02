import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rust_combo_test/CalculationScreen.dart';

import 'bridge_generated.dart';

const base = "rust";
final path = Platform.isWindows ? "$base.dll" : "lib$base.so";
late final dylib = Platform.isIOS
    ? DynamicLibrary.process()
    : Platform.isMacOS
        ? DynamicLibrary.executable()
        : DynamicLibrary.open(path);
late final api = RustImpl(dylib);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(colorScheme: ColorScheme.dark(primary: Colors.purple)),
      home: CalculationPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<int> counter;
  late Future<String> bongal;
  // int _counter = 0;
  @override
  void initState() {
    super.initState();
    // counter = api.getResult();
    bongal = api.getNewBongal();
  }

  void _incrementCounter() {
    setState(() {
      // counter = api.calculateSimple(args: ["2", "+", "4", "*", "5"]);
      // bongal = api.calculateBongal(args: ["2", "+", "K"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            FutureBuilder<List<dynamic>>(
                future: Future.wait([bongal]),
                builder: (context, snapshot) {
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return const Text(
                  //     "loading",
                  //   );
                  // }
                  return Text(
                    '${snapshot.data?[0] ?? 'loading'}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
