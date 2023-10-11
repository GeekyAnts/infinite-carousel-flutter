import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

import 'screens/complex.dart';
import 'screens/horizontal.dart';
import 'screens/vertical.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinite Carousel Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Infinite Carousel Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late InfiniteScrollController controller;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = InfiniteScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Horizontal example'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Horizontal()));
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text('Vertical example'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Vertical()));
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text('Complex example'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Complex()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
