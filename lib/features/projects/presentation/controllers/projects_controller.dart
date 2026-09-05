import 'package:get/get.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';
import 'package:portfolio/features/projects/domain/usecases/filter_projects_usecase.dart';
import 'package:portfolio/features/projects/domain/usecases/get_projects_usecase.dart';

class ProjectsController extends GetxController {
  final GetProjectsUseCase getProjectsUseCase;
  final FilterProjectsUseCase filterProjectsUseCase;

  ProjectsController({
    required this.getProjectsUseCase,
    required this.filterProjectsUseCase,
  });

  final RxString selectedCategory = "All".obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = "".obs;
  final RxList<ProjectEntity> projects = <ProjectEntity>[].obs;

  final List<String> categories = const [
    "All",
    "Enterprise System",
    "Web Platform",
    "Mobile App",
  ];

  @override
  void onInit() {
    super.onInit();
    loadProjects();
  }

  Future<void> loadProjects() async {
    isLoading.value = true;
    errorMessage.value = "";
    final result = await getProjectsUseCase.execute();
    result.when(
      success: (data) {
        projects.assignAll(data);
        isLoading.value = false;
      },
      error: (failure) {
        errorMessage.value = failure.message;
        isLoading.value = false;
      },
    );
  }

  Future<void> setCategory(String category) async {
    selectedCategory.value = category;
    isLoading.value = true;
    errorMessage.value = "";
    final result = await filterProjectsUseCase.execute(category);
    result.when(
      success: (data) {
        projects.assignAll(data);
        isLoading.value = false;
      },
      error: (failure) {
        errorMessage.value = failure.message;
        isLoading.value = false;
      },
    );
  }

  List<ProjectEntity> get filteredProjects => projects;
}
