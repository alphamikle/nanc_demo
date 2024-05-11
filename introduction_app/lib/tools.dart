extension ExtendedDynamic on dynamic {
  T find<T>(String keys) {
    final List<String> realKeys = keys.split('.');
    if (realKeys.isEmpty) {
      throw Exception('Key can not be empty');
    }
    dynamic value = this[realKeys.first];
    if (realKeys.length == 1) {
      return value as T;
    }
    for (int i = 1; i < realKeys.length; i++) {
      value = value[realKeys[i]];
    }
    return value as T;
  }

  T? findOr<T>(String keys) {
    final List<String> realKeys = keys.split('.');
    if (realKeys.isEmpty) {
      throw Exception('Key can not be empty');
    }
    dynamic value = this[realKeys.first];
    if (value == null) {
      return null;
    }
    if (realKeys.length == 1) {
      return value as T;
    }
    for (int i = 1; i < realKeys.length; i++) {
      value = value[realKeys[i]];
      if (value == null) {
        return null;
      }
    }
    return value as T;
  }
}
