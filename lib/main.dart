import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  String title = 'Сейчас темная';
  MaterialStateProperty<Color> color =
      MaterialStateProperty.all<Color>(Colors.black);
  Color textColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Смена темы")),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          counter++;
          setState(() {
            if (counter % 2 == 0) {
              title = 'Сейчас темная';
              color = MaterialStateProperty.all<Color>(Colors.black);
              textColor = Colors.white;
            } else {
              title = 'Сейчас светлая';
              color = MaterialStateProperty.all<Color>(Colors.white);
              textColor = Colors.black;
            }
          });
        },
        child: Text(
          title,
          style: TextStyle(color: textColor),
        ),
        style: ButtonStyle(
          backgroundColor: color,
        ),
      )),
    );
  }
}
