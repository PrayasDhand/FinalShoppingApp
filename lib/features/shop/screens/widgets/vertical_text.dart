import 'package:flutter/material.dart';
import 'package:pkart/features/personalization/screens/profile/profile.dart';
import 'package:pkart/utils/constants/colors.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';




class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key, required this.image, required this.title,  this.textColor = Colors.white, this.backgroundColor = Colors.white, this.onTap,  this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
           TCircularImage(image: image,padding: 8 *1.4,height: 56,width: 56,isNetworkImage: isNetworkImage,backgroundColor: backgroundColor,fit:BoxFit.fitWidth ,overlayColor: THelperFunctions.isDarkMode(context) ? TColors.light : Colors.black,),
            const SizedBox(height: 8),
            SizedBox(
              width: 55,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}