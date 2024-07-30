import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/features/shop/screens/widgets/product_title_text.dart';

import '../../../../common/widgets/custom_shapes/containers/rounded_image.dart';
import '../../../../common/widgets/products/product_cards/circular_icons.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

import 'brand_title_verified.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key,  this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(

      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: 32.0,
      ),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          Row(
            children: [
              TRoundedImage(
                imageUrl: TImages.shoeProduct1,
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(8.0),
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? Colors.white
                    : Colors.grey,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TBrandTitleWithVerifyIcon(title: 'Nike'),
                    const Flexible(
                        child: TProductTitleText(
                          title: 'Blue Sports Sneakers',
                          maxLines: 1,
                        )),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Color: ',
                              style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(
                              text: 'Blue ',
                              style: Theme.of(context).textTheme.bodyLarge),
                          TextSpan(
                              text: 'Size: ',
                              style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(
                              text: 'UK 08 ',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          if (showAddRemoveButtons)  const SizedBox(
            height: 16.0,
          ),
          if (showAddRemoveButtons)  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 70,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TCircularIcon(
                        icon: Iconsax.minus_copy,
                        width: 32,
                        height: 32,
                        size: 15,
                        color: THelperFunctions.isDarkMode(context)
                            ? Colors.black
                            : Colors.white,
                        backgroundColor:
                        THelperFunctions.isDarkMode(context)
                            ? Colors.white
                            : Colors.black,
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        '2',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      TCircularIcon(
                        icon: Iconsax.add_copy,
                        width: 32,
                        height: 32,
                        size: 15,
                        color: THelperFunctions.isDarkMode(context)
                            ? Colors.black
                            : Colors.white,
                        backgroundColor: TColors.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                '\$175',
                style: Theme.of(context).textTheme.headlineSmall,
              )
            ],
          )
        ],
      ),
    );
  }
}
