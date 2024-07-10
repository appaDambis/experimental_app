import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define the state
class Item {
  final String name;

  Item(this.name);
}

// Define the notifier
class ItemNotifier extends StateNotifier<List<Item>> {
  ItemNotifier() : super([]);

  void addItem(String name) {
    state = [...state, Item(name)];
  }

  void removeItem(int index) {
    state = [...state]..removeAt(index);
  }
}

// Define the provider
final itemProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  return ItemNotifier();
});
