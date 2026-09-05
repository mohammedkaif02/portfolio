import 'package:portfolio/features/projects/domain/entities/project_entity.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    required super.id,
    required super.title,
    required super.category,
    required super.description,
    required super.image,
    required super.technologies,
    required super.highlights,
    super.githubUrl,
    super.liveUrl,
    super.playStoreUrl,
    super.architectureOverview,
    super.keyMetrics = const {},
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      category: json['category'] as String? ?? '',
      description: json['description'] as String? ?? '',
      image: json['image'] as String? ?? '',
      technologies: List<String>.from(json['technologies'] ?? []),
      highlights: List<String>.from(json['highlights'] ?? []),
      githubUrl: json['githubUrl'] as String?,
      liveUrl: json['liveUrl'] as String?,
      playStoreUrl: json['playStoreUrl'] as String?,
      architectureOverview: json['architectureOverview'] as String?,
      keyMetrics: Map<String, String>.from(json['keyMetrics'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'description': description,
      'image': image,
      'technologies': technologies,
      'highlights': highlights,
      'githubUrl': githubUrl,
      'liveUrl': liveUrl,
      'playStoreUrl': playStoreUrl,
      'architectureOverview': architectureOverview,
      'keyMetrics': keyMetrics,
    };
  }

  ProjectEntity toEntity() => this;
}

typedef ProjectItem = ProjectEntity;
