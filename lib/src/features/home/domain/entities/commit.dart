import 'commit_author.dart';
import 'tree.dart';
import 'verification.dart';

class Commit {
  final CommitAuthor author;
  final CommitAuthor committer;
  final String message;
  final Tree tree;
  final String url;
  final int commentCount;
  final Verification verification;

  const Commit({
    required this.author,
    required this.committer,
    required this.message,
    required this.tree,
    required this.url,
    required this.commentCount,
    required this.verification,
  });
}
