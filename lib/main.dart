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

  @override
  void initState() {
    super.initState();
    _portfolioController = PortfolioController();
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
          home: PortfolioPage(
            portfolioController: _portfolioController,
            onToggleTheme: widget.themeController.toggleTheme,
            isDarkMode: widget.themeController.isDark,
          ),
        );
      },
    );
  }
}
