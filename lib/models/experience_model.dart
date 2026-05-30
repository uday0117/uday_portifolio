class ExperienceModel {
  const ExperienceModel({
    required this.company,
    required this.role,
    required this.duration,
    required this.responsibilities,
  });

  final String company;
  final String role;
  final String duration;
  final List<String> responsibilities;
}
