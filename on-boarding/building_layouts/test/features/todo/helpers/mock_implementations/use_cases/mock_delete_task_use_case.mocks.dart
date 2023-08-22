// Mocks generated by Mockito 5.4.0 from annotations
// in building_layouts/test/features/todo/helpers/mock_implementations/use_cases/mock_delete_task_use_case.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:building_layouts/core/errors/failure.dart' as _i6;
import 'package:building_layouts/features/todo/domain/repositories/todo_repository.dart'
    as _i2;
import 'package:building_layouts/features/todo/domain/use_cases/delete_task_use_case.dart'
    as _i4;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTodoRepository_0 extends _i1.SmartFake
    implements _i2.TodoRepository {
  _FakeTodoRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DeleteTask].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteTask extends _i1.Mock implements _i4.DeleteTask {
  MockDeleteTask() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TodoRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTodoRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TodoRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, void>> call(String? taskId) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [taskId],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, void>>.value(
            _FakeEither_1<_i6.Failure, void>(
          this,
          Invocation.method(
            #call,
            [taskId],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, void>>);
}