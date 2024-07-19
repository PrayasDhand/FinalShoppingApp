import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/features/personalization/screens/profile/widgets/profile_menu.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/image_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Center(
                        child: Image(
                          image: AssetImage(TImages.user1),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Change Profile Picture"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Divider(),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Text(
                    "Profile Details",
                    style: Theme.of(context).textTheme.headlineSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Name',
                value: 'Prayas Dhand',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'User Name',
                value: 'PrayasD13',
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Divider(),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Text(
                    "Personal Information",
                    style: Theme.of(context).textTheme.headlineSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'User Id',
                value: '13062001',
                icon: Iconsax.copy_copy,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'E-Mail',
                value: 'prayasdhand13@gmail.com',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Contact No.',
                value: '+91-8572-859-197',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Gender',
                value: 'Male',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Date of Birth',
                value: '13 June 2001',
              ),
              const Divider(),
              const SizedBox(
                height: 16.0,
              ),
              
              Center(
                child: TextButton(
                  onPressed: (){},
                  child: const Text('Close Account', style: TextStyle(color: Colors.red),),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
