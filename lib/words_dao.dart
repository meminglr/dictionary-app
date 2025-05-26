import 'package:dictionary/database_helper.dart';
import 'package:dictionary/words.dart';

class WordsDao {
  Future<List<Words>> allWords() async {
    var db = await DatabaseHelper.accesToDatabase();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT*FROM words");

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Words(
          wordId: row["words_id"],
          english: row["english"],
          turkish: row["turkish"]);
    });
  }

  Future<List<Words>> searchWord(String searchWord) async {
    var db = await DatabaseHelper.accesToDatabase();
    List<Map<String, dynamic>> maps = await db
        .rawQuery("SELECT*FROM words WHERE english like'%$searchWord%' ");

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Words(
          wordId: row["words_id"],
          english: row["english"],
          turkish: row["turkish"]);
    });
  }
}
