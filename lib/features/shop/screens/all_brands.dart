import 'package:flutter/material.dart';
import 'package:pkart/common/widgets/appbar/appbar.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(
        title: Text('Brands Available'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Brands",
                    style: Theme.of(context).textTheme.headlineSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                ],
              ),
               const SizedBox(height: 16.0),

              ///brands
              GridView.builder(
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent: 80,
                  ),
                  itemBuilder: (_, index) => GestureDetector(
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
                              color: THelperFunctions.isDarkMode(
                                  context)
                                  ? Colors.black
                                  : TColors.white,
                              borderRadius:
                              BorderRadius.circular(100),
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
                  )),

            ],
          ),
        ),
      ),
    );
  }
}
