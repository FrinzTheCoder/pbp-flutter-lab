import 'package:flutter/material.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/drawer.dart';
import 'package:intl/intl.dart';

String convertDate(date) {
  String formattedDate = DateFormat.yMMMMd().format(date);
  return formattedDate;
}

class DetailPage extends StatelessWidget {
  final Fields data;
  final bool isWatched;
  const DetailPage({
    Key? key,
    required this.data,
    required this.isWatched,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Detail")),
        drawer: const DrawerWidget(),
        body: Center(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(7, 10, 7, 15),
                  child: Text(
                    data.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.all(4),
                child: Text.rich(TextSpan(
                    text: 'Release Date: ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                    children: <InlineSpan>[
                      TextSpan(
                          text: convertDate(data.releaseDate),
                          style: const TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17)),
                    ])),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.all(4),
                child: Text.rich(TextSpan(
                    text: 'Rating: ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                    children: <InlineSpan>[
                      TextSpan(
                          text: '${data.rating.toString()}/5',
                          style: const TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17)),
                    ])),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.all(4),
                child: Text.rich(TextSpan(
                    text: 'Status: ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                    children: <InlineSpan>[
                      TextSpan(
                          text: isWatched ? "watched" : "not watched",
                          style: const TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17)),
                    ])),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.all(4),
                child: Text.rich(TextSpan(
                    text: 'Review: \n',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                    children: <InlineSpan>[
                      TextSpan(
                          text: data.review,
                          style: const TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17)),
                    ])),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.fromLTRB(7, 7, 7, 15),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Back'),
          ),
        ));
  }
}
