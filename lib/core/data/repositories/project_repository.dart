import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';
import '../../domain/model/project.dart';

class ProjectRepository {

  final database = FirebaseDatabase.instance;
  final auth = FirebaseAuth.instance;

  Future<void> adminInsert(String uid, String id, Project project) async {
    DatabaseReference ref = database.ref("projects/$uid/$id");
    ref.set(project.toJson());
  }

  Future<void> insertProject(Project project) async {
    final user = await auth.authStateChanges().first;
    if(user != null) {
      final projectId = const Uuid().v4();
      DatabaseReference ref = database.ref("projects/${user.uid}/$projectId");
      await ref.set(project.toJson());
    }
  }
}
