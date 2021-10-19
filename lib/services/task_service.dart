import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:to_do_flutter_test/models/task.dart';

class TaskService {
  static const _apiUrl = 'http://24igeyfzrw.laravel-sail.site:8080/api/task';
  static const _headers = {'Accept': 'application/json'};
  static const _httpCodeCreate = 201;

  Future<List<Task>> getTasks() {
    return http.get(Uri.parse(_apiUrl), headers: _headers).then((data) {
      final Map<String, dynamic> jsonData = jsonDecode(data.body);
      final tasks = <Task>[];

      for (var item in jsonData['data']) {
        tasks.add(
            Task(id: item['id'], title: item['title']));
      }

      return tasks;
    });
  }

  Future<bool> addTask(String title) {
    return http.post(Uri.parse(_apiUrl),
        headers: _headers, body: {'title': title}).then((data) {
      return data.statusCode == _httpCodeCreate;
    });
  }
}
