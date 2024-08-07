import'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../utils/constants/colors.dart';
import '../screens/verify_email.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
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
    );
  }
}
