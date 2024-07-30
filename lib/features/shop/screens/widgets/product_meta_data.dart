import 'package:flutter/material.dart';

import 'package:pkart/common/widgets/custom_shapes/containers/rounded_container.dart';

import 'package:pkart/features/shop/screens/widgets/product_title_text.dart';

import 'package:pkart/utils/constants/enums.dart';
import 'package:pkart/utils/constants/image_strings.dart';

import 'brand_title_verified.dart';


class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price and Sale Price
        Row(
          children: [
            TRoundedContainer(
              radius: 5,
              backgroundColor: Colors.amber,
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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
          Row(
          children: [
            Image.asset(TImages.brand1,height: 30,width: 30),
            const SizedBox(width: 16,),
            const TBrandTitleWithVerifyIcon(title: 'Nike',brandTextSize: TextSizes.medium,),
          ],
        ),
      ],
    );
  }
}
