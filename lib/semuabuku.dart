import 'dart:math';

import 'package:bacabuku/databuku.dart';
import 'package:bacabuku/detailbuku.dart';
import 'package:flutter/material.dart';
import 'package:animation_search_bar/animation_search_bar.dart';

class allBook extends StatefulWidget {
  const allBook({super.key});

  @override
  State<allBook> createState() => _allBookState();
}

class _allBookState extends State<allBook> {
  late TextEditingController controller;
  List<BookList> orignalBookCatalog = [];
  List<BookList> searchResults = [];
  @override
  void initState() {
    super.initState();
    orignalBookCatalog = List.from(bookCatalog);

    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 65),
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    spreadRadius: 0,
                    offset: Offset(0, 5)),
              ]),
              alignment: Alignment.center,
              child: AnimationSearchBar(
                  centerTitle: 'All Book',
                  onChanged: (text) {
                    setState(() {
                      searchResults = orignalBookCatalog
                          .where((element) => element.nameBook
                              .toLowerCase()
                              .contains(text.toLowerCase()))
                          .toList();
                    });
                  },
                  searchTextEditingController: controller),
            ),
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: ListView.builder(
              itemCount: searchResults.isNotEmpty
                  ? searchResults.length
                  : orignalBookCatalog.length,
              itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailPage(
                            book: searchResults.isNotEmpty
                                ? searchResults[index]
                                : orignalBookCatalog[index]);
                      },
                    )),
                    child: Container(
                      child: ClipRRect(
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                child: Image.asset(
                                  searchResults.isNotEmpty
                                      ? searchResults[index].imageasset
                                      : orignalBookCatalog[index].imageasset,
                                  width: 100,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  searchResults.isNotEmpty
                                      ? searchResults[index].nameBook
                                      : orignalBookCatalog[index].nameBook,
                                  style: TextStyle(
                                      fontFamily: 'amiri',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: 5,
                                  width: 15,
                                ),
                                Text(
                                  searchResults.isNotEmpty
                                      ? searchResults[index].price
                                      : orignalBookCatalog[index].price,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: 'amiri',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
        ));
  }
}
