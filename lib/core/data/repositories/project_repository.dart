import 'package:firebase_database/firebase_database.dart';
import '../../domain/model/project.dart';

class ProjectRepository {
  final String databaseUrl =
      "https://qrprojem-default-rtdb.europe-west1.firebasedatabase.app/projects";

  void insertProject(Project project) {
    DatabaseReference ref = FirebaseDatabase.instance.ref("projects/${project.id}");
    ref.set(project.toJson());
  }
}
