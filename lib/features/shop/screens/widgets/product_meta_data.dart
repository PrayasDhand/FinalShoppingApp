import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pkart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:pkart/features/shop/screens/widgets/product_title_text.dart';
import 'package:pkart/utils/constants/colors.dart';
import 'package:pkart/utils/constants/enums.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price and Sale Price
        Row(
          children: [
            TRoundedContainer(
              radius: 5,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Text(' 25% ',style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black), textAlign: TextAlign.center,),
            ),
            const SizedBox(width: 16.0,),
            Text('\$250',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            const SizedBox(width: 16.0,),
            Text('\$175',style: Theme.of(context).textTheme.headlineMedium,)
          ],
        ),
        const SizedBox(height: 16 /1.5,),

        ///Title
        const TProductTitleText(title: 'Blue Nike Sports Shoes'),
        const SizedBox(height: 16 /1.5,),

        ///Stack Status
         Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(width: 16.0,),
            Text('In Stock',style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),

        const SizedBox(height: 16 /1.5,),

        ///Brand
         const Row(
          children: [
            Icon(Iconsax.bootsrap, size: 30 ,color: Colors.white),
            SizedBox(width: 16,),
            TBrandTitleWithVerifyIcon(title: 'Nike',brandTextSize: TextSizes.medium,),
          ],
        ),
      ],
    );
  }
}
