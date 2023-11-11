import 'package:bacabuku/databuku.dart';
import 'package:bacabuku/detailbuku.dart';
import 'package:flutter/material.dart';
import 'package:avatar_brick/avatar_brick.dart';
import 'package:flutter_animate/flutter_animate.dart';

class headerBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Animate(
              effects: [FadeEffect(), ScaleEffect()],
              child: Center(
                  child: Image.asset(
                'images/logobacabuku.png',
                width: 50,
                height: 50,
              )),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    showSearch(
                        context: context, delegate: CustomSearchDelegate());
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 35,
                  ),
                ),
                SizedBox(
                  height: 25,
                  width: 10,
                ),
                Container(
                  height: 40,
                  width: 40,
                  child: AvatarBrick(
                    border: Border.all(width: 1, color: Colors.black),
                    image: Image.network(
                      'https://radartasik.disway.id/upload/8effd7493b58a83c23a29acf661676b3.jpg',
                      fit: BoxFit.cover,
                      height: double.maxFinite,
                      width: double.maxFinite,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var book in bookCatalog.map((book) => book.nameBook).toList()) {
      if (book.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(book);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
      itemCount: matchQuery.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var book in bookCatalog.map((book) => book.nameBook).toList()) {
      if (book.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(book);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return DetailPage(
                    book: bookCatalog
                        .firstWhere((book) => book.nameBook == result));
              },
            ));
          },
          child: ListTile(
            title: Text(
              result,
              style: const TextStyle(
                  fontFamily: 'amiri', fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
      itemCount: matchQuery.length,
    );
  }
}
