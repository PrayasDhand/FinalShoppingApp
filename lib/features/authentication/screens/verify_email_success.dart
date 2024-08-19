import 'package:flutter/material.dart';

import 'package:pkart/common/styles/spacing_styles.dart';
import 'package:pkart/data/repositories/authentication_repository.dart';


import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child:  Column(
            children: [
              ///image
              Image(
                image: const AssetImage(TImages.success),
                width: THelperFunctions.screenWidth(context) * 0.6,
              ),
              const SizedBox(
                height: 32,
              ),

              ///Title and Subtitle
              Text(
                "Your Account created Successfully !",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),

              Text(
                """
Welcome to your Ultimate Shopping Destination....Your Account is created Successfully, Unleash the joy of Seamless Online Shopping! """,
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
                  onPressed: ()=> AuthenticationRepository.instance.screenRedirect(),
                  child: const Text("Continue"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
