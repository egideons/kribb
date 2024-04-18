import 'package:flutter/material.dart';

import '../../../../src/controllers/onboarding_page_controller.dart';
import '../content/onboarding_page_content.dart';

class OnboardingAndroidScaffold extends StatelessWidget {
  const OnboardingAndroidScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    final controller = OnboardingController.instance;

    return Scaffold(
      body: SafeArea(
        child: onboardingPageContent(
          media: media,
          colorScheme: colorScheme,
          controller: controller,
        ),
      ),
    );
  }
}