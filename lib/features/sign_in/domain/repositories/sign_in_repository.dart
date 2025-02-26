import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository.dart';
import '../../data/models/sign_in_request.dart';
import '../entities/sign_in_entity.dart';

abstract class SignInRepository extends BaseRepository{
  Future<Either<Failure, SignInEntity>> signIn(SignInRequest signInRequest);
}