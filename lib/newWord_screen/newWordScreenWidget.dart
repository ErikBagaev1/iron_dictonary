import 'package:flutter/material.dart';

import '../home_page/home_page.dart';

class NewWordScreenWidget extends StatefulWidget {
  const NewWordScreenWidget({Key? key}) : super(key: key);

  @override
  _NewWordScreenWidgetState createState() => _NewWordScreenWidgetState();
}

class _NewWordScreenWidgetState extends State<NewWordScreenWidget> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  void buttonTab() {
    words.add(
        Word('Слово${(words.length) + 1}', [controller1.text, controller2.text], [controller3.text, controller4.text]));
    controller1.text = '';
    controller2.text = '';
    controller3.text = '';
    controller4.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Column(children: [
            TextWidget(
              str: 'Осетинский',
              controller: controller1,
            ),
            TextWidget(
              str: 'Русский',
              controller: controller2,
            ),
          ]),
          const SizedBox(
            height: 30,
          ),
          Column(children: [
            TextWidget(
              str: 'Пример 1',
              controller: controller3,
            ),
            TextWidget(
              str: 'Пример 2',
              controller: controller4,
            ),
          ]),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              buttonTab();
            },
            child: const Text('Добавить'),
          ),
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final controller;

  String str = '';
  TextWidget({
    Key? key,
    required this.str,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: TextField(
        controller: controller,
        clipBehavior: Clip.antiAlias,
        autocorrect: false,
        decoration: InputDecoration(
            border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
            label: Text(
              str,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
