 Container(
                          height: 200,
                          child: NotificationListener<
                              OverscrollIndicatorNotification>(
                            onNotification: (overscroll) {
                              overscroll.disallowIndicator();
                              return false;
                            },
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final BookList? book = bookCatalog[index];
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
                              itemCount: bookCatalog.length,
                            ),
                          )),