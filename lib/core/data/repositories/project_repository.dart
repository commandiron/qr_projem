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

  Future<String?> insertProject(Project project) async {
    final user = await auth.authStateChanges().first;
    if(user != null) {
      final projectId = const Uuid().v4();
      DatabaseReference ref = database.ref("projects/${user.uid}/$projectId");
      await ref.set(project.toJson());
      return projectId;
    }
    return null;
  }

  Future<Project?> getProjectById(String projectId) async {
    final user = await auth.authStateChanges().first;
    if(user != null) {
      DatabaseReference ref = database.ref("projects/${user.uid}/$projectId");
      final data = await ref.get() as Map<String, dynamic>;

      final project = Project.fromJson(data);

      return project;
    }
    return null;
  }

  Future<void> updateProjectPaymentStatus(String projectId, PaymentStatus paymentStatus) async {
    final user = await auth.authStateChanges().first;
    if(user != null) {
      DatabaseReference ref = database.ref("projects/${user.uid}/$projectId/paymentStatus");
      await ref.set(paymentStatus.name);
    }
  }

  Future<void> updateProjectTemplateVersion(String projectId, String templateVersion) async {
    final user = await auth.authStateChanges().first;
    if(user != null) {
      DatabaseReference ref = database.ref("projects/${user.uid}/$projectId/templateVersion");
      await ref.set(templateVersion);
    }
  }
}
