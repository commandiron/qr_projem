import '../../../core/domain/model/project.dart';

abstract class ProjectRepository {
  void insertProject(Project project);
}