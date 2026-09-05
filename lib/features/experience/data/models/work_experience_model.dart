import 'package:portfolio/features/experience/domain/entities/work_experience_entity.dart';

class WorkExperienceModel extends WorkExperienceEntity {
  const WorkExperienceModel({
    required super.role,
    required super.company,
    required super.duration,
    required super.location,
    required super.isRemote,
    required super.bulletPoints,
    required super.technologies,
  });

  factory WorkExperienceModel.fromJson(Map<String, dynamic> json) {
    return WorkExperienceModel(
      role: json['role'] as String? ?? '',
      company: json['company'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      location: json['location'] as String? ?? '',
      isRemote: json['isRemote'] as bool? ?? false,
      bulletPoints: List<String>.from(json['bulletPoints'] ?? []),
      technologies: List<String>.from(json['technologies'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'company': company,
      'duration': duration,
      'location': location,
      'isRemote': isRemote,
      'bulletPoints': bulletPoints,
      'technologies': technologies,
    };
  }

  WorkExperienceEntity toEntity() => this;
}

typedef WorkExperienceItem = WorkExperienceEntity;
