import 'package:flutter/material.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.tint,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? tint;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final brand = tint ?? colors.primary;

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.78),
          border: Border.all(color: brand.withValues(alpha: 0.30)),
          boxShadow: [
            BoxShadow(
              color: brand.withValues(alpha: 0.12),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    brand.withValues(alpha: 0.95),
                    brand.withValues(alpha: 0.65),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Icon(icon, size: 16, color: Colors.white),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
