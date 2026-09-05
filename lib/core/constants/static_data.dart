import 'package:portfolio/features/experience/data/datasources/experience_local_data_source.dart';
import 'package:portfolio/features/experience/domain/entities/work_experience_entity.dart';
import 'package:portfolio/features/projects/data/datasources/project_local_data_source.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';
import 'package:portfolio/features/skills/data/datasources/skills_local_data_source.dart';
import 'package:portfolio/features/skills/domain/entities/skill_category_entity.dart';

class StaticData {
  static final List<SkillCategoryEntity> skillData =
      SkillsLocalDataSourceImpl().getSkills() as dynamic;

  static final List<ProjectEntity> projectList =
      ProjectLocalDataSourceImpl().getProjects() as dynamic;

  static final List<WorkExperienceEntity> experienceList =
      ExperienceLocalDataSourceImpl().getExperiences() as dynamic;
}
