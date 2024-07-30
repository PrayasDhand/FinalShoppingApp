import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/features/shop/screens/product_details.dart';
import 'package:pkart/utils/constants/colors.dart';
import 'package:pkart/utils/constants/image_strings.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';
import '../../../../features/shop/screens/widgets/brand_title_verified.dart';
import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../custom_shapes/containers/rounded_image.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetails()),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(16.0),
          color: dark ? Colors.black : TColors.white,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 150,
              width: 200,
              padding: const EdgeInsets.all(2),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Product Image
                  const TRoundedImage(
                    imageUrl: TImages.shoeProduct1,
                    applyImagerRadius: true,
                    fit: BoxFit.contain,
                    height: 150,
                    width: 200,
                  ),

                  Positioned(
                    top: 15,
                    left: 5,
                    child: TRoundedContainer(
                      radius: 8,
                      backgroundColor: Colors.amber.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        "25%",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: dark
                            ? Colors.black.withOpacity(0.9)
                            : TColors.white.withOpacity(0.9),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.heart,
                        ),
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Blue Nike Air Shoes",
                    style: Theme.of(context).textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const TBrandTitleWithVerifyIcon(
                    title: 'Nike',
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$35.5",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(16.0),
                    ),
                  ),
                  child: const SizedBox(
                    width: 32 * 1.2,
                    height: 32 * 1.2,
                    child: Icon(
                      Iconsax.add_copy,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




