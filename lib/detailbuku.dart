import 'package:bacabuku/databuku.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final BookList book;
  const DetailPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color grey = Color(0xFFFFF4E4);
    Color grey1 = Color(0xFFEDE1D0);
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: [
        Column(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Container(
                    height: 450,
                    width: 500,
                    color: grey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 0, right: 0),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.arrow_back_ios_new)),
                                    Row(
                                      children: [
                                        Icon(Icons.favorite_border_outlined),
                                        Icon(Icons.more_vert),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Hero(
                                          tag: 'gambar ${book.imageasset}',
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            child: Image.asset(
                                              book.imageasset,
                                              height: 250,
                                            ),
                                          )),
                                      Container(
                                          margin: EdgeInsets.only(top: 12),
                                          child: Column(
                                            children: [
                                              Text(
                                                book.nameBook,
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontFamily: 'amiri',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                'by ' + book.penulis,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black54,
                                                    fontFamily: 'amiri'),
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    width: 4,
                    height: 120,
                    color: grey1,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 350,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Description',
                                style: TextStyle(
                                    fontFamily: 'amiri',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                book.price,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'amiri',
                                    color: Colors.black54,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 350,
                          child: Text(
                            book.description,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'amiri',
                                fontSize: 15,
                                color: Colors.black54),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    children: book.category.map((category) {
                      Color backgroundColor = Colors.green;
                      if (category == 'Persahabatan') {
                        backgroundColor = Color(0xFFd5bfa5);
                      } else if (category == 'Petualangan') {
                        backgroundColor = Color(0xFFfcf2db);
                      } else if (category == 'Komik') {
                        backgroundColor = Color(0xFFfbeeec);
                      } else if (category == 'Novel') {
                        backgroundColor = Color(0xFFa59d9d);
                      }
                      return Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontFamily: 'amiri',
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Container(
                    color: book.own ? Colors.grey : Colors.black87,
                    height: 50,
                    width: 350,
                    child: Center(
                        child: Text(
                      book.own ? 'You have It' : 'Buy this Book',
                      style: TextStyle(
                        fontFamily: 'amiri',
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    )));
  }
}
