import '../../domain/entities/tree.dart';

class TreeModel extends Tree {
  const TreeModel({required super.sha, required super.url});
  //fromJson
  factory TreeModel.fromJson(Map<String, dynamic> json) {
    return TreeModel(sha: json["sha"], url: json["url"]);
  }
}
