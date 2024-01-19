import 'package:dio/dio.dart';
import 'dart:io';
// ignore: depend_on_referenced_packages
// import 'package:http_parser/http_parser.dart';

Future<MultipartFile> getMultipartFile(File file) async {
  return MultipartFile.fromFileSync(
    file.path,
    filename: file.path.split(Platform.pathSeparator).last,
    // contentType: MediaType('image', 'jpeg'), // Change accordingly
  );
}

Object? readValue(Map<dynamic, dynamic> json, String key) {
  // Your custom logic for deserialization goes here
  // For example, return json[key] to get the value from the map
  return json[key];
}

