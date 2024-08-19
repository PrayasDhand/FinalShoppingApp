import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkart/data/repositories/authentication_repository.dart';
import 'package:pkart/features/authentication/controllers/verify_email_controller.dart';


import 'package:pkart/utils/constants/image_strings.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';

class VerifyEmailAddress extends StatelessWidget {
  const VerifyEmailAddress({super.key, this.email});

  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put( VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
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
                email ?? '',
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
                  onPressed: ()=> controller.checkEmailVerificationStatus(),
                  child: const Text("Continue"),
                ),
              ),
              const SizedBox(height:16,),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: ()=> controller.sendEmailVerification(),
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
