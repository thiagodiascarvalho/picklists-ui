import 'package:flutter/material.dart';

class SelectedPickListRepository {
  static final List<int> selectedPickLists = <int>[];
  static ValueNotifier<List<int>> selectedPickListsNotifier =
      ValueNotifier(selectedPickLists);

  static void addPickListId(pickListId) {
    selectedPickLists.add(pickListId);
    selectedPickListsNotifier.notifyListeners();
  }

  static void removePickListId(pickListId) {
    selectedPickLists.remove(pickListId);
    selectedPickListsNotifier.notifyListeners();
  }

  static void clear() {
    selectedPickLists.clear();
  }
}
