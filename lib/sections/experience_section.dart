import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../widgets/experience_timeline_item.dart';
import '../widgets/section_container.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),
          ...PortfolioData.experience.asMap().entries.map(
            (entry) => ExperienceTimelineItem(
              experience: entry.value,
              isLast: entry.key == PortfolioData.experience.length - 1,
            ),
          ),
        ],
      ),
    );
  }
}
