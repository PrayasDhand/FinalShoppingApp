import 'package:flutter/material.dart';
import 'package:pkart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pkart/utils/constants/colors.dart';
import 'package:pkart/utils/constants/image_strings.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Column(
      children: [
        Row(
          children: [
            Text(
              "Payment Method",
              style: Theme.of(context).textTheme.headlineSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(width: 16), // Adjusted spacing
            TextButton(
              iconAlignment: IconAlignment.end,
              onPressed: () {},
              child: const Text('Change'),
            ),
          ],
        ),
        const SizedBox(height: 8.0,),

        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColors.light : Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: const Image(image: AssetImage(TImages.paymentMethod3),fit: BoxFit.contain,),
            ),
            const SizedBox(width: 10.0,),
            Text('PayPal',style: Theme.of(context).textTheme.bodyLarge,),
          ],
        ),
      ],
    );
  }
}
