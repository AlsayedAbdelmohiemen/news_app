class SourcesModel {
  String? status;
  String? code;
  String? massage;
  List<source>? sources;

  SourcesModel({this.status, this.code, this.massage, this.sources});
  factory SourcesModel.fromjson(Map<String, dynamic> json) {
    return SourcesModel(
      status: json["status"],
      code: json["code"] ?? "",
      massage: json["massage"] ?? "",
      sources: List<source>.from(
        json["sources"].map((elements) => source.fromjson(elements)),
      ),
    );
  }
}

class source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;

  source({this.id, this.name, this.description, this.url, this.category});
  factory source.fromjson(Map<String, dynamic> json) {
    return source(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      url: json["url"],
      category: json["category"],
    );
  }
}
