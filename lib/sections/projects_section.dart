import 'dart:async';

import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../widgets/project_card.dart';
import '../widgets/section_container.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  late final PageController _pageController;
  Timer? _timer;
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!_pageController.hasClients || PortfolioData.projects.isEmpty) {
        return;
      }
      final next = (_activeIndex + 1) % PortfolioData.projects.length;
      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projects = PortfolioData.projects;
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),
          Text(
            'Featured apps from Play Store',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 430,
            child: PageView.builder(
              controller: _pageController,
              itemCount: projects.length,
              onPageChanged: (index) => setState(() => _activeIndex = index),
              itemBuilder: (context, index) {
                final isActive = index == _activeIndex;
                return AnimatedScale(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  scale: isActive ? 1 : 0.965,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ProjectCard(project: projects[index]),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 14),
          Center(
            child: Wrap(
              spacing: 8,
              children: List.generate(projects.length, (index) {
                final isActive = index == _activeIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: isActive ? 26 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: isActive
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(
                            context,
                          ).colorScheme.outlineVariant.withValues(alpha: 0.65),
                    borderRadius: BorderRadius.circular(999),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
