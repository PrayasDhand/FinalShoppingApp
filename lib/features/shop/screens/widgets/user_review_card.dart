import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pkart/utils/constants/image_strings.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/colors.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImages.user1),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Text(
                  'Prayas Dhand',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        Row(
          children: [
            RatingBarIndicator(
              rating: 4,
              itemSize: 20,
              unratedColor: Colors.grey,
              itemBuilder: (_, __) => const Icon(
                Iconsax.star_copy,
                color: TColors.primaryColor,
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              '10 Nov, 2023',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        const ReadMoreText(
          'The User Interdace of the app is quite intutive and everything is easily accessible..I was able to navigate and make purcahes seamlessly, Great Job done by the team of PKart..',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primaryColor),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primaryColor),
        ),
        const SizedBox(
          height: 16.0,
        ),

        ///company review
        TRoundedContainer(
          backgroundColor: dark ? Colors.blueGrey : Colors.grey,
          child:  Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("P's Store",style: Theme.of(context).textTheme.bodyLarge,),
                    Text("11 Nov, 2023" ,style: Theme.of(context).textTheme.bodyMedium,),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const ReadMoreText(
                      'The User Interdace of the app is quite intutive and everything is easily accessible..I was able to navigate and make purcahes seamlessly, Great Job done by the team of PKart..',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimExpandedText: ' show less',
                      trimCollapsedText: ' show more',
                      moreStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: TColors.primaryColor),
                      lessStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: TColors.primaryColor),
                    ),


                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 32.0),
      ],
    );
  }
}
