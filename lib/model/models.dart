class NewsApiModel {
  String status = "error";
  List<NewsApiArticles> articles = [];
  String error = "error";

  NewsApiModel({
    required this.status,
    required this.articles
  });

  NewsApiModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['articles'] != null) {
      json['articles'].forEach((e) {
        articles.add(NewsApiArticles.fromJson(e));
      });
    }
  }

  NewsApiModel.withError(String errorMessage) {
    error = errorMessage;
  }
}

class NewsApiArticles {
  String? author;
  String? title;
  String? description;
  String? urlImage;
  String sourceName = "";
  String? content;

  NewsApiArticles({
    this.author,
    this.title,
    this.description,
    this.urlImage,
    required this.sourceName,
    this.content
  });

  NewsApiArticles.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    urlImage = json['urlToImage'];
    sourceName = json['source']['name'];
    content = json['content'];
  }
}