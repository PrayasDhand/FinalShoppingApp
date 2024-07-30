import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/common/widgets/custom_shapes/containers/rounded_container.dart';

import 'package:pkart/features/shop/screens/widgets/product_title_text.dart';
import 'package:pkart/utils/constants/image_strings.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';

import '../../../../features/shop/screens/widgets/brand_title_verified.dart';
import '../../../../utils/constants/colors.dart';
import '../../custom_shapes/containers/rounded_image.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: dark ? Colors.black : TColors.white,
      ),
      child: Row(
        children: [
          /// Thumbnail
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(2),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                /// Thumbnail Image
                const SizedBox(
                  width: 120,
                  height: 120,
                  child: TRoundedImage(
                    imageUrl: TImages.shoeProduct1,
                    applyImagerRadius: true,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 5,
                  child: TRoundedContainer(
                    radius: 8,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
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

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TProductTitleText(
                    title: 'Blue Nike Sports Sneakers',
                    smallSize: true,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8.0),
                  const TBrandTitleWithVerifyIcon(title: 'Nike'),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "\$35.5",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
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
          ),
        ],
      ),
    );
  }
}
