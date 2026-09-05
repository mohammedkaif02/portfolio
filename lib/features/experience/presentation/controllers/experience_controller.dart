import 'package:get/get.dart';
import 'package:portfolio/features/experience/domain/entities/work_experience_entity.dart';
import 'package:portfolio/features/experience/domain/usecases/get_experience_usecase.dart';

class ExperienceController extends GetxController {
  final GetExperienceUseCase getExperienceUseCase;

  ExperienceController({required this.getExperienceUseCase});

  final RxList<WorkExperienceEntity> experiences = <WorkExperienceEntity>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadExperiences();
  }

  Future<void> loadExperiences() async {
    isLoading.value = true;
    errorMessage.value = "";
    final result = await getExperienceUseCase.execute();
    result.when(
      success: (data) {
        experiences.assignAll(data);
        isLoading.value = false;
      },
      error: (failure) {
        errorMessage.value = failure.message;
        isLoading.value = false;
      },
    );
  }
}
