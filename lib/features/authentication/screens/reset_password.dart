import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'login.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> Get.back(), icon: const Icon(CupertinoIcons.clear),),
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Image(
                image: const AssetImage(TImages.confirmedEmail),
                width: THelperFunctions.screenWidth(context) * 0.6,
              ),
              const SizedBox(
                height: 32,
              ),

              ///Title and Subtitle
              Text(
                "Password Reset Link Sent Successfully !",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),

              Text(
                """
Your Account Security is our Priority....We have successfully sent you a Password Reset Link on your mail, Please use that to safely change your password and keep your account protected  """,
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
                  onPressed: ()=>Get.to(()=> const LoginScreen()),
                  child: const Text("Continue"),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: (){},
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
