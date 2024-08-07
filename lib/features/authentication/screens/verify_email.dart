import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkart/features/authentication/screens/login.dart';
import 'package:pkart/features/authentication/screens/verify_email_success.dart';
import 'package:pkart/utils/constants/image_strings.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';

class VerifyEmailAddress extends StatelessWidget {
  const VerifyEmailAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              ///image
              Image(
                image: const AssetImage(TImages.verifyEmail),
                width: THelperFunctions.screenWidth(context) * 0.6,
              ),
              const SizedBox(
                height: 32,
              ),

              ///Title and Subtitle
              Text(
                "Verify your email address",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "prayasdhand13@gmail.com",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                """
Congratulations, Your Account Awaits!....Kindly verify your email address to start the journey of limitless items, goodies and shopping""",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32,
              ),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ()=>Get.to(()=> const SuccessScreen()),
                  child: const Text("Continue"),
                ),
              ),
              const SizedBox(height:16,),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Resend Email"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
