class ProjectItem {
  final String image;
  final String heading;
  final String description;
  final String category;
  final List<String> technologies;
  final List<String> highlights;

  ProjectItem({
    required this.image,
    required this.heading,
    required this.description,
    required this.category,
    required this.technologies,
    required this.highlights,
  });
}
