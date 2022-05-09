import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:interintel/model/todo.dart';

class TodoApi {
  Response? response;
  Dio dio = Dio();
  String baseUrl = "https://jsonplaceholder.typicode.com/todos?_limit=5";
  Future<List<ToDo>> fetchTodos(context) async {
    List<ToDo> todos = [];
    try {
      response = await dio.get(baseUrl);
      print(response!.data.toString());
      final List todoActivities = response!.data;
      todos = todoActivities.map((json) => ToDo.fromJson(json)).toList();
    } on DioError catch (e) {
      if (e is DioError) {
        //This is the custom message coming from the backend
        throw e.response!.data['errors'][0] ?? "Error";
      } else {
        throw Exception("Error");
      }
    }
    return todos;
  }
}
