import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/core/theme/app_colors.dart';
import 'package:learning_app/features/setting/views/widgets/legal_document_section.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms & Conditions',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
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
              title: '1. Acceptance of Terms',
              content:
                  'By accessing and using Edulearn Pro, you agree to be bound by these Terms and Conditions and all applicable laws and regulations.',
            ),
            LegalDocumentSection(
              title: '2. User Accounts',
              content:
                  'You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.',
            ),
            LegalDocumentSection(
              title: '3. Course Content',
              content:
                  'All course content is protected by copyright and other intellectual property rights. You may not share, reproduce or distribute the content without explicit permission.',
            ),
            LegalDocumentSection(
              title: '4. Payment Terms',
              content:
                  'Course fees are non-refundable unless otherwise specified. We reserve the right to modify pricing at any time.',
            ),
          ],
        ),
      ),
    );
  }
}
