import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/common/styles/section_headings.dart'; // Ensure the import path is correct
import 'package:pkart/common/widgets/appbar/appbar.dart';
import 'package:pkart/features/shop/screens/all_products.dart';
import 'package:pkart/features/shop/screens/cart.dart';
import 'package:pkart/features/shop/screens/promo_slider.dart';
import 'package:pkart/features/shop/screens/sub_categories.dart';
import 'package:pkart/utils/constants/image_strings.dart';
import 'package:pkart/utils/device/device_utility.dart';
import 'package:pkart/common/widgets/custom_shapes/containers/primary_container_header.dart';


import '../../../common/widgets/grids/custom_grid_view.dart';
import '../../../common/widgets/products/product_cards/product_card_vertical.dart'; // Import the custom grid view

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        Text(
                          "Prayas Dhand",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: Colors.white),
                        ),
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
                      )
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
                          const Icon(
                            Iconsax.search_normal_1,
                            color: Colors.grey,
                          ),
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
                        const SizedBox(height: 16.0,),
                        SizedBox(
                          height: 100, // Adjusted height
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: GestureDetector(
                                  onTap: () => Get.to(() => const SubCategoriesScreen()),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 56,
                                        height: 56,
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                        child: const Center(
                                          child: Image(
                                            image: AssetImage(TImages.brand1),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      SizedBox(
                                        width: 55,
                                        child: Text(
                                          'Shoes',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .apply(color: Colors.white),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
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
