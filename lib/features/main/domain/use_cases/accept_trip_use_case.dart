import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/location_request.dart';
import '../../data/repositories/main_repository.dart';

@lazySingleton
class AcceptTripUseCase {
  final MainRepository _mainRepository;

  AcceptTripUseCase(this._mainRepository);

  Future<Either<Failure, void>> call({
    required int tripId,
    required LocationRequest locationRequest,
  }) async =>
      await _mainRepository.acceptTrip(
          tripId: tripId, locationRequest: locationRequest);
}
