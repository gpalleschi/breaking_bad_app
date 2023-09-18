// To parse this JSON data, do
//
//     final quotesBb = quotesBbFromMap(jsonString);

import 'dart:convert';

List<QuotesBb> quotesBbFromMap(String str) => List<QuotesBb>.from(json.decode(str).map((x) => QuotesBb.fromMap(x)));

String quotesBbToMap(List<QuotesBb> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class QuotesBb {
    String quote;
    String author;
    String series;

    QuotesBb({
        required this.quote,
        required this.author,
        required this.series,
    });

    factory QuotesBb.fromMap(Map<String, dynamic> json) => QuotesBb(
        quote: json["quote"],
        author: json["author"],
        series: json["series"]!,
    );

    Map<String, dynamic> toMap() => {
        "quote": quote,
        "author": author,
        "series": series,
    };
}