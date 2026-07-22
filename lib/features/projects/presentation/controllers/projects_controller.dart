import 'package:get/get.dart';
import 'package:mr_portfolio/core/constants/static_data.dart';
import 'package:mr_portfolio/features/projects/data/models/project_model.dart';

class ProjectsController extends GetxController {
  final RxString selectedCategory = "All".obs;

  final List<String> categories = const [
    "All",
    "Enterprise System",
    "Web Platform",
    "Mobile App",
  ];

  List<ProjectItem> get filteredProjects {
    if (selectedCategory.value == "All") {
      return StaticData.projectList;
    }
    return StaticData.projectList
        .where((project) => project.category == selectedCategory.value)
        .toList();
  }

  void setCategory(String category) {
    selectedCategory.value = category;
    update();
  }
}
