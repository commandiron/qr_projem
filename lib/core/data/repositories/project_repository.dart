import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../model/project.dart';

class ProjectRepository {
  final String databaseUrl =
      "https://qrprojem-default-rtdb.europe-west1.firebasedatabase.app/projects";

  void insertProject(Project project) {
    final databaseUri = Uri.parse("$databaseUrl/${project.id}.json");
    http.put(databaseUri, body: json.encode(project.toJson()));
  }
}
