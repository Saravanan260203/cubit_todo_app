import 'package:cubit_todo_app/model/todoModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String name) {
    final todo = Todo(
      name: name,
      createdAt: DateTime.now(),
    );
    // Emit a new list with the added todo
    emit([...state, todo]);
  }

  void deleteTodo(Todo todo) {
    emit(state.where((item) => item != todo).toList());
  }
}
