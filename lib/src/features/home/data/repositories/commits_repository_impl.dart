import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart' show Either, Left, Right;

import '../../../shared/domain/entities/failure.dart';
import '../../domain/entities/get_commits_response_entity.dart';
import '../../domain/repositories/commits_repository.dart';
import '../data_sources/commits_data_source.dart';

class CommitsRepositoryImpl implements CommitsRepository {
  final CommitsDataSource dataSource;
  const CommitsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<CommitsResponseModel>>> getCommits({
    required String username,
    required String repoName,
  }) async {
    try {
      final response = await dataSource.getCommits(username, repoName);
      if (response.statusCode == 200) {
        return Right(
          (jsonDecode(response.body) as List)
              .map((commit) => CommitsResponseModel.fromJson(commit))
              .toList(),
        );
      }

      return const Left(Failure('Something went wrong getting commits'));
    } catch (e) {
      return Left(Failure('Something went wrong getting commits $e'));
    }
  }
}
