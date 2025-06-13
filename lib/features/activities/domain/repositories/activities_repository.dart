import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository.dart';
import '../entities/financial.dart';

abstract class ActivitiesRepository extends BaseRepository {
  Future<Either<Failure, Financial>> getDriverFinancialHistory();
}
