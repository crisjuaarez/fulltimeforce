import '../../domain/entities/commit.dart';
import 'commit_author_model.dart';
import 'tree_model.dart';
import 'verification_model.dart';

class CommitModel extends Commit {
  const CommitModel({
    required super.author,
    required super.committer,
    required super.message,
    required super.tree,
    required super.url,
    required super.commentCount,
    required super.verification,
  });
  //fromJson
  factory CommitModel.fromJson(Map<String, dynamic> json) {
    return CommitModel(
      author: CommitAuthorModel.fromJson(json["author"]),
      committer: CommitAuthorModel.fromJson(json["committer"]),
      message: json["message"],
      tree: TreeModel.fromJson(json["tree"]),
      url: json["url"],
      commentCount: json["comment_count"],
      verification: VerificationModel.fromJson(json["verification"]),
    );
  }
}
