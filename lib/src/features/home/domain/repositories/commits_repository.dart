import 'package:dartz/dartz.dart';

import '../../../shared/domain/entities/failure.dart';
import '../entities/get_commits_response_entity.dart';

abstract class CommitsRepository {
  Future<Either<Failure, List<GetCommitsResponse>>> getCommits({
    required String username,
    required String repoName,
  });
}
