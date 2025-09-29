import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/core/theme/app_colors.dart';
import 'package:learning_app/features/setting/views/widgets/legal_document_section.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Last Updated: March 15, 2025',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(height: 24),
            LegalDocumentSection(
              title: '1. Information We Collect',
              content:
                  'We collect information that you provide directly to us, including but not limited to your name, email address, and learning preferences when you register for an account.',
            ),
            LegalDocumentSection(
              title: '2. How We Use Your Information',
              content:
                  'We use the information we collect to provide, maintain and improve our services, to develop new ones, and to protect our users.',
            ),
            LegalDocumentSection(
              title: '3. Data Security',
              content:
                  'We implement appropriate security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction.',
            ),
            LegalDocumentSection(
              title: '4. Your Rights',
              content:
                  'You have the right to access, correct, or delete your personal information. You can manage these preferences in your account settings.',
            ),
          ],
        ),
      ),
    );
  }
}
