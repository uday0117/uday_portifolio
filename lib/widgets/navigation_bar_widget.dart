import 'package:flutter/material.dart';

import '../controllers/portfolio_controller.dart';
import '../core/utils/responsive_helper.dart';

typedef SectionTap = Future<void> Function(PortfolioSection section);

class NavigationBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const NavigationBarWidget({
    required this.onSectionTap,
    required this.onToggleTheme,
    required this.isDarkMode,
    super.key,
  });

  final SectionTap onSectionTap;
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    if (isMobile) {
      return AppBar(
        title: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.titleMedium,
            children: [
              const TextSpan(text: '< '),
              TextSpan(
                text: 'Uday',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const TextSpan(text: ' />'),
            ],
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Toggle theme',
            onPressed: onToggleTheme,
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      );
    }

    final navItems = <(String, PortfolioSection)>[
      ('Home', PortfolioSection.home),
      ('About', PortfolioSection.about),
      ('Skills', PortfolioSection.skills),
      ('Projects', PortfolioSection.projects),
      ('Packages', PortfolioSection.packages),
      ('Experience', PortfolioSection.experience),
      ('Contact', PortfolioSection.contact),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.76),
        border: Border(
          bottom: BorderSide(
            color: Theme.of(
              context,
            ).colorScheme.primary.withValues(alpha: 0.22),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(
              context,
            ).colorScheme.primary.withValues(alpha: 0.08),
            blurRadius: 22,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.titleLarge,
              children: [
                const TextSpan(text: '< '),
                TextSpan(
                  text: 'Uday',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const TextSpan(text: ' />'),
              ],
            ),
          ),
          const Spacer(),
          Wrap(
            spacing: 6,
            children: navItems
                .map(
                  (item) => TextButton(
                    onPressed: () => onSectionTap(item.$2),
                    child: Text(item.$1),
                  ),
                )
                .toList(),
          ),
          const SizedBox(width: 12),
          IconButton(
            tooltip: 'Toggle theme',
            onPressed: onToggleTheme,
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
    );
  }
}
