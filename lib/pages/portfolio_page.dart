import 'package:flutter/material.dart';

import '../controllers/portfolio_controller.dart';
import '../core/utils/animated_section.dart';
import '../core/utils/responsive_helper.dart';
import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/experience_section.dart';
import '../sections/footer_section.dart';
import '../sections/hero_section.dart';
import '../sections/packages_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../widgets/navigation_bar_widget.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({
    required this.portfolioController,
    required this.onToggleTheme,
    required this.isDarkMode,
    super.key,
  });

  final PortfolioController portfolioController;
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Scaffold(
      drawer: isMobile
          ? _MobileNavDrawer(
              onSectionTap: portfolioController.scrollTo,
              onToggleTheme: onToggleTheme,
              isDarkMode: isDarkMode,
            )
          : null,
      appBar: isMobile
          ? NavigationBarWidget(
              onSectionTap: portfolioController.scrollTo,
              onToggleTheme: onToggleTheme,
              isDarkMode: isDarkMode,
            )
          : null,
      body: Column(
        children: [
          if (!isMobile)
            NavigationBarWidget(
              onSectionTap: portfolioController.scrollTo,
              onToggleTheme: onToggleTheme,
              isDarkMode: isDarkMode,
            ),
          Expanded(
            child: Stack(
              children: [
                const Positioned.fill(child: _AtmosphereBackground()),
                SingleChildScrollView(
                  controller: portfolioController.scrollController,
                  child: Column(
                    children: [
                      _SectionAnchor(
                        sectionKey: portfolioController
                            .sectionKeys[PortfolioSection.home]!,
                        child: AnimatedSection(
                          delay: const Duration(milliseconds: 50),
                          child: HeroSection(
                            onContactTap: () => portfolioController.scrollTo(
                              PortfolioSection.contact,
                            ),
                          ),
                        ),
                      ),
                      _SectionAnchor(
                        sectionKey: portfolioController
                            .sectionKeys[PortfolioSection.about]!,
                        child: const AnimatedSection(
                          delay: Duration(milliseconds: 120),
                          child: AboutSection(),
                        ),
                      ),
                      _SectionAnchor(
                        sectionKey: portfolioController
                            .sectionKeys[PortfolioSection.skills]!,
                        child: const AnimatedSection(
                          delay: Duration(milliseconds: 170),
                          child: SkillsSection(),
                        ),
                      ),
                      _SectionAnchor(
                        sectionKey: portfolioController
                            .sectionKeys[PortfolioSection.projects]!,
                        child: const AnimatedSection(
                          delay: Duration(milliseconds: 220),
                          child: ProjectsSection(),
                        ),
                      ),
                      _SectionAnchor(
                        sectionKey: portfolioController
                            .sectionKeys[PortfolioSection.packages]!,
                        child: const AnimatedSection(
                          delay: Duration(milliseconds: 260),
                          child: PackagesSection(),
                        ),
                      ),
                      _SectionAnchor(
                        sectionKey: portfolioController
                            .sectionKeys[PortfolioSection.experience]!,
                        child: const AnimatedSection(
                          delay: Duration(milliseconds: 300),
                          child: ExperienceSection(),
                        ),
                      ),
                      _SectionAnchor(
                        sectionKey: portfolioController
                            .sectionKeys[PortfolioSection.contact]!,
                        child: const AnimatedSection(
                          delay: Duration(milliseconds: 340),
                          child: ContactSection(),
                        ),
                      ),
                      const FooterSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AtmosphereBackground extends StatefulWidget {
  const _AtmosphereBackground();

  @override
  State<_AtmosphereBackground> createState() => _AtmosphereBackgroundState();
}

class _AtmosphereBackgroundState extends State<_AtmosphereBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;
        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colors.primaryContainer.withValues(alpha: 0.24 + (0.04 * t)),
                colors.surface,
                colors.tertiaryContainer.withValues(
                  alpha: 0.16 + (0.05 * (1 - t)),
                ),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 60 + (36 * t),
                left: -70,
                child: _GlowOrb(
                  size: 240,
                  color: colors.primary.withValues(alpha: 0.18),
                ),
              ),
              Positioned(
                right: -90,
                top: 280 - (40 * t),
                child: _GlowOrb(
                  size: 290,
                  color: colors.tertiary.withValues(alpha: 0.16),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [color, color.withValues(alpha: 0)],
            stops: const [0.18, 1],
          ),
        ),
      ),
    );
  }
}

class _SectionAnchor extends StatelessWidget {
  const _SectionAnchor({required this.sectionKey, required this.child});

  final GlobalKey sectionKey;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(key: sectionKey, width: double.infinity, child: child);
  }
}

class _MobileNavDrawer extends StatelessWidget {
  const _MobileNavDrawer({
    required this.onSectionTap,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  final SectionTap onSectionTap;
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    final navItems = <(String, PortfolioSection)>[
      ('Home', PortfolioSection.home),
      ('About', PortfolioSection.about),
      ('Skills', PortfolioSection.skills),
      ('Projects', PortfolioSection.projects),
      ('Packages', PortfolioSection.packages),
      ('Experience', PortfolioSection.experience),
      ('Contact', PortfolioSection.contact),
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Uday Reddy',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          ...navItems.map(
            (item) => ListTile(
              title: Text(item.$1),
              onTap: () async {
                Navigator.of(context).pop();
                await onSectionTap(item.$2);
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            title: Text(
              isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
            ),
            onTap: () {
              Navigator.of(context).pop();
              onToggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
