import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/common/widgets/appbar/appbar.dart';
import 'package:pkart/common/widgets/custom_shapes/containers/primary_container_header.dart';
import 'package:pkart/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:pkart/features/personalization/screens/address/address.dart';
import 'package:pkart/utils/constants/colors.dart';

import '../../../../utils/constants/image_strings.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),

                  ///user profile card
                  ListTile(
                    leading: Container(
                      width: 56,
                      height: 56,
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
                    title: Text(
                      "Prayas Dhand",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: TColors.white),
                    ),
                    subtitle: Text(
                      "prayasdhand13@gmail.com",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: TColors.white),
                    ),
                    trailing: IconButton(
                      onPressed: ()=> Get.to(()=> const ProfileScreen()),
                      icon: const Icon(
                        Iconsax.edit_2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Account Settings",
                        style: Theme.of(context).textTheme.headlineSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.safe_home_copy,
                    title: 'My Addresses',
                    subTitle: 'Set Shopping Delivery Address',
                    onTap: () => Get.to(()=> const UserAddressScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.shopping_cart_copy,
                    title: 'My Cart',
                    subTitle: 'Add or remove products and move to checkout',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick_copy,
                    title: 'My Orders',
                    subTitle: 'In-Progress and Complete Orders',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bank_copy,
                    title: 'Bank Account',
                    subTitle: 'Withdraw Balance to Registered Bank Account',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.discount_shape_copy,
                    title: 'My Coupons',
                    subTitle: 'Your All Discount Coupons',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.notification_copy,
                    title: 'Notifications',
                    subTitle: 'Set any kind of Notification Message',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_card_copy,
                    title: 'Account Privacy',
                    subTitle: 'Manage Data Usage and Connected Accounts',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Text(
                        "App Settings",
                        style: Theme.of(context).textTheme.headlineSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.document_upload_copy,
                    title: 'Load Data',
                    subTitle: 'Upload Data To Cloud Firebase',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.location_copy,
                    title: 'Geo-Location',
                    subTitle: 'Get Recommendations based on your location',
                    onTap: () {},
                    trailing: Switch(value: true, onChanged: (value){},),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user_copy,
                    title: 'Safe Mode',
                    subTitle: 'Products search safe for all age users',
                    onTap: () {},
                    trailing: Switch(value: true, onChanged: (value){},),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.image_copy,
                    title: 'HD Image Quality',
                    subTitle: 'set image quality to be seen',
                    onTap: () {},
                    trailing: Switch(value: true, onChanged: (value){},),
                  ),

                ],
              ),
            ),
          ],

          ///body
        ),
      ),
    );
  }
}
