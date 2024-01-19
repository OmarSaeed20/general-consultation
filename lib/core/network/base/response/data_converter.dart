import '/index.dart';

class DataConverter<T> implements JsonConverter<T, Object?> {
  const DataConverter();

  @override
  T fromJson(Object? json) {
    //debugPrint("T is >>>>>>>>> $T");
    if (json == null) {
      return null as T;
    } else if (json is T ||
        json is Map<String, dynamic> ||
        json is List<dynamic>) {
      return json as T;
    } else {
      throw ArgumentError.value(json, 'json', 'Expected a Map or List');
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
