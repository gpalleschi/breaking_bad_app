// To parse this JSON data, do
//
//     final episodesBb = episodesBbFromMap(jsonString);

import 'dart:convert';

List<EpisodesBb> episodesBbFromMap(String str) => List<EpisodesBb>.from(json.decode(str).map((x) => EpisodesBb.fromMap(x)));

String episodesBbToMap(List<EpisodesBb> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class EpisodesBb {
    String episodeId;
    String title;
    String season;
    String airDate;
    List<String> characters;
    String episode;
    String series;

    EpisodesBb({
        required this.episodeId,
        required this.title,
        required this.season,
        required this.airDate,
        required this.characters,
        required this.episode,
        required this.series,
    });

    factory EpisodesBb.fromMap(Map<String, dynamic> json) => EpisodesBb(
        episodeId: json["episode_id"],
        title: json["title"],
        season: json["season"],
        airDate: json["air_date"],
        characters: List<String>.from(json["characters"].map((x) => x)),
        episode: json["episode"],
        series: json["series"]!,
    );

    Map<String, dynamic> toMap() => {
        "episode_id": episodeId,
        "title": title,
        "season": season,
        "air_date": airDate,
        "characters": List<dynamic>.from(characters.map((x) => x)),
        "episode": episode,
        "series": series,
    };
}