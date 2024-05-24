class News {
  String name;
  String author;
  String title;
  String description;
  String? image;
  int publishedAt;

  News({
    required this.author,
    required this.description,
    required this.image,
    required this.name,
    required this.publishedAt,
    required this.title,
  });

  factory News.fromJSON(Map<String, dynamic> data) {
    return News(
        author: data["author"] ?? "",
        description: data["description"] ?? "",
        image: data["urlToImage"] ?? "",
        name: data["source"]["name"],
        publishedAt: DateTime.parse(data["publishedAt"]).millisecondsSinceEpoch,
        title: data["title"]);
  }
}
