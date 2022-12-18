import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Future simpleDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Смена языка'),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Ok',
                style: TextStyle(
                  color: Color.fromARGB(255, 124, 148, 255),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  List<Word> words = [
    Word('Слово 1', ['Перевод 1', 'Перевод 2'], ['Пример 1', 'Пример 2']),
    Word('Слово 2', ['Перевод 1', 'Перевод 2'], ['Пример 1', 'Пример 2']),
    Word('Слово 3', ['Перевод 1', 'Перевод 2'], ['Пример 1', 'Пример 2']),
    Word('Слово 4', ['Перевод 1', 'Перевод 2'], ['Пример 1', 'Пример 2']),
    Word('Слово 5', ['Перевод 1', 'Перевод 2'], ['Пример 1', 'Пример 2']),
    Word('Слово 6', ['Перевод 1', 'Перевод 2'], ['Пример 1', 'Пример 2']),
    Word('Слово 7', ['Перевод 1', 'Перевод 2'], ['Пример 1', 'Пример 2']),
    Word('Слово 8', ['Перевод 1', 'Перевод 2'], ['Пример 1', 'Пример 2']),
    Word('Слово 9', ['Перевод 1', 'Перевод 2'], ['Пример 1', 'Пример 2']),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 124, 148, 255),
        centerTitle: true,
        title: const Text('Iron dictionary'),
        actions: [
          InkWell(
            onTap: () {
              simpleDialog(context);
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: Icon(Icons.repeat, color: Colors.white),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color.fromARGB(255, 175, 175, 175), width: 1),
                ),
              ),
              child: const TextField(
                cursorColor: Color.fromARGB(255, 124, 148, 255),
                decoration: InputDecoration(
                  hintText: 'Введите слово...',
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 24),
              ),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: words.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(height: 3, color: Color.fromARGB(255, 199, 199, 199)),
                itemBuilder: (context, index) => WordCard(word: words[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WordCard extends StatelessWidget {
  WordCard({super.key, required this.word});

  Word word;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color.fromARGB(255, 168, 184, 252),
      highlightColor: Color.fromARGB(255, 221, 227, 255),
      onTap: () {},
      child: Container(
        //color: Colors.red[100],
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                word.word,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: Text(
                word.translate[0],
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Word {
  Word(this.word, this.translate, this.example);

  String word;
  List<String> translate;

  List<String> example;
}
