import 'package:dictionary/detail_page.dart';
import 'package:dictionary/words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;
  String searchWord = "";

  Future<List<Words>> showAllWords() async {
    var wordList = <Words>[];

    Words w1 = Words(wordId: 1, english: "Water", turkish: "Su");
    Words w2 = Words(wordId: 2, english: "Computer", turkish: "Bilgisayar");
    Words w3 = Words(wordId: 3, english: "Bag", turkish: "Çanta");

    wordList.add(w1);
    wordList.add(w2);
    wordList.add(w3);

    return wordList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                onChanged: (value) {
                  searchWord = value;
                  print(searchWord);
                },
              )
            : Text('Dictionary App '),
        actions: [
          isSearching
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                      searchWord = "";
                    });
                  },
                  icon: Icon(Icons.close))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                  icon: Icon(Icons.search))
        ],
      ),
      body: Center(
        child: FutureBuilder(
            future: showAllWords(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var wordList = snapshot.data;
                return ListView.builder(
                  itemCount: wordList?.length,
                  itemBuilder: (context, index) {
                    var word = wordList![index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        height: 100,
                        child: Card.filled(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => DetailPage(
                                      word: word,
                                    ),
                                  ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  wordList![index].english,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(wordList[index].turkish,
                                    style: TextStyle(fontSize: 25)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center();
              }
            }),
      ),
    );
  }
}
