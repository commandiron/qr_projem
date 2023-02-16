import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../domain/model/project.dart';
import '../../domain/repository/project_repository.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  final String databaseUrl =
      "https://qrprojem-default-rtdb.europe-west1.firebasedatabase.app/projects";

  @override
  void insertProject(Project project) {
    final databaseUri = Uri.parse("$databaseUrl/${project.id}.json");
    http.put(databaseUri, body: json.encode(project.toJson()));
  }
}
