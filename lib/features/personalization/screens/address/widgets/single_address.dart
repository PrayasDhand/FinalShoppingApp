import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pkart/utils/constants/colors.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      showBorder: true,
      backgroundColor: selectedAddress
          ? TColors.primaryColor.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? Colors.blueGrey
              : Colors.grey,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle_copy : null,
              color: selectedAddress
                  ? dark
                      ? TColors.light
                      : TColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Prayas Dhand',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 5,),
              const Text('(+123) 898 7890',maxLines: 1,overflow: TextOverflow.ellipsis,),
              const SizedBox(height: 5,),
              const Text(
                '8285 Salvatore Mansion, Mystic Falls, Virginia, USA',
               softWrap: true,
              ),
              const SizedBox(height: 5,),
            ],
          )
        ],
      ),
    );
  }
}
