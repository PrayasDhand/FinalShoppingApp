import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/common/widgets/appbar/appbar.dart';
import 'package:pkart/features/shop/screens/store.dart';
import 'package:pkart/common/widgets/products/product_cards/product_card_vertical.dart';


import '../../../common/widgets/grids/custom_grid_view.dart'; // Import the custom grid view

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Wishlist",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () => Get.off(() => const StoreScreen()),
                icon: const Icon(
                  Iconsax.add_copy,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TCustomGridView(
                itemCount: 4,
                itemBuilder: (_, index) => const TProductCardVertical(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
