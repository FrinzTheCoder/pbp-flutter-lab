import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/drawer.dart';
import 'dart:convert';

class MywatchlistPage extends StatefulWidget {
  const MywatchlistPage({Key? key}) : super(key: key);

  @override
  State<MywatchlistPage> createState() => _MywatchlistPageState();
}

class _MywatchlistPageState extends State<MywatchlistPage> {
  Future<List<Mywatchlist>> fetchMyWatchList() async {
    print('FETCH PART 1');
    var url = Uri.parse(
        'http://tugas2pbp-falensiazmi.herokuapp.com/mywatchlist/json');
    print('FETCH PART 2');
    print(url);
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    print('FETCH PART 3');
    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    print('FETCH PART 4');
    print(data);
    // melakukan konversi data json menjadi object Mywatchlist
    List<Mywatchlist> myWatchList = [];
    for (var d in data) {
      if (d != null) {
        myWatchList.add(Mywatchlist.fromJson(d));
      }
    }
    print('FETCH PART 5');
    print(myWatchList);
    return myWatchList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: DrawerWidget(),
        body: FutureBuilder(
            future: fetchMyWatchList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada my watchlist list :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].fields.title}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // Text("${snapshot.data![index].completed}"),
                              ],
                            ),
                          ));
                }
              }
            }));
  }
}
