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
  String _selectedTag = 'All';

  @override
  Widget build(BuildContext context) {
    final projects = PortfolioData.projects;
    final tags = <String>{'All'};
    for (final project in projects) {
      tags.addAll(project.technologies.take(3));
    }

    final filteredProjects = _selectedTag == 'All'
        ? projects
        : projects
              .where((project) => project.technologies.contains(_selectedTag))
              .toList();

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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                colors: [
                  Theme.of(
                    context,
                  ).colorScheme.primaryContainer.withValues(alpha: 0.45),
                  Theme.of(context).colorScheme.surface.withValues(alpha: 0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
            child: Wrap(
              spacing: 20,
              runSpacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.rocket_launch_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${projects.length}+ Published Apps',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Published apps from Play Store with real-world categories',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: tags
                .map(
                  (tag) => ChoiceChip(
                    selected: _selectedTag == tag,
                    label: Text(tag),
                    onSelected: (_) => setState(() => _selectedTag = tag),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final cardWidth = width >= 1120
                  ? (width - 40) / 3
                  : width >= 760
                  ? (width - 20) / 2
                  : width;

              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: filteredProjects.asMap().entries.map((entry) {
                  final index = entry.key;
                  final project = entry.value;
                  return TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: Duration(milliseconds: 360 + (index * 70)),
                    curve: Curves.easeOutCubic,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, (1 - value) * 14),
                        child: Opacity(opacity: value, child: child),
                      );
                    },
                    child: SizedBox(
                      width: cardWidth,
                      child: ProjectCard(project: project),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
