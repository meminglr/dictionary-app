import 'package:flutter/material.dart';

import 'package:dictionary/words.dart';
import 'package:flutter/services.dart';

class DetailPage extends StatefulWidget {
  Words word;
  MaterialColor? cardColor;
  Color? textColor;

  DetailPage({
    Key? key,
    required this.word,
    required this.cardColor,
    required this.textColor,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.cardColor,
      appBar: AppBar(
        foregroundColor: widget.textColor,
        title: Text("Detail Page"),
        backgroundColor: widget.cardColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.word.english}",
              style: TextStyle(
                  color: widget.textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "${widget.word.turkish}",
              style: TextStyle(color: widget.textColor, fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
