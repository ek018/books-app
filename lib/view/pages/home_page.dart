import 'package:book_app/commons/networking/api_services.dart';
import 'package:book_app/commons/utils/network_utils.dart';
import 'package:book_app/data/book_list_data.dart';
import 'package:book_app/view/pages/detail_page.dart';
import 'package:flutter/material.dart';

import '../widgets/header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BookList? _bookList;
  final String headerTitle = "Books";

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final data = await NetworkUtils.fetchAPI<BookList>(
      path: ApiServices.listPath,
      parser: (json) => BookList.fromJson(json),
    );
    setState(() {
      _bookList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: HeaderWidget(
              headerTitle: headerTitle,
              isHomePage: true,
            ),
            body: _bookList == null
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: _bookList!.books.length,
                    itemBuilder: (context, index) {
                      final book = _bookList!.books[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailPage(
                              isbnId: book.isbn13,
                              title: book.title,
                            );
                          }));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.network(
                                    book.image,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(book.title,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),
                                    Text(
                                      book.subtitle,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                    Text(
                                      book.price,
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )));
  }
}
