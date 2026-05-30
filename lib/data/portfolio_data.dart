import '../core/constants/app_constants.dart';
import '../models/experience_model.dart';
import '../models/package_model.dart';
import '../models/project_model.dart';

class PortfolioData {
  const PortfolioData._();

  static const summary =
      'Flutter developer focused on high-performance mobile and web products, '
      'with hands-on delivery in Bluetooth communication, IoT ecosystems, and '
      'robust API-driven applications.';

  static const about =
      'I am Uday Reddy, a Flutter Developer building production-grade apps '
      'with clean architecture and scalable state management. I deliver '
      'cross-platform products that balance polished UI, reliable data '
      'handling, and measurable business outcomes.';

  static const career =
      'My work spans enterprise dashboards, connected device interfaces, and '
      'customer-facing apps. I specialize in integrating real-time data '
      'pipelines and creating maintainable systems from MVP to release.';

  static const flutterExperience =
      'Experienced with Flutter, Dart, and GetX to craft adaptive interfaces, '
      'reusable component libraries, and performance-tuned rendering flows.';

  static const iotExperience =
      'Hands-on experience with BLE communication, MQTT messaging, IoT '
      'device orchestration, and secure cloud synchronization with Firebase '
      'and REST APIs.';

  static const skillGroups = {
    'Mobile Development': ['Flutter', 'Dart', 'Android Studio'],
    'State Management': ['GetX', 'Reactive Architecture'],
    'Backend & APIs': ['Firebase', 'REST API', 'MQTT', 'Bluetooth'],
    'Tools & Platforms': ['Git', 'GitHub', 'VS Code', 'CI/CD'],
  };

  static const achievements = [
    'Published Apps',
    'Pub.dev Package Author',
    'IoT Solutions',
    'Bluetooth Expert',
  ];

  static const projects = [
    ProjectModel(
      title: 'JalDrishti',
      description:
          'Smart water management dashboard connecting IoT sensors to a '
          'Flutter client for live quality metrics, alerts, and maintenance '
          'scheduling.',
      technologies: ['Flutter', 'Firebase', 'MQTT', 'REST API'],
      imageLabel: 'JalDrishti',
      githubUrl: AppConstants.githubUrl,
      liveDemoUrl: 'https://example.com/jaldrishti',
    ),
    ProjectModel(
      title: 'Ecotron',
      description:
          'Environmental monitoring platform with Bluetooth-connected '
          'hardware and cloud analytics to track field conditions in real time.',
      technologies: ['Flutter', 'Bluetooth', 'GetX', 'IoT'],
      imageLabel: 'Ecotron',
      githubUrl: AppConstants.githubUrl,
      liveDemoUrl: 'https://example.com/ecotron',
    ),
    ProjectModel(
      title: 'Warranty Management App',
      description:
          'Asset warranty lifecycle app for registration, reminders, claim '
          'tracking, and service history with secure account sync.',
      technologies: ['Flutter', 'Dart', 'REST API', 'Firebase'],
      imageLabel: 'Warranty',
      githubUrl: AppConstants.githubUrl,
      liveDemoUrl: 'https://example.com/warranty',
    ),
  ];

  static const package = PackageModel(
    name: 'NetWatchX',
    description:
        'A Flutter package for reliable network awareness and connection '
        'state monitoring with developer-friendly streams and callbacks.',
    features: [
      'Real-time connectivity state updates',
      'Simple API surface for production apps',
      'Lifecycle-aware listening controls',
      'Optimized for Flutter mobile and web use cases',
    ],
    installation: 'flutter pub add netwatchx',
    pubUrl: AppConstants.packagePubUrl,
    githubUrl: AppConstants.packageGithubUrl,
  );

  static const experience = [
    ExperienceModel(
      company: 'Uksolutions',
      role: 'Flutter Developer',
      duration: '2022 - Present',
      responsibilities: [
        'Built and maintained cross-platform Flutter applications.',
        'Integrated BLE and IoT workflows for smart device ecosystems.',
        'Implemented GetX-based architectures for scalable state handling.',
      ],
    ),
    ExperienceModel(
      company: 'Freelance Projects',
      role: 'Mobile App Consultant',
      duration: '2020 - 2022',
      responsibilities: [
        'Delivered custom Flutter apps for startups and SMB clients.',
        'Integrated Firebase services and API backends.',
        'Designed reusable UI systems and code standards for teams.',
      ],
    ),
  ];
}
