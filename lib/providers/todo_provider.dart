import 'package:experimental_app/providers/todo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class Todu extends StateNotifier<List<TodoModel>> {
  Todu() : super([]);

  void addthetodo(String title) {
    state = [
      ...state,
      TodoModel(
        id: Uuid().v4(),
        name: title,
      )
    ];
  }
}

final ToduProvider = StateNotifierProvider<Todu, List<TodoModel>>((ref) {
  return Todu();
});
