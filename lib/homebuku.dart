import 'package:avatar_brick/avatar_brick.dart';
import 'package:bacabuku/databuku.dart';
import 'package:bacabuku/detailbuku.dart';
import 'package:bacabuku/semuabuku.dart';
import 'package:bacabuku/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'widget/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showCard = false;
  Color backgroundColor = Colors.green;
  String selectedCategory = '';
  late TextEditingController controller;
  late List<String> bookSearch;

  List<String> allCategories = [];
  List<BookList> selectedCategoryBooks = [];

  void handleCategorySelected(String selectedCategory) {
    // Filter buku berdasarkan kategori yang dipilih
    selectedCategoryBooks = bookCatalog
        .where((book) => book.category.contains(selectedCategory))
        .toList();
    // Set state atau lakukan tindakan lain yang diperlukan setelah kategori dipilih
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    for (var book in bookCatalog) {
      allCategories.addAll(book.category);
    }
    allCategories = allCategories.toSet().toList();

    selectedCategoryBooks =
        bookCatalog.where((book) => book.own == false).toList();
  }

  @override
  Widget build(BuildContext context) {
    Color cream = Color(0xFFd5bfa5);
    return Scaffold(
        body: SafeArea(
      child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerBar(),
                    Container(
                      margin: const EdgeInsets.only(left: 15, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Library',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'amiri',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 280,
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll) {
                          overscroll.disallowIndicator();
                          return false;
                        },
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final BookList book = bookCatalog[index];
                            if (book != null) {
                              if (book.own == true) {
                                return Container(
                                    margin: const EdgeInsets.only(
                                      left: 15,
                                    ),
                                    child: Card(
                                      color: Colors.white,
                                      shadowColor: Colors.white,
                                      elevation: 0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                  builder: (context) {
                                                    return DetailPage(
                                                        book: book);
                                                  },
                                                ));
                                              },
                                              child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15)),
                                                  child: Hero(
                                                    tag:
                                                        'gambar ${book.imageasset}',
                                                    child: Image.asset(
                                                      book.imageasset,
                                                      width: 150,
                                                      height: 200,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ))),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            book.nameBook,
                                            style: const TextStyle(
                                                fontFamily: 'amiri',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.0),
                                          ),
                                          Text(
                                            book.penulis,
                                            style: const TextStyle(
                                                fontFamily: 'amiri',
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ));
                              } else {
                                return const SizedBox();
                              }
                            } else {
                              return const SizedBox();
                            }
                          },
                          itemCount: bookCatalog.length,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bestsellers',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'amiri',
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return allBook();
                                  },
                                ));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'See more',
                                    style: TextStyle(
                                      fontFamily: 'amiri',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 15.0,
                                    color: Colors.black54,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 35,
                      margin: EdgeInsets.only(bottom: 10, left: 15),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var category = allCategories[index];
                          return InkWell(
                            onTap: () {
                              if (category == 'Persahabatan') {
                                handleCategorySelected(category);
                              } else if (category == 'Petualangan') {
                                handleCategorySelected(category);
                              } else if (category == 'Petualangan') {
                                handleCategorySelected(category);
                              } else if (category == 'Novel') {
                                handleCategorySelected(category);
                              } else if (category == 'Komik') {
                                handleCategorySelected(category);
                              }
                              ;
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  color: _getColorForCategory(category),
                                  child: Text(category),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: allCategories.length,
                      ),
                    ),
                    Container(
                        height: 200,
                        child: NotificationListener<
                            OverscrollIndicatorNotification>(
                          onNotification: (overscroll) {
                            overscroll.disallowIndicator();
                            return false;
                          },
                          child: Animate(
                            effects: [FadeEffect(duration: 300.ms)],
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final BookList? book =
                                    selectedCategoryBooks[index];
                                if (book != null) {
                                  if (book.own != null && book.own == false) {
                                    return Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: Card(
                                          color: Colors.white,
                                          shadowColor: Colors.white,
                                          elevation: 0,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return DetailPage(book: book);
                                              }));
                                            },
                                            child: Hero(
                                                tag:
                                                    'gambar ${book.imageasset}',
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                  child: Image.asset(
                                                    book.imageasset,
                                                    width: 130,
                                                    height: 250,
                                                  ),
                                                )),
                                          ),
                                        ));
                                  } else {
                                    return const SizedBox();
                                  }
                                } else {
                                  return const SizedBox();
                                }
                              },
                              itemCount: selectedCategoryBooks.length,
                            ),
                          ),
                        )),
                  ].animate(interval: 400.ms).fade(duration: 300.ms),
                ),
              ),
            ],
          )),
    ));
  }
}

Color _getColorForCategory(String category) {
  switch (category) {
    case 'Komik':
      return const Color(0xFFfbeeec);
    case 'Novel':
      return const Color(0xFFa59d9d);
    case 'Persahabatan':
      return const Color(0xFFd5bfa5);
    case 'Petualangan':
      return const Color(0xFFfcf2db);
    default:
      return Colors.grey;
  }
}
