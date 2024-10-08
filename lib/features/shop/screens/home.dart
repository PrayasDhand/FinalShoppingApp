import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/common/styles/section_headings.dart';
import 'package:pkart/common/styles/shimmer.dart';
import 'package:pkart/common/widgets/appbar/appbar.dart';
import 'package:pkart/features/personalization/controllers/user_controller.dart';
import 'package:pkart/features/shop/screens/all_products.dart';
import 'package:pkart/features/shop/screens/cart.dart';
import 'package:pkart/features/shop/screens/promo_slider.dart';
import 'package:pkart/features/shop/screens/sub_categories.dart';
import 'package:pkart/features/shop/screens/widgets/home_categories.dart';
import 'package:pkart/utils/device/device_utility.dart';
import 'package:pkart/common/widgets/custom_shapes/containers/primary_container_header.dart';
import '../../../common/widgets/grids/custom_grid_view.dart';
import '../../../common/widgets/products/product_cards/product_card_vertical.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TAppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Day For Shopping!",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(color: Colors.white),
                        ),
                        Obx(() {
                          if (controller.profileLoading.value) {
                            return const TShimmerEffect(width: 80, height: 15);
                          } else {
                            return Text(
                              controller.user.value.fullName,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .apply(color: Colors.white),
                            );
                          }
                        }),
                      ],
                    ),
                    actions: [
                      Stack(
                        children: [
                          IconButton(
                            onPressed: () => Get.to(() => const CartScreen()),
                            icon: const Icon(
                              Iconsax.shopping_bag,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: Text(
                                  "2",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      width: TDeviceUtils.getScreenWidth(context),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        children: [
                          const Icon(Iconsax.search_normal_1, color: Colors.grey),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: Text(
                              'Search in Store',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                          title: 'Popular Categories',
                          onViewAll: () => Get.to(() => const SubCategoriesScreen()),
                        ),
                        const SizedBox(height: 16.0),
                        const THomeCategories(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32.0),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  const TPromoSlider(),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                          title: 'Popular Products',
                          onViewAll: () => Get.to(() => const AllProducts()),
                          showViewAll: true,
                        ),
                      ],
                    ),
                  ),
                  TCustomGridView(
                    itemCount: 6,
                    itemBuilder: (_, index) => const TProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



