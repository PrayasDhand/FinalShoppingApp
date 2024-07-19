import 'package:flutter/material.dart';

import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pkart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pkart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:pkart/utils/constants/colors.dart';
import 'package:pkart/utils/constants/enums.dart';
import 'package:pkart/utils/constants/image_strings.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/appbar/tabbar.dart';
import '../../../utils/device/device_utility.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.shopping_bag,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        "2",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? Colors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.zero,
                        child: Container(
                          width: TDeviceUtils.getScreenWidth(context),
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Iconsax.search_normal_1,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                child: Text(
                                  'Search in Store',
                                  style: Theme.of(context).textTheme.bodySmall!,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),

                      ///SectionHeading
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Featured Brands",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
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
                          ],
                        ),
                      ),
                      GridView.builder(
                          itemCount: 4,
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
                                  padding: const EdgeInsets.all(10),
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
                bottom: const TTabBar(
                  tabs: [
                    Tab(
                      child: Text("Sports"),
                    ),
                    Tab(
                      child: Text("Furniture"),
                    ),
                    Tab(
                      child: Text("Electronics"),
                    ),
                    Tab(
                      child: Text("Clothes"),
                    ),
                    Tab(
                      child: Text("Cosmetics"),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),


            ],
          ),
        ),
      ),
    );
  }
}

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      children: [Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ///brands
            const TBrandShowcase(
              images: [
                TImages.facebookLogo,
                TImages.brand1,
                TImages.shoeProduct1
              ],
            ),
            const SizedBox(height: 16,),

            Row(
              children: [
                Text(
                  "You Might Like",
                  style:
                  Theme.of(context).textTheme.headlineSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                 const SizedBox(width: 16), // Adjusted spacing
                TextButton(
                  iconAlignment: IconAlignment.end,
                  onPressed: () {},
                  child:  const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 16,),



            ///products
            GridView.builder(
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 16,crossAxisSpacing: 16,mainAxisExtent: 280,),
              itemBuilder: (_,index)=> const TProductCardVertical(),
            ),

          ],
        ),
      ),
    ]
    );

  }
}

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: Colors.blueGrey,
      padding: const EdgeInsets.all(24),
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: TRoundedContainer(
              padding: const EdgeInsets.all(10),
              showBorder: false,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TBrandTitleWithVerifyIcon(
                          title: 'Nike',
                          brandTextSize: TextSizes.large,
                        ),
                        Text(
                          "256 products",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList()),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        backgroundColor:
            THelperFunctions.isDarkMode(context) ? Colors.black : TColors.light,
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
