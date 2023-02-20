import 'package:book_app/data/book_details_data.dart';
import 'package:book_app/view/widgets/header_widget.dart';
import 'package:flutter/material.dart';

import '../../commons/networking/api_services.dart';
import '../../commons/utils/network_utils.dart';

class DetailPage extends StatefulWidget {
  final String isbnId;
  final String title;


  const DetailPage({super.key, required this.isbnId, required this.title});
  
  @override
  State<DetailPage> createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {
  BookDetails? _bookDetails;
  @override
  void initState() {
    super.initState();
        _fetchData();
  }

  Future<void> _fetchData() async {
    final data = await NetworkUtils.fetchAPI<BookDetails>(
      path: ApiServices.detailsPath+widget.isbnId,
      parser: (json) => BookDetails.fromJson(json),
    );
    setState(() {
      _bookDetails = data;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          Scaffold(appBar: HeaderWidget(headerTitle: widget.title)),
    );
  }
}
