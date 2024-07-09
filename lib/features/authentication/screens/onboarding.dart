import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkart/features/authentication/controllers/onboarding_controller.dart';
import 'package:pkart/utils/constants/colors.dart';
import 'package:pkart/utils/constants/image_strings.dart';
import 'package:pkart/utils/constants/text_strings.dart';
import 'package:pkart/utils/device/device_utility.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingWidget(
                image: TImages.onboardingImage1,
                title: TTexts.onboardingTitle1,
                subTitle: TTexts.onboardingSubTitle1,
              ),
              OnboardingWidget(
                image: TImages.onboardingImage2,
                title: TTexts.onboardingTitle2,
                subTitle: TTexts.onboardingSubTitle2,
              ),
              OnboardingWidget(
                image: TImages.onboardingImage3,
                title: TTexts.onboardingTitle3,
                subTitle: TTexts.onboardingSubTitle3,
              ),
            ],
          ),
          const OnboardingSkip(),
          const OnboardingDotNavigation(),
          const OnboardingNextButton(),
        ],
      ),
    );
  }
}

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: 16,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: (index) => controller.dotNavigationClick(index),
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? TColors.light : TColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: 15,
      child: TextButton(
        onPressed: () => OnboardingController.instance.skipPage(),
        child: const Text('Skip'),
      ),
    );
  }
}

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,

  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Image(
            width: THelperFunctions.screenWidth(context) * 0.8,
            height: THelperFunctions.screenHeight(context) * 0.6,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: 16,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnboardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), backgroundColor: dark ? TColors.primaryColor : Colors.black,
        ),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}