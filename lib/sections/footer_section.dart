import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';
import '../core/utils/launch_utils.dart';
import '../widgets/section_container.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;

    return SectionContainer(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      child: Column(
        children: [
          Divider(color: Theme.of(context).colorScheme.outlineVariant),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 12,
            children: [
              Text('Copyright $year Uday Reddy. All rights reserved.'),
              IconButton(
                onPressed: () => LaunchUtils.openUrl(AppConstants.githubUrl),
                icon: const Icon(Icons.code),
                tooltip: 'GitHub',
              ),
              IconButton(
                onPressed: () => LaunchUtils.openUrl(AppConstants.linkedInUrl),
                icon: const Icon(Icons.business),
                tooltip: 'LinkedIn',
              ),
              IconButton(
                onPressed: () => LaunchUtils.openUrl(AppConstants.youtubeUrl),
                icon: const Icon(Icons.play_circle_outline),
                tooltip: 'YouTube',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
