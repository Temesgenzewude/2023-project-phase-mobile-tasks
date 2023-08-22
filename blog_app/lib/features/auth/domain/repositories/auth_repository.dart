import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/login_entity.dart';
import '../entities/sign_up_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignUpEntity>> signIn(SignUpEntity signUpEntity);

  Future<Either<Failure, LoginResponseEntity>> login(
      LoginRequestEntity loginRequestEntity);

  Future<Either<Failure, void>> logout(String token);
}
