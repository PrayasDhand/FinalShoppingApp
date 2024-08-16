import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkart/utils/constants/colors.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';
import '../../common/widgets/loaders/animation_loaders.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope( // Corrected from PopScope to WillPopScope
        canPop:  false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? Colors.black
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: TAnimationLoaderWidget(
              text: text,
              animation: animation,
            ),
          ),
        ),
      ),
    );
  }

  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}