class ProjectModel {
  const ProjectModel({
    required this.title,
    required this.description,
    required this.technologies,
    required this.imageLabel,
    required this.githubUrl,
    required this.liveDemoUrl,
  });

  final String title;
  final String description;
  final List<String> technologies;
  final String imageLabel;
  final String githubUrl;
  final String liveDemoUrl;
}
