import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';
import '../core/utils/launch_utils.dart';
import '../core/utils/responsive_helper.dart';
import '../data/portfolio_data.dart';
import '../widgets/hero_badge.dart';
import '../widgets/section_container.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({required this.onContactTap, super.key});

  final VoidCallback onContactTap;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 32,
            runSpacing: 28,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                width: isMobile ? 130 : 172,
                height: isMobile ? 130 : 172,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.55),
                      Theme.of(
                        context,
                      ).colorScheme.tertiary.withValues(alpha: 0.45),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Icon(Icons.person, size: 72),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 740),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Uday Reddy',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Flutter Developer',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      PortfolioData.summary,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        FilledButton.icon(
                          onPressed: () =>
                              LaunchUtils.openUrl(AppConstants.resumeUrl),
                          icon: const Icon(Icons.download_rounded),
                          label: const Text('Download Resume'),
                        ),
                        OutlinedButton.icon(
                          onPressed: onContactTap,
                          icon: const Icon(Icons.mail_outline_rounded),
                          label: const Text('Contact Me'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: PortfolioData.achievements
                .map((item) => HeroBadge(label: item))
                .toList(),
          ),
        ],
      ),
    );
  }
}
