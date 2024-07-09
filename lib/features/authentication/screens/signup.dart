import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/features/authentication/screens/verify_email.dart';
import 'package:pkart/utils/constants/colors.dart';
import 'package:get/get.dart';

import 'package:pkart/utils/helpers/helper_functions.dart';
import 'package:pkart/utils/constants/image_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's create your account",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 32,
              ),
              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(
                                labelText: "First Name",
                                floatingLabelStyle:
                                    TextStyle(color: Colors.white),
                                prefixIcon: Icon(Iconsax.user)),
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(
                                labelText: "Last Name",
                                floatingLabelStyle:
                                    TextStyle(color: Colors.white),
                                prefixIcon: Icon(Iconsax.user)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: "Username",
                        floatingLabelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Iconsax.user_edit),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        floatingLabelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Iconsax.direct_right),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: "Phone No.",
                        floatingLabelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Iconsax.call),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        floatingLabelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: Icon(Iconsax.eye_slash),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        SizedBox(
                            height: 24,
                            width: 24,
                            child:
                                Checkbox(value: true, onChanged: (value) {})),
                        const SizedBox(
                          width: 12.0,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: 'I agree to ',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                      color: dark
                                          ? Colors.white
                                          : TColors.primaryColor,
                                      decoration: TextDecoration.underline,
                                      decorationColor: dark
                                          ? Colors.white
                                          : TColors.primaryColor,
                                    ),
                              ),
                              TextSpan(
                                  text: ' and ',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                text: 'Terms of Use',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                      color: dark
                                          ? Colors.white
                                          : TColors.primaryColor,
                                      decoration: TextDecoration.underline,
                                      decorationColor: dark
                                          ? Colors.white
                                          : TColors.primaryColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            Get.to(() => const VerifyEmailAddress()),
                        child: const Text("Create Account"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Divider(
                    color: dark ? Colors.blueGrey : Colors.grey,
                    thickness: 1,
                    indent: 60,
                    endIndent: 5,
                  )),
                  Text(
                    "Or Sign in With",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Flexible(
                      child: Divider(
                    color: dark ? Colors.blueGrey : Colors.grey,
                    thickness: 1,
                    indent: 5,
                    endIndent: 60,
                  )),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                          width: 25,
                          height: 25,
                          image: AssetImage(TImages.facebookLogo)),
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                          width: 25,
                          height: 25,
                          image: AssetImage(TImages.googleLogo)),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                          width: 25,
                          height: 25,
                          image: AssetImage(TImages.githubLogo)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
