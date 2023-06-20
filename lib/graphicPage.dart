import 'package:flutter/material.dart';

void main() {
  runApp(const Graphic());
}

class Graphic extends StatelessWidget {
  const Graphic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const GraphicPage(),
    );
  }
}

class GraphicPage extends StatelessWidget {
  const GraphicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Haftalık Grafik'),
      ),
    );
  }
}
