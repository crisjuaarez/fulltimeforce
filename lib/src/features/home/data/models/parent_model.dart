import '../../domain/entities/parent.dart';

class ParentModel extends Parent {
  const ParentModel({
    required super.sha,
    required super.url,
    required super.htmlUrl,
  });

  //fromJson
  factory ParentModel.fromJson(Map<String, dynamic> json) {
    return ParentModel(
      sha: json["sha"],
      url: json["url"],
      htmlUrl: json["html_url"],
    );
  }
}
