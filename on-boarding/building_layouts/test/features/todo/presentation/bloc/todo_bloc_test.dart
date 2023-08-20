import 'package:bloc_test/bloc_test.dart';
import 'package:building_layouts/core/entities/todo_entity.dart';
import 'package:building_layouts/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:building_layouts/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:building_layouts/features/todo/presentation/bloc/todo_event.dart';
import 'package:building_layouts/features/todo/presentation/bloc/todo_state.dart';

import '../../helpers/mock_implementations/input_converter/mock_input_converter.mocks.dart';
import '../../helpers/mock_implementations/use_cases/mock_create_task_use_case.mocks.dart';
import '../../helpers/mock_implementations/use_cases/mock_delete_task_use_case.mocks.dart';
import '../../helpers/mock_implementations/use_cases/mock_update_task_use_case.mocks.dart';
import '../../helpers/mock_implementations/use_cases/mock_view_all_tasks_use_case.mocks.dart';
import '../../helpers/mock_implementations/use_cases/mock_view_single_task_use_case.mocks.dart';

void main() {
  late MockCreateTask mockCreateTask;
  late MockViewAllTask mockViewAllTask;
  late MockViewTask mockViewTask;
  late MockUpdateTask mockUpdateTask;
  late MockDeleteTask mockDeleteTask;

  late MockInputConverter mockInputConverter;

  late TodoBloc todoBloc;

  setUp(() {
    mockCreateTask = MockCreateTask();
    mockViewAllTask = MockViewAllTask();
    mockViewTask = MockViewTask();
    mockUpdateTask = MockUpdateTask();
    mockDeleteTask = MockDeleteTask();

    todoBloc = TodoBloc(
      createTaskUseCase: mockCreateTask,
      viewAllTasksUseCase: mockViewAllTask,
      viewTaskUseCase: mockViewTask,
      updateTaskUseCase: mockUpdateTask,
      deleteTaskUseCase: mockDeleteTask,
    );
  });

  test('initialState should be EmptyState', () {
    // assert
    expect(todoBloc.state, equals(EmptyState()));
  });

  group("createTask", () {
    const todoEntity = TodoEntity(
        id: "1",
        title: "Bloc Test",
        description: "Bloc test description",
        status: "In Progress",
        dueDate: "10/10/2023");

    blocTest('emits [LoadingState, LoadedState] when task created successfully',
        build: () {
          return TodoBloc(
            createTaskUseCase: mockCreateTask,
            viewAllTasksUseCase: mockViewAllTask,
            viewTaskUseCase: mockViewTask,
            updateTaskUseCase: mockUpdateTask,
            deleteTaskUseCase: mockDeleteTask,
          );
        },
        act: (bloc) => bloc.add(const CreateTaskEvent(task: todoEntity)),
        expect: () => [
              LoadingState(),
              const LoadedSingleTaskState(todo: todoEntity),
            ],
        verify: (_) {
          verify(mockCreateTask(any)).called(1);
        });

    blocTest(
      'emits [LoadingState, ErrorState] when create task fails',
      build: () {
        when(mockCreateTask(any)).thenAnswer(
            (_) async => Left(ServerFailure(message: SERVER_FAILURE_MESSAGE)));
        return TodoBloc(
          createTaskUseCase: mockCreateTask,
          viewAllTasksUseCase: mockViewAllTask,
          viewTaskUseCase: mockViewTask,
          updateTaskUseCase: mockUpdateTask,
          deleteTaskUseCase: mockDeleteTask,
        );
      },
      act: (bloc) => bloc.add(const CreateTaskEvent(task: todoEntity)),
      expect: () => [
        LoadingState(),
        const ErrorState(message: SERVER_FAILURE_MESSAGE),
      ],
    );
  });

  group("LoadAllTasksEvent", () {
    const todoE = TodoEntity(
        id: "1",
        title: "Bloc Test",
        description: "Bloc test description",
        status: "In Progress",
        dueDate: "10/10/2023");
    blocTest(
      'emits [LoadingState, LoadedAllTasksState] when view all tasks successfully',
      build: () {
        when(mockViewAllTask(any))
            .thenAnswer((_) async => const Right([todoE]));
        return TodoBloc(
          createTaskUseCase: mockCreateTask,
          viewAllTasksUseCase: mockViewAllTask,
          viewTaskUseCase: mockViewTask,
          updateTaskUseCase: mockUpdateTask,
          deleteTaskUseCase: mockDeleteTask,
        );
      },
      act: (bloc) => bloc.add(LoadAllTasksEvent()),
      expect: () => [
        LoadingState(),
        const LoadedAllTasksState(todos: [todoE]),
      ],
      verify: (_) {
        verify(mockViewAllTask(any)).called(1);
      },
    );

    blocTest(
      'emits [LoadingState, ErrorState] when view all tasks fails',
      build: () {
        when(mockViewAllTask(any)).thenAnswer(
            (_) async => Left(ServerFailure(message: SERVER_FAILURE_MESSAGE)));
        return TodoBloc(
          createTaskUseCase: mockCreateTask,
          viewAllTasksUseCase: mockViewAllTask,
          viewTaskUseCase: mockViewTask,
          updateTaskUseCase: mockUpdateTask,
          deleteTaskUseCase: mockDeleteTask,
        );
      },
      act: (bloc) => bloc.add(LoadAllTasksEvent()),
      expect: () => [
        LoadingState(),
        const ErrorState(message: SERVER_FAILURE_MESSAGE),
      ],
    );
  });

  group("GetSingleTaskEvent", () {
    const tTaskId = "1";
    const todoE = TodoEntity(
        id: "1",
        title: "Bloc Test",
        description: "Bloc test description",
        status: "In Progress",
        dueDate: "10/10/2023");
    blocTest(
      'emits [LoadingState, LoadedSingleTaskState] when view task successfully',
      build: () {
        when(mockViewTask(any)).thenAnswer((_) async => const Right(todoE));
        return TodoBloc(
          createTaskUseCase: mockCreateTask,
          viewAllTasksUseCase: mockViewAllTask,
          viewTaskUseCase: mockViewTask,
          updateTaskUseCase: mockUpdateTask,
          deleteTaskUseCase: mockDeleteTask,
        );
      },
      act: (bloc) => bloc.add(const GetSingleTaskEvent(taskId: tTaskId)),
      expect: () => [
        LoadingState(),
        const LoadedSingleTaskState(todo: todoE),
      ],
      verify: (_) {
        verify(mockViewTask(any)).called(1);
      },
    );

    blocTest(
      'emits [LoadingState, ErrorState] when view task fails',
      build: () {
        when(mockViewTask(any)).thenAnswer(
            (_) async => Left(ServerFailure(message: SERVER_FAILURE_MESSAGE)));
        return TodoBloc(
          createTaskUseCase: mockCreateTask,
          viewAllTasksUseCase: mockViewAllTask,
          viewTaskUseCase: mockViewTask,
          updateTaskUseCase: mockUpdateTask,
          deleteTaskUseCase: mockDeleteTask,
        );
      },
      act: (bloc) => bloc.add(const GetSingleTaskEvent(taskId: tTaskId)),
      expect: () => [
        LoadingState(),
        const ErrorState(message: SERVER_FAILURE_MESSAGE),
      ],
    );
  });

  group("updateTask", () {
    const todoE = TodoEntity(
        id: "1",
        title: "Bloc Test",
        description: "Bloc test description",
        status: "In Progress",
        dueDate: "10/10/2023");

    blocTest(
      'emits [LoadingState, LoadedSingleTaskState] when update task successfully',
      build: () {
        when(mockUpdateTask(any)).thenAnswer((_) async => const Right(todoE));
        return TodoBloc(
          createTaskUseCase: mockCreateTask,
          viewAllTasksUseCase: mockViewAllTask,
          viewTaskUseCase: mockViewTask,
          updateTaskUseCase: mockUpdateTask,
          deleteTaskUseCase: mockDeleteTask,
        );
      },
      act: (bloc) => bloc.add(const UpdateTaskEvent(task: todoE)),
      expect: () => [
        LoadingState(),
        const LoadedSingleTaskState(todo: todoE),
      ],
      verify: (_) {
        verify(mockUpdateTask(any)).called(1);
      },
    );

    blocTest(
      'emits [LoadingState, ErrorState] when update task fails',
      build: () {
        when(mockUpdateTask(any)).thenAnswer(
            (_) async => Left(ServerFailure(message: SERVER_FAILURE_MESSAGE)));
        return TodoBloc(
          createTaskUseCase: mockCreateTask,
          viewAllTasksUseCase: mockViewAllTask,
          viewTaskUseCase: mockViewTask,
          updateTaskUseCase: mockUpdateTask,
          deleteTaskUseCase: mockDeleteTask,
        );
      },
      act: (bloc) => bloc.add(const UpdateTaskEvent(task: todoE)),
      expect: () => [
        LoadingState(),
        const ErrorState(message: SERVER_FAILURE_MESSAGE),
      ],
    );
  });

  group("deleteTask", () {
    const tTaskId = "1";
    blocTest(
      'emits [LoadingState, EmptyState] when delete task successfully',
      build: () {
        when(mockDeleteTask(any)).thenAnswer((_) async => const Right(null));
        return TodoBloc(
          createTaskUseCase: mockCreateTask,
          viewAllTasksUseCase: mockViewAllTask,
          viewTaskUseCase: mockViewTask,
          updateTaskUseCase: mockUpdateTask,
          deleteTaskUseCase: mockDeleteTask,
        );
      },
      act: (bloc) => bloc.add(const DeleteTaskEvent(taskId: tTaskId)),
      expect: () => [
        LoadingState(),
        EmptyState(),
      ],
      verify: (_) {
        verify(mockDeleteTask(any)).called(1);
      },
    );

    blocTest(
      'emits [LoadingState, ErrorState] when delete task fails',
      build: () {
        when(mockDeleteTask(any)).thenAnswer(
            (_) async => Left(ServerFailure(message: SERVER_FAILURE_MESSAGE)));
        return TodoBloc(
          createTaskUseCase: mockCreateTask,
          viewAllTasksUseCase: mockViewAllTask,
          viewTaskUseCase: mockViewTask,
          updateTaskUseCase: mockUpdateTask,
          deleteTaskUseCase: mockDeleteTask,
        );
      },
      act: (bloc) => bloc.add(const DeleteTaskEvent(taskId: tTaskId)),
      expect: () => [
        LoadingState(),
        const ErrorState(message: SERVER_FAILURE_MESSAGE),
      ],
    );
  });
}
