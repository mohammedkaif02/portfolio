class ProjectEntity {
  final String id;
  final String title;
  final String category;
  final String description;
  final String image;
  final List<String> technologies;
  final List<String> highlights;
  final String? githubUrl;
  final String? liveUrl;
  final String? playStoreUrl;
  final String? architectureOverview;
  final Map<String, String> keyMetrics;

  const ProjectEntity({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.image,
    required this.technologies,
    required this.highlights,
    this.githubUrl,
    this.liveUrl,
    this.playStoreUrl,
    this.architectureOverview,
    this.keyMetrics = const {},
  });
}
