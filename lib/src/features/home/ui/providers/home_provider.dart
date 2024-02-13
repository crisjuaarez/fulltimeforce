import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../shared/domain/entities/failure.dart';
import '../../domain/entities/get_commits_response_entity.dart';
import '../../domain/repositories/commits_repository.dart';

class HomeProvider with ChangeNotifier {
  final CommitsRepository commitsRepository;

  HomeProvider({required this.commitsRepository});

  List<CommitsResponseModel> _commits = [];
  List<CommitsResponseModel> get commits => _commits;

  Failure? _commitsFailure;
  Failure? get commitsFailure => _commitsFailure;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void filterCommitsByDate() {
    _commits.sort(
      (a, b) => b.commit.author.date.compareTo(a.commit.author.date),
    );
    notifyListeners();
  }

  Future<Either<Failure, List<CommitsResponseModel>>> getCommits({
    required String username,
    required String repoName,
  }) async {
    setLoading(true);

    final either = await commitsRepository.getCommits(
      username: username,
      repoName: repoName,
    );
    either.fold(
      (failure) {
        _commitsFailure = failure;
      },
      (data) {
        _commits = data;
      },
    );
    setLoading(false);
    return either;
  }
}
