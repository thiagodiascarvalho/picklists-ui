class SelectedPickListRepository {
  static final List<int> selectedPickLists = <int>[];

  static void addPickListId(pickListId) {
    selectedPickLists.add(pickListId);
  }

  static void removePickListId(pickListId) {
    selectedPickLists.remove(pickListId);
  }

  static void clear() {
    selectedPickLists.clear();
  }
}
