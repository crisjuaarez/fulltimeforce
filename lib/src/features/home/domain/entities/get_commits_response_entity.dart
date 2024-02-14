import 'comitter_author.dart';
import 'commit.dart';
import 'parent.dart';

class GetCommitsResponse {
  final String sha;
  final String nodeId;
  final Commit commit;
  final String url;
  final String htmlUrl;
  final String commentsUrl;
  final ComitterAuthor author;
  final ComitterAuthor committer;
  final List<Parent> parents;

  const GetCommitsResponse({
    required this.sha,
    required this.nodeId,
    required this.commit,
    required this.url,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.author,
    required this.committer,
    required this.parents,
  });
}
