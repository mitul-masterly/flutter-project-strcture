///List extension to extend List functionality
extension MyIterable<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;

  T? firstWhereOrNull(final bool Function(T element) test) {
    final Iterable<dynamic> list = where(test);
    return list.isEmpty ? null : list.first;
  }
}

extension ListExt on List? {
  bool isNullOrEmpty() {
    if (this != null) {
      return this!.isEmpty;
    }
    return true;
  }

  bool isNotNullOrEmpty() {
    return !isNullOrEmpty();
  }
}
