import 'package:book_app/data/book_details_data.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../commons/networking/api_services.dart';

class DetailPage extends StatefulWidget {
  final String isbnId;
  final String title;
  final String url;

  const DetailPage(
      {super.key,
      required this.isbnId,
      required this.title,
      required this.url});

  @override
  State<DetailPage> createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
  }

  

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }


  @override
  Widget build(BuildContext context) {
    Uri urlString = Uri.parse(widget.url);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  _launchInBrowser(urlString);
                },
                icon: const Icon(Icons.share)),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                  Color.fromARGB(100, 2, 0, 36),
                  Color.fromARGB(100, 9, 9, 121),
                  Color.fromARGB(100, 0, 212, 255)
                ],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight)),
          ),
        ),
        body: FutureBuilder<BookDetails>(
          future: ApiServices.fetchDetails(widget.isbnId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 200,
                          width: 150,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(
                              snapshot.data?.image ??
                                  "https://via.placeholder.com/200",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data?.title ?? "Titles",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              Text(snapshot.data?.authors ?? "Authors",
                                  style: const TextStyle(fontSize: 12)),
                              const SizedBox(
                                height: 35,
                              ),
                              Text(snapshot.data?.subtitle ?? "Subttile",
                                  style: const TextStyle(fontSize: 14)),
                              Text(snapshot.data?.price ?? "Price",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                      fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 16, 10, 24),
                      child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(100, 9, 9, 121),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "BUY",
                                style: TextStyle(),
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 16, 10, 24),
                      child: Text(
                        snapshot.data?.desc ?? "Description",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                );
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}
