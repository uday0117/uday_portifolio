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
          const SizedBox(height: 8),
          Text(
            'Open to roles and freelance opportunities. Let us connect quickly.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: [
              SocialIconButton(
                icon: Icons.email_outlined,
                label: 'Email',
                tint: const Color(0xFF0F2A43),
                onTap: () => LaunchUtils.sendMail(email: AppConstants.email),
              ),
              SocialIconButton(
                icon: Icons.phone_in_talk_rounded,
                label: 'Call',
                tint: const Color(0xFF14746F),
                onTap: () =>
                    LaunchUtils.openUrl('tel:${AppConstants.phoneDial}'),
              ),
              SocialIconButton(
                icon: Icons.person_search_rounded,
                label: 'LinkedIn',
                tint: const Color(0xFF0A66C2),
                onTap: () => LaunchUtils.openUrl(AppConstants.linkedInUrl),
              ),
            ],
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 920;
              final supportPanel = Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primaryContainer
                              .withValues(alpha: 0.34),
                          Theme.of(
                            context,
                          ).colorScheme.surface.withValues(alpha: 0.85),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.support_agent_rounded,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Support Actions',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Use quick actions to contact me or explore all published apps on Play Store.',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 14),
                          SelectableText('Contact: ${AppConstants.email}'),
                          const SizedBox(height: 6),
                          SelectableText('Phone: ${AppConstants.phone}'),
                          const SizedBox(height: 6),
                          SelectableText(
                            'LinkedIn: ${AppConstants.linkedInUrl}',
                          ),
                          const SizedBox(height: 14),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              FilledButton.icon(
                                onPressed: () => LaunchUtils.sendMail(
                                  email: AppConstants.email,
                                  subject: 'Support request from portfolio',
                                ),
                                icon: const Icon(Icons.email_outlined),
                                label: const Text('Email Support'),
                              ),
                              OutlinedButton.icon(
                                onPressed: () => LaunchUtils.openUrl(
                                  'tel:${AppConstants.phoneDial}',
                                ),
                                icon: const Icon(Icons.call_outlined),
                                label: const Text('Call Now'),
                              ),
                              OutlinedButton.icon(
                                onPressed: () => LaunchUtils.openUrl(
                                  AppConstants.playStoreDeveloperUrl,
                                ),
                                icon: const Icon(Icons.shop_2_outlined),
                                label: const Text('More Apps'),
                              ),
                              OutlinedButton.icon(
                                onPressed: () => LaunchUtils.openUrl(
                                  AppConstants.linkedInUrl,
                                ),
                                icon: const Icon(
                                  Icons.business_center_outlined,
                                ),
                                label: const Text('LinkedIn Profile'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: const [
                              Chip(label: Text('Response: within 24h')),
                              Chip(label: Text('Remote / Onsite')),
                              Chip(label: Text('Bengaluru, India')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );

              final messagePanel = Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Send a quick message',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 14),
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
                          decoration: const InputDecoration(
                            labelText: 'Message',
                          ),
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
              );

              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 6, child: supportPanel),
                    const SizedBox(width: 20),
                    Expanded(flex: 5, child: messagePanel),
                  ],
                );
              }

              return Column(
                children: [
                  supportPanel,
                  const SizedBox(height: 20),
                  messagePanel,
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
