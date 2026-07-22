class WorkExperienceItem {
  final String role;
  final String company;
  final String duration;
  final String location;
  final bool isRemote;
  final List<String> bulletPoints;
  final List<String> technologies;

  WorkExperienceItem({
    required this.role,
    required this.company,
    required this.duration,
    required this.location,
    required this.isRemote,
    required this.bulletPoints,
    required this.technologies,
  });
}
