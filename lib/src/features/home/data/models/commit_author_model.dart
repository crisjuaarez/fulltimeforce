import 'package:fulltimeforce_app/src/features/home/domain/entities/commit_author.dart';

class CommitAuthorModel extends CommitAuthor {
  const CommitAuthorModel({
    required super.name,
    required super.email,
    required super.date,
  });

  factory CommitAuthorModel.fromJson(Map<String, dynamic> json) {
    return CommitAuthorModel(
      name: json["name"],
      email: json["email"],
      date: DateTime.parse(json["date"]),
    );
  }
}
