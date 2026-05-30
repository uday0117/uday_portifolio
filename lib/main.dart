import 'package:flutter/material.dart';

import 'controllers/portfolio_controller.dart';
import 'controllers/theme_controller.dart';
import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'pages/portfolio_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeController = await ThemeController.create();
  runApp(PortfolioApp(themeController: themeController));
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({required this.themeController, super.key});

  final ThemeController themeController;

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  late final PortfolioController _portfolioController;
  bool _showLoader = true;

  @override
  void initState() {
    super.initState();
    _portfolioController = PortfolioController();
    Future<void>.delayed(const Duration(milliseconds: 1800), () {
      if (mounted) {
        setState(() => _showLoader = false);
      }
    });
  }

  @override
  void dispose() {
    _portfolioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.themeController,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          themeMode: widget.themeController.mode,
          home: AnimatedSwitcher(
            duration: const Duration(milliseconds: 550),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            child: _showLoader
                ? const _StartupLoader()
                : PortfolioPage(
                    portfolioController: _portfolioController,
                    onToggleTheme: widget.themeController.toggleTheme,
                    isDarkMode: widget.themeController.isDark,
                  ),
          ),
        );
      },
    );
  }
}

class _StartupLoader extends StatefulWidget {
  const _StartupLoader();

  @override
  State<_StartupLoader> createState() => _StartupLoaderState();
}

class _StartupLoaderState extends State<_StartupLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
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
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colors.primaryContainer.withValues(alpha: 0.45),
              colors.surface,
              colors.tertiaryContainer.withValues(alpha: 0.35),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RotationTransition(
                turns: Tween<double>(begin: -0.02, end: 0.02).animate(
                  CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
                ),
                child: Text(
                  'Uday Kumar Reddy',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Building premium Flutter experiences',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 220,
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(999),
                  minHeight: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
