import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/features/auth/domain/entities/login_entity.dart';
import 'package:dartz/dartz.dart';

import '../repositories/auth_repository.dart';
import 'auth_use_case.dart';

class LoginUseCase extends UseCase<LoginResponseEntity, LoginRequestEntity> {
  final AuthRepository authRepository;
  LoginUseCase({required this.authRepository});
  @override
  Future<Either<Failure, LoginResponseEntity>> call(LoginRequestEntity params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
