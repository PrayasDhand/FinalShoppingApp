import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/common/styles/spacing_styles.dart';
import 'package:pkart/features/authentication/screens/forgot_password.dart';
import 'package:pkart/features/authentication/screens/signup.dart';
import 'package:pkart/navigation_menu.dart';

import 'package:pkart/utils/constants/image_strings.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 200,
                    image: AssetImage(
                        dark ? TImages.lightAppLogo : TImages.darkAppLogo),
                  ),
                  Text("Login",
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(
                    height: 0.8,
                  ),
                  Text("Kindly Please Login to your account!",
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.direct_right),
                            labelStyle: TextStyle(color: Colors.white),
                            floatingLabelStyle: TextStyle(color: Colors.white),
                            labelText: 'Email'),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          floatingLabelStyle: TextStyle(color: Colors.white),
                          suffixIcon: Icon(Iconsax.eye_slash),
                        ),
                      ),
                      const SizedBox(
                        height: 16 / 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ///remember me
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (value) {}),
                              const Text("Remember Me"),
                            ],
                          ),
                          //forget password
                          TextButton(
                            onPressed: ()=> Get.to(()=> const ForgotPassword()),
                            child: const Text("Forget Password?"),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const NavigationMenu(),
                              ),
                            );
                          },
                          child: const Text("Sign In!"),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () =>
                                  Get.to(() => const SignupScreen()),
                              child: const Text("Create Account"))),
                    ],
                  ),
                ),
              ),
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
