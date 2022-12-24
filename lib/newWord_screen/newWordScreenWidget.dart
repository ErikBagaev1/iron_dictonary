import 'package:flutter/material.dart';
import 'package:iron_dictonary/home_page/home_page.dart';

class NewWordScreenWidget extends StatefulWidget {
  NewWordScreenWidget({Key? key}) : super(key: key);

  @override
  _NewWordScreenWidgetState createState() => _NewWordScreenWidgetState();
}

class _NewWordScreenWidgetState extends State<NewWordScreenWidget> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  void buttonTab() {
    words.add(Word('Слово' + ((words.length) + 1).toString(),
        [controller1.text, controller2.text], ['Пример 1', 'Пример 2']));
    controller1.text = "";
    controller2.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextWidget(
            str: "Осетинский",
            controller: controller1,
          ),
          TextWidget(
            str: "Русский",
            controller: controller2,
          ),
          ElevatedButton(
              onPressed: () {
                buttonTab();
              },
              child: Text('Добавить'))
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final controller;
  String str = "";
  TextWidget({
    Key? key,
    required this.str,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        clipBehavior: Clip.antiAlias,
        autocorrect: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            label: Text(
              str,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
