import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../home.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? Colors.grey : TColors.light,
        child: Stack(
          children: [
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(16.0 * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(TImages.shoeProduct1),
                  ),
                ),
              ),
            ),

            ///Image Sliders
            Positioned(
              right: 0,
              bottom: 30,
              left: 24,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection:Axis.horizontal ,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_,index)=> TRoundedImage(
                    imageUrl: TImages.googleLogo,
                    width: 80,
                    backgroundColor: dark ? Colors.white : Colors.black,
                    border: Border.all(color: TColors.primaryColor),
                    padding: const EdgeInsets.all(12.0),
                  ),
                  separatorBuilder: (_,__) => const SizedBox(width: 16,),
                  itemCount: 6,


                ),
              ),
            ),
            TAppBar(
              showBackArrow: true,
              actions: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: dark
                        ? Colors.black.withOpacity(0.9)
                        : TColors.white.withOpacity(0.9),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.heart,
                    ),
                    color: Colors.red,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}