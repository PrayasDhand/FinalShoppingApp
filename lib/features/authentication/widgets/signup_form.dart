import 'package:flutter/material.dart';

import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/features/authentication/controllers/signup_controller.dart';
import 'package:pkart/utils/validators/validations.dart';
import '../../../utils/constants/colors.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance; // Get the instance of SignupController
    return Form(
      key: controller.signupFormKey, // Use the signupFormKey from the controller
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => TValidator.validateFirstName(value),
                  decoration: const InputDecoration(
                      labelText: "First Name",
                      floatingLabelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => TValidator.validateLastName(value),
                  decoration: const InputDecoration(
                      labelText: "Last Name",
                      floatingLabelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: controller.userName,
            validator: (value) => TValidator.validateEmptyText('Username', value),
            decoration: const InputDecoration(
              labelText: "Username",
              floatingLabelStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: "Email",
              floatingLabelStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              labelText: "Phone No.",
              floatingLabelStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: controller.password,
            validator: (value) => TValidator.validatePassword(value),
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
              floatingLabelStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              SizedBox(height: 24, width: 24, child: Checkbox(value: true, onChanged: (value) {})),
              const SizedBox(width: 12.0),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'I agree to ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? Colors.white : TColors.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' and ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                      text: 'Terms of Use',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? Colors.white : TColors.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text("Create Account"),
            ),
          ),
        ],
      ),
    );
  }
}