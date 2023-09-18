// To parse this JSON data, do
//
//     final deathsBb = deathsBbFromMap(jsonString);

import 'dart:convert';

List<DeathsBb> deathsBbFromMap(String str) => List<DeathsBb>.from(json.decode(str).map((x) => DeathsBb.fromMap(x)));

String deathsBbToMap(List<DeathsBb> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class DeathsBb {
    String death;
    String cause;
    String responsible;
    String lastWords;
    String season;
    String series;

    DeathsBb({
        required this.death,
        required this.cause,
        required this.responsible,
        required this.lastWords,
        required this.season,
        required this.series,
    });

    factory DeathsBb.fromMap(Map<String, dynamic> json) => DeathsBb(
        death: json["death"],
        cause: json["cause"],
        responsible: json["responsible"],
        lastWords: json["last_words"],
        season: json["season"],
        series: json["series"],
    );

    Map<String, dynamic> toMap() => {
        "death": death,
        "cause": cause,
        "responsible": responsible,
        "last_words": lastWords,
        "season": season,
        "series": series,
    };
}
