import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/common/widgets/appbar/appbar.dart';
import 'package:pkart/features/authentication/controllers/forget_password_controller.dart';
import 'package:pkart/utils/validators/validations.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/helper_functions.dart';


class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage(TImages.forgetPassword),
              width: THelperFunctions.screenWidth(context) * 0.6,
            ),
            const SizedBox(
              height: 32,
            ),

            ///Headings
            Text(
              "Forgot Password",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
                style: Theme.of(context).textTheme.labelMedium,
                "Don't worry ! Sometimes people forget their credentials....Kindly provide us with your registered email and we will send you link to reset your password securely"),
            const SizedBox(
              height: 16 * 2,
            ),

            ///Text Field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            ///Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=> controller.sendPasswordResetEmail(),
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


