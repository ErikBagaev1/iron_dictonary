import 'package:flutter/material.dart';

class NewWordScreenWidget extends StatefulWidget {
  const NewWordScreenWidget({Key? key}) : super(key: key);

  @override
  _NewWordScreenWidgetState createState() => _NewWordScreenWidgetState();
}

class _NewWordScreenWidgetState extends State<NewWordScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextWidget(str: "Осетинский"),
          TextWidget(str: "Русский"),
          ElevatedButton(onPressed: () {}, child: Text('Добавить'))
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  String str = "";
  TextWidget({
    Key? key,
    required this.str,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
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
