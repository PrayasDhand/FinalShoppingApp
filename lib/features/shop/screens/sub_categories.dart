import 'package:flutter/material.dart';
import 'package:pkart/common/widgets/products/product_cards/product_card_horizontal.dart';

import 'package:pkart/utils/constants/image_strings.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_image.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Sports Items'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const TRoundedImage(
                width: double.infinity,
                imageUrl: TImages.promoBanner2,
                applyImagerRadius: true,
              ),
              const SizedBox(
                height: 32.0,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Sport Shoes",
                        style: Theme.of(context).textTheme.headlineSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(width: 16), // Adjusted spacing
                      TextButton(
                        iconAlignment: IconAlignment.end,
                        onPressed: () {},
                        child: const Text('View All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      itemCount: 4,
                        separatorBuilder: (context,index)=> const SizedBox(width: 16.0,),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            const TProductCardHorizontal()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
