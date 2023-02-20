// To parse this JSON data, do
//
//     final bookDetails = bookDetailsFromJson(jsonString);

import 'dart:convert';

BookDetails bookDetailsFromJson(String str) => BookDetails.fromJson(json.decode(str));

String bookDetailsToJson(BookDetails data) => json.encode(data.toJson());

class BookDetails {
    BookDetails({
        required this.error,
        required this.title,
        required this.subtitle,
        required this.authors,
        required this.publisher,
        required this.language,
        required this.isbn10,
        required this.isbn13,
        required this.pages,
        required this.year,
        required this.rating,
        required this.desc,
        required this.price,
        required this.image,
        required this.url,
    });

    final String? error;
    final String? title;
    final String? subtitle;
    final String? authors;
    final String? publisher;
    final String? language;
    final String? isbn10;
    final String? isbn13;
    final String? pages;
    final String? year;
    final String? rating;
    final String? desc;
    final String? price;
    final String? image;
    final String? url;

    factory BookDetails.fromJson(Map<String, dynamic> json) => BookDetails(
        error: json["error"],
        title: json["title"],
        subtitle: json["subtitle"],
        authors: json["authors"],
        publisher: json["publisher"],
        language: json["language"],
        isbn10: json["isbn10"],
        isbn13: json["isbn13"],
        pages: json["pages"],
        year: json["year"],
        rating: json["rating"],
        desc: json["desc"],
        price: json["price"],
        image: json["image"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "title": title,
        "subtitle": subtitle,
        "authors": authors,
        "publisher": publisher,
        "language": language,
        "isbn10": isbn10,
        "isbn13": isbn13,
        "pages": pages,
        "year": year,
        "rating": rating,
        "desc": desc,
        "price": price,
        "image": image,
        "url": url,
    };
}

