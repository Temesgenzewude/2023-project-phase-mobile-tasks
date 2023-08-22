import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:dartz/dartz.dart';

import '../repositories/auth_repository.dart';
import 'auth_use_case.dart';

class SignUpUseCase extends UseCase<SignUpEntity, SignUpEntity> {
  final AuthRepository repository;

  SignUpUseCase({required this.repository});

  @override
  Future<Either<Failure, SignUpEntity>> call(SignUpEntity params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
