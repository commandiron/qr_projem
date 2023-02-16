import '../model/project.dart';

abstract class ProjectRepository {
  void insertProject(Project project);
}