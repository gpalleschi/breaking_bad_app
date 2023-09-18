// To parse this JSON data, do
//
//     final charactersBb = charactersBbFromMap(jsonString);

import 'dart:convert';

List<CharactersBb> charactersBbFromMap(String str) => List<CharactersBb>.from(json.decode(str).map((x) => CharactersBb.fromMap(x)));

String charactersBbToMap(List<CharactersBb> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CharactersBb {
    String name;
    String portrayed;
    String imageUrl;
    String fullName;
    String birthDate;
    List<String> occupation;
    String episodesCount;
    String series;
    List<String> appearances;
    int death;

    CharactersBb({
        required this.name,
        required this.portrayed,
        required this.imageUrl,
        required this.fullName,
        required this.birthDate,
        required this.occupation,
        required this.episodesCount,
        required this.series,
        required this.appearances,
        required this.death,
    });

    factory CharactersBb.fromMap(Map<String, dynamic> json) => CharactersBb(
        name: json["name"],
        portrayed: json["portrayed"],
        imageUrl: json["image_url"],
        fullName: json["full_name"],
        birthDate: json["birth_date"],
        occupation: List<String>.from(json["occupation"].map((x) => x)),
        episodesCount: json["episodes_count"],
        series: json["series"],
        appearances: List<String>.from(json["appearances"].map((x) => x)),
        death: -1 
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "portrayed": portrayed,
        "image_url": imageUrl,
        "full_name": fullName,
        "birth_date": birthDate,
        "occupation": List<dynamic>.from(occupation.map((x) => x)),
        "episodes_count": episodesCount,
        "series": series,
        "appearances": List<dynamic>.from(appearances.map((x) => x)),
        "death": death,
    };
}