import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/common/widgets/products/product_cards/circular_icons.dart';
import 'package:pkart/utils/constants/colors.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
          color: dark ? Colors.blueGrey : TColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const TCircularIcon(
                icon: Iconsax.minus_copy,
                backgroundColor: Colors.black,
                width: 40,
                height: 40,
                color: Colors.white,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                width: 16.0,
              ),
              const TCircularIcon(
                icon: Iconsax.add_copy,
                backgroundColor: Colors.black,
                width: 40,
                height: 40,
                color: Colors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(12),
              backgroundColor: Colors.black,
              side: const BorderSide(color: Colors.black),
            ),
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
