import 'package:flutter/material.dart';
<<<<<<< HEAD

class HomePage extends StatelessWidget {
  HomePage({super.key});

=======
import 'package:iron_dictonary/newWord_screen/newWordScreenWidget.dart';

final List<Word> words = [
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

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;
  void onSelectedTab(int index) {
    if (onSelectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  final _controller = TextEditingController();
  var _searchWords = <Word>[];

  void _searchWord() {
    final query = _controller.text;
    if (query.isNotEmpty) {
      _searchWords = words.where((Word word) {
        return word.word.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _searchWords = words;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement setState
    super.initState();

    _searchWords = words;
    _searchWords.sort((a, b) {
      return a.word[0]
          .toString()
          .toLowerCase()
          .compareTo(b.word[0].toString().toLowerCase());
    });
    _controller.addListener((_searchWord));
  }

>>>>>>> add_themes_Erik
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

<<<<<<< HEAD
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

=======
>>>>>>> add_themes_Erik
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
<<<<<<< HEAD
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
=======
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
>>>>>>> add_themes_Erik
              child: Icon(Icons.repeat, color: Colors.white),
            ),
          )
        ],
      ),
<<<<<<< HEAD
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
=======
      body: IndexedStack(
        index: _selectedTab,
        children: [
          WordsScreen(controller: _controller, searchWords: _searchWords),
          NewWordScreenWidget()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.book_sharp), label: 'Слова'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: 'Добавить слово'),
        ],
        onTap: (onSelectedTab),
      ),
    );
  }
}

class WordsScreen extends StatelessWidget {
  const WordsScreen({
    Key? key,
    required TextEditingController controller,
    required List<Word> searchWords,
  })  : _controller = controller,
        _searchWords = searchWords,
        super(key: key);

  final TextEditingController _controller;
  final List<Word> _searchWords;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Color.fromARGB(255, 175, 175, 175), width: 1),
              ),
            ),
            child: TextField(
              controller: _controller,
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
              itemCount: _searchWords.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                      height: 3, color: Color.fromARGB(255, 199, 199, 199)),
              itemBuilder: (context, index) =>
                  WordCard(word: _searchWords[index]),
            ),
          ),
        ],
>>>>>>> add_themes_Erik
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
