import 'package:experimental_app/todo_app/todo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

// Define a Value class that extends StateNotifier<int>
class Value extends StateNotifier<int> {
  Value() : super(0);

  void add() {
    state = state + 1;
  }

  void minus() {
    state = state - 1;
  }
}

// Create a StateNotifierProvider for the Value
final valueProvider = StateNotifierProvider<Value, int>((ref) {
  return Value();
});

class NextPage extends StateNotifier<int> {
  NextPage() : super(0);

  void nextPage(int pageIndex) {
    state = pageIndex;
  }
}

final nextPageProvider = StateNotifierProvider<NextPage, int>((ref) {
  return NextPage();
});

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addTodo(String title) {
    state = [
      ...state,
      Todo(
        id: Uuid().v4(),
        title: title,
      ),
    ];
  }

  void toggleTodoCompletion(String id) {
    state = state.map((todo) {
      if (todo.id == id) {
        return Todo(
          id: todo.id,
          title: todo.title,
          isCompleted: !todo.isCompleted,
        );
      }
      return todo;
    }).toList();
  }

  void deleteTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier();
});

class NavigationNotifier extends StateNotifier<int> {
  NavigationNotifier() : super(0);

  void goToPage(int pageIndex) {
    state = pageIndex;
  }
}

final navigationProvider =
    StateNotifierProvider<NavigationNotifier, int>((ref) {
  return NavigationNotifier();
});
