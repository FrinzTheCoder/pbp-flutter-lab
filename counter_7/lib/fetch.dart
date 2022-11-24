import 'package:http/http.dart' as http;
import 'package:counter_7/model/mywatchlist.dart';
import 'dart:convert';

Map watchedMap = {};

bool checkValue(iswatched) {
  if (iswatched == Watched.BELUM) {
    return false;
  }
  return true;
}

Future<List<Mywatchlist>> fetchMyWatchList() async {
  Map tempWatchedMap = {};
  var url =
      Uri.parse('http://tugas2pbp-falensiazmi.herokuapp.com/mywatchlist/json');
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );
  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  // melakukan konversi data json menjadi object Mywatchlist
  List<Mywatchlist> myWatchList = [];
  for (var d in data) {
    if (d != null) {
      myWatchList.add(Mywatchlist.fromJson(d));
      tempWatchedMap[Mywatchlist.fromJson(d).pk] =
          checkValue(Mywatchlist.fromJson(d).fields.watched);
    }
  }
  if (watchedMap.isEmpty) {
    watchedMap = tempWatchedMap;
  }
  return myWatchList;
}
