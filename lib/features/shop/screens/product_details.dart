import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/features/shop/screens/widgets/product_detail_image_slider.dart';
import 'package:pkart/features/shop/screens/widgets/product_meta_data.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Product Image Slider
            TProductImageSlider(dark: dark),

            ///Details
            const Padding(
              padding: EdgeInsets.only(right: 24, left: 24, bottom: 24),
              child: Column(
                children: [
                  ///rating and share
                  TRatingAndShare(),

                  ///Price Title stack and Brand
                  TProductMetaData(),
                  ///Attributes

                  ///checkout bUTTON
                  ///Description
                  ///Reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Iconsax.star,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(
              width: 8,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '5.0',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const TextSpan(text: '(199)'),
                ],
              ),
            ),
          ],
        ),
        IconButton(onPressed: (){}, icon: const Icon(Icons.share,size: 24.0,),)
      ],
    );
  }
}
