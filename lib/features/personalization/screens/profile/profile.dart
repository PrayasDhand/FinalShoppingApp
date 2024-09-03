import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/features/personalization/controllers/user_controller.dart';
import 'package:pkart/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:pkart/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:pkart/utils/constants/image_strings.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';

import '../../../../common/styles/shimmer.dart';
import '../../../../common/widgets/appbar/appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
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
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : TImages.user1;
                      return controller.imageUploading.value  ? const TShimmerEffect(width: 80, height: 80,radius: 80,) :TCircularImage(
                        image: image,
                        height: 80,
                        width: 80,
                        isNetworkImage: networkImage.isNotEmpty,
                      );
                    }),
                    TextButton(
                      onPressed: ()=> controller.uploadUserProfilePicture(),
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
                onPressed: () => Get.to(const ChangeNameScreen()),
                title: 'Name',
                value: controller.user.value.fullName,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'User Name',
                value: controller.user.value.username,
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
                value: controller.user.value.id,
                icon: Iconsax.copy_copy,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'E-Mail',
                value: controller.user.value.email,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Contact No.',
                value: controller.user.value.phoneNumber,
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
                  onPressed: () {},
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = 8,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? Colors.black
                : Colors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  color: overlayColor,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const TShimmerEffect(
                    width: 55,
                    height: 55,
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error_outline),
                )
              : Image(
                  color: overlayColor,
                  image: isNetworkImage
                      ? NetworkImage(image)
                      : AssetImage(image) as ImageProvider,
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
