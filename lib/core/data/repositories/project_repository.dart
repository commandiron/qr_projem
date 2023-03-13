import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../domain/model/project.dart';

class ProjectRepository {

  final database = FirebaseDatabase.instance;
  final auth = FirebaseAuth.instance;

  Future<void> adminInsert(String uid, String id, Project project) async {
    DatabaseReference ref = database.ref("projects/$uid/$id");
    ref.set(project.toJson());
  }

  Future<String?> insertProject(Project project) async {
    try {
      final user = await auth.authStateChanges().first;
      if(user != null) {
        final projectId = project.id;
        DatabaseReference ref = database.ref("projects/${user.uid}/$projectId");
        await ref.set(project.toJson());
        return projectId;
      }
      return null;
    } on FirebaseException catch(_) {
      return null;
    }
  }

  Future<bool?> deleteUserProjectById(String projectId) async {
    try {
      final user = await auth.authStateChanges().first;
      if(user != null) {
        DatabaseReference ref = database.ref("projects/${user.uid}/$projectId");
        await ref.set(null);
        return true;
      }
      return null;
    } on FirebaseException catch(_) {
      return null;
    }
  }

  Future<List<Project>?> getUserProjects() async {
    try {
      List<Project> projects = [];
      final user = await auth.authStateChanges().first;
      if(user != null) {
        DatabaseReference ref = database.ref("projects/${user.uid}");
        final response = await ref.get();
        final data =  response.value as Map<String, dynamic>?;
        if(data == null) {
          return projects;
        }
        data.forEach(
                (key, value) {
              projects.add(Project.fromJson(value));
            }
        );
      }
      return projects;
    } on FirebaseException catch(_) {
      return null;
    }
  }

  Future<Project?> getUserProjectById(String projectId) async {
    try {
      final user = await auth.authStateChanges().first;
      if(user != null) {
        DatabaseReference ref = database.ref("projects/${user.uid}/$projectId");
        final response = await ref.get();
        final data =  response.value as Map<String, dynamic>;
        final project = Project.fromJson(data);
        return project;
      }
      return null;
    } on FirebaseException catch(_) {
      return null;
    }
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
