import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../domain/model/project.dart';

class ProjectRepository {

  final database = FirebaseDatabase.instance;
  final auth = FirebaseAuth.instance;

  Future<void> insertProject(Project project) async {
    final user = await auth.authStateChanges().first;
    if(user != null) {
      DatabaseReference ref = database.ref("projects/${user.uid}/${project.id}");
      ref.set(project.toJson());
    }
  }
}
