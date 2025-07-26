import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../domain/entities/financial.dart';
import '../../domain/entities/history.dart';
import '../../domain/repositories/activities_repository.dart';
import '../datasources/activities_remote_data_source.dart';

@LazySingleton(as: ActivitiesRepository)
class ActivitiesRepositoryImpl extends BaseRepositoryImpl
    implements ActivitiesRepository {
  final ActivitiesRemoteDataSource _activitiesRemoteDataSource;

  ActivitiesRepositoryImpl(
    super._networkInfo,
    this._activitiesRemoteDataSource,
  );

  @override
  Future<Either<Failure, Financial>> getDriverFinancialHistory() async =>
      await requestApi(
        () async =>
            await _activitiesRemoteDataSource.getDriverFinancialHistory(),
        (dataModel) => dataModel.toDomain(),
      );

  @override
  Future<Either<Failure, List<History>>> getDriverTripsHistory() async =>
      await requestApi(
        () async => await _activitiesRemoteDataSource.getDriverTripsHistory(),
        (dataModel) => dataModel.map((e) => e.toDomain()).toList(),
      );
}
