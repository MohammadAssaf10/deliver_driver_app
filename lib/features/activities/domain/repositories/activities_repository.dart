import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository.dart';
import '../entities/financial.dart';
import '../entities/history.dart';

abstract class ActivitiesRepository extends BaseRepository {
  Future<Either<Failure, Financial>> getDriverFinancialHistory();
  Future<Either<Failure, List<History>>> getDriverTripsHistory();
}
