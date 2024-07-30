import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../common/widgets/grids/custom_grid_view.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration:
          const InputDecoration(prefixIcon: Icon(Iconsax.sort_copy)),
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) => DropdownMenuItem(value: option,child: Text(option)))
              .toList(),
          onChanged: (value) {},
        ),
        const SizedBox(height: 32.0,),
        TCustomGridView(
          itemCount: 8,
          itemBuilder: (_, index) => const TProductCardVertical(),
        ),
      ],
    );
  }
}