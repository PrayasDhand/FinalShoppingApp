import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/features/shop/screens/product_reviews.dart';
import 'package:pkart/features/shop/screens/widgets/product_attributes.dart';
import 'package:pkart/features/shop/screens/widgets/product_bottom_add_to_cart_widget.dart';
import 'package:pkart/features/shop/screens/widgets/product_detail_image_slider.dart';
import 'package:pkart/features/shop/screens/widgets/product_meta_data.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Product Image Slider
            TProductImageSlider(dark: dark),

            ///Details
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
              child: Column(
                children: [
                  ///rating and share
                  const TRatingAndShare(),

                  ///Price Title stack and Brand
                  const TProductMetaData(),
                  const SizedBox(
                    height: 16,
                  ),

                  ///Attributes
                  const TProductAttributes(),
                  const SizedBox(
                    height: 32.0,
                  ),

                  ///checkout bUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),

                  ///Description
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Description",
                        style: Theme.of(context).textTheme.headlineSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const ReadMoreText(
                    'This is Product Description for our Nike Blue Sneakers coming from the brand of Luxury our very own Nike...This product is the epitome of style, comfort and luxury all together. I can go on and on about the qualities of the product',
                  trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show More',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                  ),

                  ///Reviews
                  const Divider(),
                  const SizedBox(height: 16.0,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Reviews (199)",
                            style: Theme.of(context).textTheme.headlineSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      IconButton(onPressed: ()=> Get.to(()=> const TProductReviews()), icon: const Icon(Iconsax.arrow_right_1_copy),),

                    ],
                  )

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
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            size: 24.0,
          ),
        )
      ],
    );
  }
}
