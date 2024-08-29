import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/common/widgets/appbar/appbar.dart';
import 'package:pkart/features/personalization/controllers/update_name_controller.dart';
import 'package:pkart/utils/validators/validations.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());

    // Create TextEditingControllers once and reuse them
    final firstNameController = TextEditingController(text: controller.firstName.value);
    final lastNameController = TextEditingController(text: controller.lastName.value);

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(
              'Use your real name for easy verification. This name will appear on several pages...',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 32.0),

            // TextField and Buttons
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: firstNameController,
                    onChanged: (value) => controller.firstName.value = value,
                    validator: (value) => TValidator.validateFirstName(value),
                    decoration: const InputDecoration(
                      labelText: "First Name",
                      floatingLabelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: lastNameController,
                    onChanged: (value) => controller.lastName.value = value,
                    validator: (value) => TValidator.validateLastName(value),
                    decoration: const InputDecoration(
                      labelText: "Last Name",
                      floatingLabelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Update the user's name
                  controller.updateUserName();
                  // Optionally, you can pop the screen after saving
                  Get.back();
                },
                child: const Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}