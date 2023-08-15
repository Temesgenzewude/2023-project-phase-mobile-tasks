![Onboarding Page](assets/images/documentation_images/image-4.png)

![Task List Page](assets/images/documentation_images/image-2.png)

![Create Task Page](assets/images/documentation_images/image.png)

![Update Task Page](assets/images/documentation_images/image-1.png)

# Onboarding Page Test:

```dart

// Test case to verify that tapping the "Get Started" button on the OnboardingPage
  // navigates to the TodoListPage and checks for specific elements on the page.
  testWidgets("Tapping the Get Started button will navigate to TodoListPage",
      (tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (_, __) {
            return const MaterialApp(
              home: OnboardingPage(),
            );
          }),
    );

    expect(find.byType(ElevatedButton), findsOneWidget);
    final findsButton = find.byType(ElevatedButton);
    await tester.tap(findsButton);
    await tester.pumpAndSettle();
    // Verifies that the TodoListPage is present exactly once on the screen.
    expect(find.byType(TodoListPage), findsOneWidget);
  });

```

# Task List Page Test:

```dart

// Test case to verify the elements on the TodoListPage.
  testWidgets('Todo List Page Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (_, __) {
            return const MaterialApp(
              home: TodoListPage(),
            );
          }),
    );

    // Verifies that the text "Todo List" appears twice on the TodoListPage.
    expect(find.text('Todo List'), findsNWidgets(2));

    // // Verifies that there is exactly one GestureDetector widget on the TodoListPage.
    // expect(find.byType(GestureDetector), findsNWidgets(4));

    expect(
        find.byKey(const ValueKey("todoListPageTodoTitle0")), findsOneWidget);
    expect(find.byKey(const ValueKey("todoListPageTodoDeadline0")),
        findsOneWidget);

    // Verifies that the text "Create Task" appears once on the TodoListPage.
    expect(find.text('Create Task'), findsOneWidget);
  });

```

# Update Task Page Test:

```dart


  // Test cases to verify elements on the UpdateTodoPage
  testWidgets('Update Todo Page Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(390, 840),
        builder: (_, __) {
          return const MaterialApp(
            home: TodoListPage(),
          );
        },
      ),
    );
    // Verify that tapping one of the todo from the todo list page will redirect to task detail page
    await tester.tap(find.byKey(const ValueKey("todoListPageTodoTitle0")));
    await tester.pumpAndSettle();
    // Verify that there is exactly one TaskDetailPage widget
    expect(find.byType(TaskDetailPage), findsOneWidget);
    // Verifies that there are exactly three TextField widgets on the UpdateTodoPage.
    expect(find.byType(TextField), findsNWidgets(3));

    // verify that the TaskDetailPage contains the title of the todo passed from the todo list page
    expect(find.text(TodoController.todos[0].title), findsOneWidget);

    // Verifies that the text "Update Task" appears once on the UpdateTodoPage.
    expect(find.text('Update Task'), findsOneWidget);

    // Verify that "Description" appear once on the UpdateTodoPage
    expect(find.text('Description'), findsOneWidget);
  });
```

# Create Task Page Test:

```dart

 // Test case to verify the elements on the AddTaskPage.
  testWidgets('Add Task page test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(390, 840),
        builder: (_, __) {
          return const MaterialApp(
            home: AddTaskPage(),
          );
        },
      ),
    );

    // Verifies that there are exactly three TextField widgets on the AddTaskPage.
    expect(find.byType(TextField), findsNWidgets(3));

    // Verifies that the text "Add Task" appears once on the AddTaskPage.
    expect(find.text('Add Task'), findsOneWidget);

    // Verify that "Description" appear once on the AddTaskPage
    expect(find.text('Description'), findsOneWidget);
  });

```

# August 9, 2023

Project Setup:

![Project Setup](assets/images/documentation_images/image-3.png)

TodoEntity Implementation:

```dart
class TodoEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;

  const TodoEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.isCompleted});

  @override
  List<Object?> get props => [id, title, description, isCompleted];
}

```

Implement Models:

```dart
class TodoModel extends TodoEntity {
 const TodoModel(
     {required id, required title, required description, required isCompleted})
     : super(
           id: id,
           title: title,
           description: description,
           isCompleted: isCompleted);

 factory TodoModel.fromJson(Map<String, dynamic> json) {
   return TodoModel(
       id: json['id'],
       title: json['title'],
       description: json['description'],
       isCompleted: json['isCompleted']);
 }

 Map<String, dynamic> toJson() {
   return {
     "id": id,
     "title": title,
     "description": description,
     "isCompleted": isCompleted
   };
 }
}

// TodoMode Test:
void main() {
 TodoModel tTodoModel = const TodoModel(
     id: "1",
     title: "Task 8",
     description: "complete day 8 task",
     isCompleted: false);

 test("should be a subclass of TodoEntity", () async {
   //assert
   expect(tTodoModel, isA<TodoEntity>());
 });

 // test fromJson
 test("should return valid TodoModel from json", () async {
   // arrange
   final Map<String, dynamic> jsonMap = await jsonDecode(
       readJson("features/todo/helpers/dummy_data/todo_dummy_response.json"));

   // act
   final result = TodoModel.fromJson(jsonMap);

   // assert
   expect(result, equals(tTodoModel));
 });

 // test toJson
 test("should return valid json from TodoModel", () async {

   final result = tTodoModel.toJson();


   final expectedJsonMap = {
     "id": "1",
     "title": "Task 8",
     "description": "complete day 8 task",
     "isCompleted": false
   };

   //assert
   expect(result, equals(expectedJsonMap));
 });
}
```



# August 10, 2023

Contract and Repository:

```dart

abstract class TodoRepository {
  Future<Either<Failure, TaskEntity>> createTask(TaskEntity task);
  Future<Either<Failure, TaskEntity>> viewTask(String taskId);
  Future<Either<Failure, List<TaskEntity>>> viewAllTasks();
  Future<Either<Failure, void>> deleteTask(String taskId);
  Future<Either<Failure, TaskEntity>> updateTask(TaskEntity task);
}
```
##
This code defines an abstract class called TodoRepository, which serves as a contract for interacting with a repository that manages tasks. The class outlines several methods that can be implemented by concrete repository classes to perform various operations on tasks.


The methods in the TodoRepository class are as follows:

createTask(TaskEntity task):

  Description: Creates a new task.

  Parameters:
        task: An instance of the TaskEntity class representing the task to be created.

  Returns: 
        A Future that resolves to an Either object, which can contain either a Failure object if an error occurs during the operation, or a TaskEntity object representing the created task.



viewTask(String taskId):

  Description: Retrieves a specific task by its ID.

  Parameters:
        taskId: A String representing the ID of the task to be retrieved.

  Returns: 
        A Future that resolves to an Either object, which can contain either a Failure object if an error occurs during the operation, or a TaskEntity object representing the retrieved task.



viewAllTasks():

  Description: Retrieves all tasks.

  Returns:
       A Future that resolves to an Either object, which can contain either a Failure object if an error occurs during the operation, or a List<TaskEntity> object representing all the tasks.



deleteTask(String taskId):

  Description: Deletes a specific task by its Id.

  Parameters:
      taskId: A String representing the ID of the task to be deleted.

  Returns: 
        A Future that resolves to an Either object, which can contain either a Failure object if an error occurs during the operation, or void indicating the successful deletion of the task.



updateTask(TaskEntity task):

Description: Updates an existing task.

Parameters:
      task: An instance of the TaskEntity class representing the task to be updated.
Returns: 
      A Future that resolves to an Either object, which can contain either a Failure object if an error occurs during the operation, or a TaskEntity object representing the updated task.




# Day 9 Task

    Repository Implementation:

```dart
    class TodoRepositoryImpl implements TodoRepository {
      final TodoLocalDataSource localDataSource;
      final TodoRemoteDataSource remoteDataSource;
      final NetworkInfoImpl networkInfo;
      TodoRepositoryImpl({
        required this.localDataSource,
        required this.remoteDataSource,
        required this.networkInfo,
      });

      @override
      Future<Either<Failure, TodoEntity>> createTask(TodoEntity todoEntity) async {
        if (await networkInfo.isConnected) {
          try {
            final remoteTask = await remoteDataSource.createTask(todoEntity);
            localDataSource.cacheTask(remoteTask.id, remoteTask);
            return Right(remoteTask);
          } on ServerException catch (e) {
            return Left(ServerFailure(message: "Server Error"));
          }
        } else {
          return Left(ConnectionFailure(message: "No Internet Connection"));
        }
      }

      @override
      Future<Either<Failure, TodoEntity>> viewTask(String todoId) async {
        if (await networkInfo.isConnected) {
          try {
            final remoteTask = await remoteDataSource.viewTask(todoId);
            localDataSource.cacheTask(remoteTask.id, remoteTask);
            return Right(remoteTask);
          } on ServerException catch (e) {
            return Left(ServerFailure(message: "Server Error"));
          }
        } else {
          // get from local data source
          try {
            final localTask = await localDataSource.getTask(todoId);
            return Right(localTask);
          } on CacheException catch (e) {
            return Left(CacheFailure(message: "Cache Error"));
          }
        }
      }

      @override
      Future<Either<Failure, List<TodoEntity>>> viewAllTasks() async {
        if (await networkInfo.isConnected) {
          try {
            final remoteTasks = await remoteDataSource.viewAllTasks();
            localDataSource.cacheTasks("todos", remoteTasks);
            return Right(remoteTasks);
          } on ServerException catch (e) {
            return Left(ServerFailure(message: "Server Error"));
          }
        } else {
          try {
            final localTasks = await localDataSource.getTasks("tasks");
            return Right(localTasks);
          } on CacheException catch (e) {
            return Left(CacheFailure(message: "Cache Error"));
          }
        }
      }

      @override
      Future<Either<Failure, TodoEntity>> updateTask(TodoEntity todoEntity) async {
        if (await networkInfo.isConnected) {
          try {
            final remoteTask = await remoteDataSource.updateTask(todoEntity);
            localDataSource.cacheTask(remoteTask.id, remoteTask);
            return Right(remoteTask);
          } on ServerException catch (e) {
            return Left(ServerFailure(message: "Server Error"));
          }
        } else {
          return Left(ConnectionFailure(message: "No Internet Connection"));
        }
      }

      @override
      Future<Either<Failure, void>> deleteTask(String todoId) async {
        if (await networkInfo.isConnected) {
          try {
            remoteDataSource.deleteTask(todoId);
            localDataSource.removeTask(todoId);
            return const Right(null);
          } on ServerException catch (e) {
            return Left(ServerFailure(message: "Server Error"));
          }
        } else {
          return Left(ConnectionFailure(message: "No Internet Connection"));
        }
      }

```

    The TodoRepositoryImpl class, which is the implementation of TodoRepository abstract class, has the following properties:

        localDataSource: 
                An instance of the TodoLocalDataSource interface, representing the local data source for tasks.
        remoteDataSource: 
                An instance of the TodoRemoteDataSource interface, representing the remote data source for tasks.
        networkInfo: 
                An instance of the NetworkInfoImpl class, providing information about the network connectivity.

        The constructor of TodoRepositoryImpl takes the required dependencies (localDataSource, remoteDataSource, and networkInfo) and initializes the corresponding properties.


    The class implements several methods from the TodoRepository interface:

        createTask: 

              Creates a new todo by first checking if there is an internet connection using networkInfo.isConnected.
              
               If there is a connection, it calls the createTask method on the remoteDataSource to create the todo remotely. 
               
               The created task is then cached locally using localDataSource.cacheTask. 
               
               If any errors occur during the process, a ServerException is caught and a Left value with a ServerFailure is returned. 
               
               If there is no internet connection, a Left value with a ConnectionFailure is returned.

        viewTask:

              Retrieves a todo by its ID (todoId) by first checking the internet connection using networkInfo.isConnected. 
              
              If there is a connection, it calls the viewTask method on the remoteDataSource to retrieve the todo remotely. 
              
              The retrieved todo is then cached locally using localDataSource.cacheTask. 
              
              If any errors occur during the process, a ServerException is caught and a Left value with a ServerFailure is returned. 
              
              If there is no internet connection, it tries to retrieve the todo from the local data source using localDataSource.getTask. 
              
              If any errors occur during this process, a CacheException is caught and a Left value with a CacheFailure is returned.

        viewAllTasks: 

              Retrieves all todos by first checking the internet connection using networkInfo.isConnected. 
              
              If there is a connection, it calls the viewAllTasks method on the remoteDataSource to retrieve all todos remotely. 
              
              The retrieved todos are then cached locally using localDataSource.cacheTasks. 
              
              If any errors occur during the process, a ServerException is caught and a Left value with a ServerFailure is returned. 
              
              If there is no internet connection, it tries to retrieve the todos from the local data source using localDataSource.getTasks. 
              
              If any errors occur during this process, a CacheException is caught and a Left value with a CacheFailure is returned.

        updateTask:
        
              Updates an existing todo by first checking if there is an internet connection using networkInf.isConnected. 
              
              If there is a connection, it calls the updateTask method on the remoteDataSource to update the todo remotely. 
              
              The updated todo is then cached locally using localDataSource.cacheTask. 
              
              If any errors occur during the process, a ServerException is caught and a Left value with a ServerFailure is returned. 
              
              If there is no internet connection, a Left value with a ConnectionFailure is returned.

        deleteTask: 

              Deletes a todo by its ID (todoId) by first checking if there is an internet connection using networkInfo.isConnected. 
              
              If there is a connection, it calls the deleteTask method on the remoteDataSource to delete the todo remotely. 
              
              The todo is also removed from the local data source using localDataSource.removeTask. 
              
              If any errors occur during the process, a ServerException is caught and a Left value with a ServerFailure is returned. 
              
              If there is no internet connection, a Left value with a ConnectionFailure is returned.

    

    NetworkInfo implementation:

```dart

            abstract class NetworkInfo {
          Future<bool> get isConnected;
        }

        class NetworkInfoImpl implements NetworkInfo {
          final Connectivity connectivity;

          NetworkInfoImpl({required this.connectivity});

          @override
          Future<bool> get isConnected async {
            final result = await connectivity.checkConnectivity();
            return result != ConnectivityResult.none;
          }
        }
```

        The NetworkInfo interface has a single method isConnected, 
        
        which returns a Future<bool>
        
         indicating whether there is an internet connection or not.

        The NetworkInfoImpl class, which is the implementation of 
        
        NetworkInfo interface, has the following properties:


            connectivity: 
                    An instance of the Connectivity class, 

                    which is a Flutter plugin for discovering network connectivity.

                    The constructor of NetworkInfoImpl takes the required dependency (connectivity) 
                    
                    and initializes the corresponding property.


            The class implements the isConnected method from the NetworkInfo interface:

                isConnected: 
                        Checks if there is an internet connection by calling the 
                        
                        checkConnectivity method on the connectivity plugin. 
                        
                        If the result is not ConnectivityResult.none, 
                        
                        it returns true, otherwise it returns false.



## Day 10 Task:

TodoLocalDataSource implementation:

```dart

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final SharedPreferences sharedPreferences;
  TodoLocalDataSourceImpl({
    required this.sharedPreferences,
  });

// Retrieves a single task from the local data source based on the provided key.
// Returns a Future that resolves to a TodoModel object.
  @override
  Future<TodoModel> getTask(String key) {
    final jsonString = sharedPreferences.getString(key);
    // If the JSON string is not null,
    //decode it into a TodoModel object and return it.
    // Otherwise, throw a CacheException.
    if (jsonString != null) {
      return Future.value(TodoModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

// Retrieves a list of tasks from the local data
//source based on the provided key.
// Returns a Future that resolves to a List of TodoModel objects.
  @override
  Future<List<TodoModel>> getTasks(String key) {
    final todosJson = sharedPreferences.getStringList(key);
    // If the list of JSON strings is not null, 
    //decode each string into a TodoModel object,
    // and return a list of TodoModel objects.
    // Otherwise, throw a CacheException.
    if (todosJson != null) {
      return Future.value(
        todosJson
            .map((todoJson) => TodoModel.fromJson(json.decode(todoJson)))
            .toList(),
      );
    } else {
      throw CacheException();
    }
  }

  // Caches a single task in the local data source with the provided key.
  // Returns a Future that completes when the task is successfully cached.
  @override
  Future<void> cacheTask(String key, TodoModel todoModel) {
    return sharedPreferences.setString(
      key,
      json.encode(todoModel.toJson()),
    );
  }

// Encode each TodoModel object in the list into a JSON string
//and save the list
// of JSON strings in SharedPreferences with the provided key.
  @override
  Future<void> cacheTasks(String key, List<TodoModel> todoModels) {
    final todosJson = todoModels.map((todoModel) {
      return json.encode(todoModel.toJson());
    }).toList();
    return sharedPreferences.setStringList(key, todosJson);
  }

// Remove the value associated with the provided key
// from SharedPreferences.
  @override
  Future<void> removeTask(String key) {
    return sharedPreferences.remove(key);
  }
}


```


TodoRemoteDataSource implementation:

```dart

```
 




