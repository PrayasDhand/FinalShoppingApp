import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkart/features/authentication/controllers/onboarding_controller.dart'; // Import your OnboardingController
import 'package:pkart/features/authentication/screens/onboarding.dart';
import 'package:pkart/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system, // Allows the system to choose between light and dark themes
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnboardingScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(OnboardingController()); // Initialize your OnboardingController
      }),
    );
  }
}