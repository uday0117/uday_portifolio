class PackageModel {
  const PackageModel({
    required this.name,
    required this.description,
    required this.features,
    required this.installation,
    required this.pubUrl,
    required this.githubUrl,
  });

  final String name;
  final String description;
  final List<String> features;
  final String installation;
  final String pubUrl;
  final String githubUrl;
}
