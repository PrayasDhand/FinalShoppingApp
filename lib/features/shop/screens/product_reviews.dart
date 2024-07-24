import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/common/widgets/appbar/appbar.dart';
import 'package:pkart/features/shop/screens/widgets/user_review_card.dart';
import 'package:pkart/utils/constants/colors.dart';
import 'package:pkart/utils/device/device_utility.dart';

class TProductReviews extends StatelessWidget {
  const TProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and Reviews are verified and are from the people who use the same type of device that you use.We dont create fake ratings and reviews...'),
              const SizedBox(
                height: 16.0,
              ),

              ///Overall Product Ratings
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      '4.8',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  const Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        TRatingProgressIndicator(
                          text: '5',
                          value: 1.0,
                        ),
                        TRatingProgressIndicator(
                          text: '4',
                          value: 0.8,
                        ),
                        TRatingProgressIndicator(
                          text: '3',
                          value: 0.6,
                        ),
                        TRatingProgressIndicator(
                          text: '2',
                          value: 0.4,
                        ),
                        TRatingProgressIndicator(
                          text: '1',
                          value: 0.2,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              RatingBarIndicator(
                rating: 3.5,
                itemSize: 20,
                unratedColor: Colors.grey,
                itemBuilder: (_, __) => const Icon(
                  Iconsax.star_copy,
                  color: TColors.primaryColor,
                ),
              ),
              Text('12,611',style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: 32.0,),

              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),

            ],
          ),
        ),
      ),
    );
  }
}

class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: TDeviceUtils.getScreenWidth(context) * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation(TColors.primaryColor),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
      ],
    );
  }
}
