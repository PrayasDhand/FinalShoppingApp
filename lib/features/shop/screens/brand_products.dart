import 'package:flutter/material.dart';
import 'package:pkart/common/widgets/appbar/appbar.dart';
import 'package:pkart/features/shop/screens/widgets/brand_title_verified.dart';
import 'package:pkart/features/shop/screens/widgets/sortable_products.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(
        title: Text('Nike'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: TRoundedContainer(
                  padding: const EdgeInsets.all(2),
                  showBorder: true,
                  backgroundColor: Colors.transparent,
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: THelperFunctions.isDarkMode(context)
                              ? Colors.black
                              : TColors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Image(
                          image: AssetImage(TImages.brand1),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            const TBrandTitleWithVerifyIcon(
                              title: 'Nike',
                              brandTextSize: TextSizes.large,
                            ),
                            Text(
                              "256 products",
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32.0,),
              const TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
