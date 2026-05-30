import 'package:flutter/material.dart';

import '../core/utils/launch_utils.dart';
import '../models/project_model.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({required this.project, super.key});

  final ProjectModel project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final project = widget.project;
    final isPlayStoreLink = project.liveDemoUrl.contains('play.google.com');

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOut,
        transform: Matrix4.identity()
          ..translateByDouble(0.0, _hovering ? -5.0 : 0.0, 0.0, 1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            if (_hovering)
              BoxShadow(
                color: colors.primary.withValues(alpha: 0.25),
                blurRadius: 24,
                spreadRadius: 2,
                offset: const Offset(0, 12),
              ),
          ],
        ),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      colors.primary.withValues(alpha: 0.52),
                      colors.tertiary.withValues(alpha: 0.35),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    project.imageLabel,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(project.description),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.technologies
                          .map(
                            (item) => Chip(
                              label: Text(item),
                              visualDensity: VisualDensity.compact,
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 16),
                    FilledButton.icon(
                      onPressed: () => LaunchUtils.openUrl(project.liveDemoUrl),
                      icon: Icon(
                        isPlayStoreLink
                            ? Icons.shop_2_outlined
                            : Icons.open_in_new,
                      ),
                      label: Text(
                        isPlayStoreLink ? 'View on Play Store' : 'Live Demo',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
