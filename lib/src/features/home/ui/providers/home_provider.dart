import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../shared/domain/entities/failure.dart';
import '../../domain/entities/get_commits_response_entity.dart';
import '../../domain/repositories/commits_repository.dart';

class HomeProvider with ChangeNotifier {
  final CommitsRepository commitsRepository;

  HomeProvider({required this.commitsRepository});

  List<GetCommitsResponse> _commits = [];
  List<GetCommitsResponse> get commits => _commits;

  Failure? _commitsFailure;
  Failure? get commitsFailure => _commitsFailure;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void searchCommits(String value) {
    _commits = _commits
        .where((element) =>
            element.commit.message.toLowerCase().contains(value.toLowerCase()))
        .toList();
    log('Commits: ${_commits.length}');
    notifyListeners();
  }

  void filterCommitsByDate({bool ascending = false}) {
    !ascending
        ? _commits.sort(
            (a, b) => a.commit.author.date.compareTo(b.commit.author.date),
          )
        : _commits.sort(
            (a, b) => b.commit.author.date.compareTo(a.commit.author.date),
          );
    notifyListeners();
  }

  bool _isGridList = false;
  bool get isGridList => _isGridList;
  void toggleGridList() {
    _isGridList = !_isGridList;
    notifyListeners();
  }

  Future<Either<Failure, List<GetCommitsResponse>>> getCommits({
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
        _commitsFailure = null;
        _commits = data;
      },
    );
    setLoading(false);
    return either;
  }
}
