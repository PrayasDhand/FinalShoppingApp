import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkart/features/shop/controllers/home_controller.dart';

import '../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_image.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';


class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: const [
            TRoundedImage(
              imageUrl: TImages.promoBanner1,
            ),
            TRoundedImage(
              imageUrl: TImages.promoBanner2,
            ),
            TRoundedImage(
              imageUrl: TImages.promoBanner3,
            ),
          ],
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 3; i++)
                   TCircularContainer(
                    height: 4,
                    width: 20,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor:controller.carousalCurrentIndex.value == i ? TColors.primaryColor : Colors.grey ,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
