import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';
import '../core/utils/launch_utils.dart';
import '../widgets/section_container.dart';
import '../widgets/social_icon_button.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final body =
        'Name: ${_nameController.text}\n'
        'Email: ${_emailController.text}\n\n'
        '${_messageController.text}';

    await LaunchUtils.sendMail(
      email: AppConstants.email,
      subject: 'Portfolio Contact from ${_nameController.text}',
      body: body,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: [
              SocialIconButton(
                icon: Icons.email_outlined,
                label: 'Email',
                onTap: () => LaunchUtils.sendMail(email: AppConstants.email),
              ),
              SocialIconButton(
                icon: Icons.code,
                label: 'GitHub',
                onTap: () => LaunchUtils.openUrl(AppConstants.githubUrl),
              ),
              SocialIconButton(
                icon: Icons.business_center_outlined,
                label: 'LinkedIn',
                onTap: () => LaunchUtils.openUrl(AppConstants.linkedInUrl),
              ),
              SocialIconButton(
                icon: Icons.play_circle_outline,
                label: 'YouTube',
                onTap: () => LaunchUtils.openUrl(AppConstants.youtubeUrl),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (value) =>
                          value == null || value.trim().isEmpty
                          ? 'Enter your name'
                          : null,
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _messageController,
                      maxLines: 5,
                      decoration: const InputDecoration(labelText: 'Message'),
                      validator: (value) =>
                          value == null || value.trim().isEmpty
                          ? 'Enter your message'
                          : null,
                    ),
                    const SizedBox(height: 18),
                    FilledButton.icon(
                      onPressed: _submit,
                      icon: const Icon(Icons.send_rounded),
                      label: const Text('Send Message'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
