import 'package:book_app/data/book_list_data.dart';

import '../../data/book_details_data.dart';
import '../utils/network_utils.dart';

class ApiServices {
  static const baseUrl = "https://api.itbook.store/1.0/";

  static const listPath = "new";
  static const detailsPath = "books/";

  static Future<BookList> fetchList() async {
    final data = await NetworkUtils.fetchAPI<BookList>(
      path: ApiServices.listPath,
      parser: (json) => BookList.fromJson(json),
    );

    return data;
  }

  static Future<BookDetails> fetchDetails(String isbnId) async {
    final data = await NetworkUtils.fetchAPI<BookDetails>(
      path: ApiServices.detailsPath + isbnId,
      parser: (json) => BookDetails.fromJson(json),
    );

    return data;
  }
}
