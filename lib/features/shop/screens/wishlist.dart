import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/common/widgets/appbar/appbar.dart';

import 'package:pkart/features/shop/screens/store.dart';

import '../../../common/widgets/products/product_cards/product_card_vertical.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(
        title: Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium,),

        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: ()=> Get.off(()=> const StoreScreen()),
                icon: const Icon(
                  Iconsax.add_copy,
                  color: Colors.white,
                ),
              ),

            ],
          )
        ],

      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GridView.builder(
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 16,crossAxisSpacing: 16,mainAxisExtent: 280,),
                itemBuilder: (_,index)=> const TProductCardVertical(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
