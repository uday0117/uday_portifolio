import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {
  const SkillChip({required this.skill, super.key});

  final String skill;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(skill),
      side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
