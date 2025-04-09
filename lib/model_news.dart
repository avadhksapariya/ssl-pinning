class ModelNews {
  String? status = '';
  int? totalResults = 0;
  List<ModelNewsArticles>? articles;

  ModelNews({this.status = '', this.totalResults = 0, this.articles});

  ModelNews.fromJson(Map<String, dynamic> json) {
    status = json["status"].toString();
    totalResults = json["totalResults"];
    articles =
        json["articles"] == null ? [] : (json["articles"] as List).map((e) => ModelNewsArticles.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["totalResults"] = totalResults;
    if (articles != null) {
      data["articles"] = articles?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class ModelNewsArticles {
  ModelNewsArticlesSource? source;
  String? author = '';
  String? title = '';
  String? description = '';
  String? url = '';
  String? urlToImage = '';
  String? publishedAt = '';
  String? content = '';

  ModelNewsArticles({
    this.source,
    this.author = '',
    this.title = '',
    this.description = '',
    this.url = '',
    this.urlToImage = '',
    this.publishedAt = '',
    this.content = '',
  });

  ModelNewsArticles.fromJson(Map<String, dynamic> json) {
    source = json["source"] == null ? null : ModelNewsArticlesSource.fromJson(json["source"]);
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
    content = json["content"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data["source"] = source?.toJson();
    }
    data["author"] = author;
    data["title"] = title;
    data["description"] = description;
    data["url"] = url;
    data["urlToImage"] = urlToImage;
    data["publishedAt"] = publishedAt;
    data["content"] = content;
    return data;
  }
}

class ModelNewsArticlesSource {
  String? id = '';
  String? name = '';

  ModelNewsArticlesSource({this.id = '', this.name = ''});

  ModelNewsArticlesSource.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    name = json["name"].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    return data;
  }
}
