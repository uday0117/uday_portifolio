import 'package:flutter/material.dart';

enum PortfolioSection {
  home,
  about,
  skills,
  projects,
  packages,
  experience,
  contact,
}

class PortfolioController extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  final Map<PortfolioSection, GlobalKey> sectionKeys = {
    PortfolioSection.home: GlobalKey(),
    PortfolioSection.about: GlobalKey(),
    PortfolioSection.skills: GlobalKey(),
    PortfolioSection.projects: GlobalKey(),
    PortfolioSection.packages: GlobalKey(),
    PortfolioSection.experience: GlobalKey(),
    PortfolioSection.contact: GlobalKey(),
  };

  Future<void> scrollTo(PortfolioSection section) async {
    final context = sectionKeys[section]?.currentContext;
    if (context == null) return;

    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
      alignment: 0.06,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
