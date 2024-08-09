import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkart/bindings/general_bindings.dart';
// Import your OnboardingController
import 'package:pkart/utils/constants/colors.dart';
import 'package:pkart/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system, // Allows the system to choose between light and dark themes
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(backgroundColor: TColors.primaryColor,body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),),

    );
  }
}