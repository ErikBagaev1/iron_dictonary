import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../home_page/home_page.dart';

class MoreInfoPage extends StatelessWidget {
  MoreInfoPage({super.key, required this.word});

  final Word word;
  String translates = '';

  void translateListToString() {
    translates += word.translate[0];
    if (word.translate.length > 1) {
      for (int i = 0; i < word.translate.length; i++) {
        translates += ', ${word.translate[i]}';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    translateListToString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 124, 148, 255),
        centerTitle: true,
        title: const Text('Перевод'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        children: [
          Text(word.word, style: TextStyle(fontSize: 28),),
          const SizedBox(height: 12),
          Text(translates, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
