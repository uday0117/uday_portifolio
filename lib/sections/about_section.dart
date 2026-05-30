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
            ],
          ),
        ),
      ),
    );
  }
}
