import 'package:bacabuku/databuku.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DetailPage extends StatefulWidget {
  final BookList book;
  const DetailPage({Key? key, required this.book}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                                        FavoriteButton(),
                                        PopupMenuButton(
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                              child: Text('Dummy 1'),
                                            ),
                                            PopupMenuItem(
                                              child: Text('Dummy 2'),
                                            ),
                                          ],
                                        )
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
                                          tag:
                                              'gambar ${widget.book.imageasset}',
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            child: Image.asset(
                                              widget.book.imageasset,
                                              height: 250,
                                            ),
                                          )),
                                      Container(
                                          margin: EdgeInsets.only(top: 12),
                                          child: Column(
                                            children: [
                                              Text(
                                                widget.book.nameBook,
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontFamily: 'amiri',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                'by ' + widget.book.penulis,
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
                                widget.book.price,
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
                            widget.book.description,
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
                    children: widget.book.category.map((category) {
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
            SizedBox(
              width: 350,
              height: 50,
              child: InkWell(
                onTap: () {
                  if (widget.book.own == true) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          icon: Icon(Icons.check),
                          iconColor: Colors.green,
                          title: Center(
                            child: Text(
                              'Book Already Owned',
                              style: TextStyle(
                                fontFamily: 'amiri',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Ok',
                                  style: TextStyle(
                                      fontFamily: 'amiri', color: Colors.black),
                                ))
                          ],
                        );
                      },
                    );
                  } else if (widget.book.own == false) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          icon: Icon(Icons.question_mark),
                          title: Center(
                            child: Text(
                              'Are you Sure?',
                              style: TextStyle(
                                fontFamily: 'amiri',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Thank you for buying'),
                                        duration: 2.ms,
                                      ),
                                    );
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Sure',
                                    style: TextStyle(
                                        fontFamily: 'amiri',
                                        color: Colors.black),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontFamily: 'amiri',
                                        color: Colors.redAccent),
                                  ),
                                )
                              ],
                            )
                          ],
                        );
                      },
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: Container(
                        color: widget.book.own ? Colors.grey : Colors.black87,
                        height: 50,
                        width: 350,
                        child: Center(
                            child: Text(
                          widget.book.own ? 'You have It' : 'Buy this Book',
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
                ),
              ),
            )
          ],
        )
      ],
    )));
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      onPressed: () {
        if (isFavorite == false) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Adding To Favorite'),
              duration: 2.5.ms,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Deleting From Favorite'),
              duration: 2.5.ms,
            ),
          );
        }
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.grey,
      ),
    );
  }
}
