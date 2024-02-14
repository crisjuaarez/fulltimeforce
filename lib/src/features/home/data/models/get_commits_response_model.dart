import '../../domain/entities/get_commits_response_entity.dart';
import '../../domain/entities/parent.dart';
import 'comitter_author_model.dart';
import 'commit_model.dart';
import 'parent_model.dart';

class GetCommitsResponseModel extends GetCommitsResponse {
  const GetCommitsResponseModel({
    required super.sha,
    required super.nodeId,
    required super.commit,
    required super.url,
    required super.htmlUrl,
    required super.commentsUrl,
    required super.author,
    required super.committer,
    required super.parents,
  });

  //fromJson
  factory GetCommitsResponseModel.fromJson(Map<String, dynamic> json) {
    return GetCommitsResponseModel(
      sha: json["sha"],
      url: json["url"],
      nodeId: json["node_id"],
      htmlUrl: json["html_url"],
      commentsUrl: json["comments_url"],
      commit: CommitModel.fromJson(json["commit"]),
      author: ComitterAuthorModel.fromJson(json["author"]),
      committer: ComitterAuthorModel.fromJson(json["committer"]),
      parents: List<Parent>.from(
        json["parents"].map((x) => ParentModel.fromJson(x)),
      ),
    );
  }
}
