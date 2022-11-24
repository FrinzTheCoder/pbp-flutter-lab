import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/mywatchlist_detail.dart';
import 'package:counter_7/fetch.dart';

Color giveColor(iswatched) {
  if (iswatched == false) {
    return Colors.red;
  }
  return Colors.blue;
}

class MywatchlistPage extends StatefulWidget {
  const MywatchlistPage({Key? key}) : super(key: key);

  @override
  State<MywatchlistPage> createState() => _MywatchlistPageState();
}

class _MywatchlistPageState extends State<MywatchlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: const DrawerWidget(),
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
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
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
                        border: Border.all(
                            color: giveColor(
                                watchedMap[snapshot.data![index].pk])),
                        boxShadow: const [
                          BoxShadow(color: Colors.black, blurRadius: 2.0)
                        ]),
                    child: InkWell(
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
                          Checkbox(
                              value: watchedMap[snapshot.data![index].pk],
                              onChanged: (value) {
                                setState(() {
                                  // print(watchedMap);
                                  watchedMap[snapshot.data![index].pk] = value!;
                                  // print(watchedMap);
                                });
                              }),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                    data: snapshot.data![index].fields,
                                    isWatched:
                                        watchedMap[snapshot.data![index].pk])));
                      },
                    )),
              );
            }
          }
        },
      ),
    );
  }
}
