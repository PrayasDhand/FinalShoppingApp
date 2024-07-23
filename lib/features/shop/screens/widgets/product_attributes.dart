import 'package:flutter/material.dart';
import 'package:pkart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pkart/features/shop/screens/widgets/product_title_text.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/chips/choice_chips.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(

      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(16.0),
          backgroundColor: dark ? Colors.blueGrey : Colors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        "Variations",
                        style: Theme.of(context).textTheme.headlineSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Text(
                            '\$20',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const TProductTitleText(
                title:
                    'This is gonna be the description of the choosen product and it can go upto 4 lines',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Column(

          children: [
            Row(
              children: [
                Text(
                  "Colors",
                  style: Theme.of(context).textTheme.headlineSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Wrap(
              spacing: 10,
              children: [
                TChoiceChip(text: 'Green',selected: true,onSelected: (value){}),
                TChoiceChip(text: 'Yellow',selected: false,onSelected: (value){}),
                TChoiceChip(text: 'Blue',selected: true,onSelected: (value){}),TChoiceChip(text: 'Green',selected: true,onSelected: (value){}),
                TChoiceChip(text: 'Teal',selected: false,onSelected: (value){}),
                TChoiceChip(text: 'Purple',selected: true,onSelected: (value){}),
              ],
            )


          ],
        ),
        const SizedBox(height: 16.0,),
        Column(

          children: [
            Row(
              children: [
                Text(
                  "Sizes",
                  style: Theme.of(context).textTheme.headlineSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
             Wrap(
               spacing: 8,
               children: [
                 TChoiceChip(text: 'EU 34',selected: true,onSelected: (value){}),
                 TChoiceChip(text: 'EU 36',selected: false,onSelected: (value){}),
                 TChoiceChip(text: 'EU 38',selected: true,onSelected: (value){}),TChoiceChip(text: 'EU 34',selected: true,onSelected: (value){}),
                 TChoiceChip(text: 'EU 40',selected: false,onSelected: (value){}),
                 TChoiceChip(text: 'EU 42',selected: true,onSelected: (value){}),TChoiceChip(text: 'EU 34',selected: true,onSelected: (value){}),
                 TChoiceChip(text: 'US 07',selected: false,onSelected: (value){}),
                 TChoiceChip(text: 'US 10',selected: true,onSelected: (value){}),
               ],
             )


          ],
        )
      ],
    );
  }
}


