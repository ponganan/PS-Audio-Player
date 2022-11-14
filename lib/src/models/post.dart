// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.id,
    required this.title,
    required this.singer,
    required this.url,
    required this.coverUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String title;
  String singer;
  String url;
  String coverUrl;
  DateTime createdAt;
  DateTime updatedAt;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        title: json["title"],
        singer: json["singer"],
        url: json["url"],
        coverUrl: json["cover_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "singer": singer,
        "url": url,
        "cover_url": coverUrl,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
      };
}
