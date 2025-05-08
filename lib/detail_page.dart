import 'package:flutter/material.dart';

import 'package:dictionary/words.dart';

class DetailPage extends StatefulWidget {
  Words word;
  DetailPage({
    super.key,
    required this.word,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.word.english}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "${widget.word.turkish}",
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
