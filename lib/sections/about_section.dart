import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../widgets/section_container.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 14),
              Text(PortfolioData.about),
              const SizedBox(height: 14),
              Text(PortfolioData.career),
              const SizedBox(height: 14),
              Text(PortfolioData.flutterExperience),
              const SizedBox(height: 14),
              Text(PortfolioData.iotExperience),
              const SizedBox(height: 20),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  Chip(
                    label: Text(
                      'Total Experience: ${PortfolioData.totalExperience}',
                    ),
                  ),
                  Chip(
                    label: Text(
                      'Location: ${PortfolioData.location['City']}, '
                      '${PortfolioData.location['Country']}',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                'Hobbies: ${PortfolioData.hobbies.join(', ')}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Languages: ${PortfolioData.languages.join(', ')}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
