import '../core/constants/app_constants.dart';
import '../models/experience_model.dart';
import '../models/package_model.dart';
import '../models/project_model.dart';

class PortfolioData {
  const PortfolioData._();

  static const summary =
      'Mobile Application Developer with 6 Years 2 Months of experience in '
      'Flutter, Dart, and Android application development.';

  static const about =
      'I build and maintain mobile applications with a strong focus on clean '
      'architecture, scalable implementation, and production-ready delivery.';

  static const career =
      'I work across complete delivery cycles including feature development, '
      'API integration, testing, release support, and long-term maintenance.';

  static const flutterExperience =
      'Hands-on with Flutter and Dart, BLoC state management, MVVM and MVC '
      'patterns, and mobile performance optimization.';

  static const iotExperience =
      'Experienced with Firebase, REST API integration, Postman, GitHub/GitLab, '
      'and Android platform development with Kotlin and Core Java.';

  static const totalExperience = '6 Years 2 Months';

  static const location = {'City': 'Bengaluru', 'Country': 'INDIA'};

  static const hobbies = ['Travel', 'Sports'];

  static const languages = ['Hindi', 'Telugu', 'English'];

  static const skillGroups = {
    'Core Mobile': [
      'Flutter & Dart',
      'Android',
      'Android Developer',
      'Mobile Application Development',
    ],
    'Architecture & State': ['BLoC Statemanagement', 'MVVM & MVC'],
    'APIs & Services': ['Firebase', 'Postman API'],
    'Programming': ['Core Java', 'Kotlin', 'HTML & CSS'],
    'Tools': ['Git', 'Github', 'Gitlab'],
  };

  static const achievements = [
    '6 Years 2 Months Experience',
    'Flutter & Dart Developer',
    'Android Application Specialist',
    'BLoC and MVVM/MVC Practitioner',
  ];

  static const projects = [
    ProjectModel(
      title: 'BuildCalc',
      description:
          'Construction calculator app for engineers and builders with cement, '
          'brick, sand, steel, tile, and cost estimation tools.',
      technologies: ['Flutter', 'Dart', 'Construction Tools', 'Android'],
      imageLabel: 'BuildCalc',
      githubUrl: AppConstants.githubUrl,
      liveDemoUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.buildcalc',
    ),
    ProjectModel(
      title: 'LoanBee EMI Calculator',
      description:
          'Finance utility app for EMI, loan planning, SIP, FD/RD, GST, and '
          'interest calculations with clean and modern UI.',
      technologies: ['Flutter', 'Finance', 'BLoC', 'Android'],
      imageLabel: 'LoanBee',
      githubUrl: AppConstants.githubUrl,
      liveDemoUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.loanbee',
    ),
    ProjectModel(
      title: 'Memo Keeper - Simple Notes',
      description:
          'Lightweight note-taking app with offline storage, reminders, note '
          'search, dark mode, and simple productivity-focused UX.',
      technologies: ['Flutter', 'Offline Storage', 'Productivity', 'Android'],
      imageLabel: 'Memo Keeper',
      githubUrl: AppConstants.githubUrl,
      liveDemoUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.memokeeper',
    ),
    ProjectModel(
      title: 'NexCalc',
      description:
          'Modern calculator app for everyday arithmetic with real-time '
          'expression handling and smooth performance.',
      technologies: ['Flutter', 'BLoC', 'Calculator', 'Android'],
      imageLabel: 'NexCalc',
      githubUrl: AppConstants.githubUrl,
      liveDemoUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.nexcalc',
    ),
    ProjectModel(
      title: 'FemGlow - Period & Cycle Tracker',
      description:
          'Health tracker app with cycle predictions, reminders, symptom logs, '
          'calendar history, and privacy-focused experience.',
      technologies: ['Flutter', 'Health', 'Notifications', 'Android'],
      imageLabel: 'FemGlow',
      githubUrl: AppConstants.githubUrl,
      liveDemoUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.femglow',
    ),
    ProjectModel(
      title: 'TrackGoldPro',
      description:
          'Gold price tracking app with live rates, city-wise coverage, and '
          'theme/language preferences for Indian users.',
      technologies: ['Flutter', 'Firebase', 'Business', 'Android'],
      imageLabel: 'TrackGoldPro',
      githubUrl: AppConstants.githubUrl,
      liveDemoUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.trackgoldpro',
    ),
    ProjectModel(
      title: 'Dubai Malls',
      description:
          'Mall companion app to explore shops, offers, restaurants, events, '
          'and cinema experiences across Dubai.',
      technologies: ['Flutter', 'Lifestyle', 'Location', 'Android'],
      imageLabel: 'Dubai Malls',
      githubUrl: AppConstants.githubUrl,
      liveDemoUrl:
          'https://play.google.com/store/apps/details?id=in.uksolutions.dubaimalls',
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
      company: 'Ecozen Solutions Pvt Ltd',
      role: 'Android Developer',
      duration: 'May 2024 - Present',
      responsibilities: [
        'Developed and implemented robust Android applications with optimized UI/UX and improved performance.',
        'Collaborated with cross-functional teams to deliver new features on schedule and improve app adoption.',
        'Maintained and upgraded app modules using Kotlin and Java, reducing crash rates through debugging and testing.',
      ],
    ),
    ExperienceModel(
      company: 'TATA Medical and Diagnostics Pvt Ltd',
      role: 'Flutter Developer',
      duration: 'Mar 2022 - Apr 2024',
      responsibilities: [
        'Implemented application UI and reusable custom widgets from scratch using Agile methodology.',
        'Integrated OAuth, high-security device communication, and third-party libraries with backend APIs.',
        'Built common feature packages for messaging, audio/video calls, notifications, and localization.',
        'Worked with BLoC architecture, complex UI modules, sprint planning, unit testing, and performance optimization.',
        'Monitored analytics and Crashlytics in Firebase and supported app releases to Play Store and App Store.',
      ],
    ),
    ExperienceModel(
      company: 'UTF Technologies India Pvt Ltd',
      role: 'Flutter Software Developer',
      duration: 'Feb 2021 - Mar 2022',
      responsibilities: [
        'Developed consistent, performant Flutter apps for Android and iOS and managed store deployments.',
        'Worked with SDLC practices, API integrations, and user-friendly UI/UX implementation.',
        'Applied state management approaches such as Provider and BLoC based on project requirements.',
        'Resolved bugs across code, design patterns, and runtime behavior during active project cycles.',
      ],
    ),
    ExperienceModel(
      company: 'Xanthus Software Solutions',
      role: 'Android Developer',
      duration: 'Sep 2019 - Nov 2020',
      responsibilities: [
        'Handled design, build, deployment, debugging, and maintenance of Android applications for Google Play.',
        'Delivered solutions aligned with SDLC standards and tested across multiple device profiles.',
        'Developed clean, modular code using Java, XML, Android SDK, and Kotlin-based components.',
        'Fixed bugs and design-pattern-level issues to improve reliability in production environments.',
      ],
    ),
  ];
}
