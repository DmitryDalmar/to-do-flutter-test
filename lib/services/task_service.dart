import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:to_do_flutter_test/models/task.dart';

class TaskService {
  static const _apiUrl = 'http://0jyzknc9xi.laravel-sail.site:8080/api/task';
  static const _headers = {'Accept': 'application/json'};
  static const _statusCodeRemove = 200;

  Future<List<Task>> getTasks() {
    return http
        .get(Uri.parse("$_apiUrl?order_by=id&order_type=desc"),
            headers: _headers)
        .then((data) {
      final Map<String, dynamic> jsonData = jsonDecode(data.body);
      final tasks = <Task>[];

      for (var jsonItem in jsonData['data']) {
        tasks.add(Task.fromJson(jsonItem));
      }

      return tasks;
    });
  }

  Future<Task> addTask(String title) {
    return http.post(Uri.parse(_apiUrl),
        headers: _headers, body: {'title': title}).then((data) {
      return Task.fromJson(jsonDecode(data.body)['data']);
    });
  }

  Future<bool> removeTask(int id) {
    return http
        .delete(Uri.parse("$_apiUrl/$id"), headers: _headers)
        .then((data) {
      return data.statusCode == _statusCodeRemove;
    });
  }
}
