import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/features/personalization/screens/settings/settings.dart';
import 'package:pkart/features/shop/screens/store.dart';
import 'package:pkart/features/shop/screens/wishlist.dart';

import 'package:pkart/utils/helpers/helper_functions.dart';

import 'features/shop/screens/home.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
            controller.update(); // Ensure that the UI is updated
          },
          backgroundColor: darkMode ? Colors.black : Colors.white,
          indicatorColor: darkMode ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Shop'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'WishList'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(
            () => IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.screens,
        ),
      ),
    );
  }
}


class NavigationController extends GetxController {
  static NavigationController get to => Get.find();

  final RxInt selectedIndex = 0.obs;

  final List<Widget> screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];

  @override
  void onInit() {
    super.onInit();
    // Ensure that the controller is properly initialized
    update();
  }
}

