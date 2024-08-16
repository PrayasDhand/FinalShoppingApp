import 'package:flutter/material.dart';
import 'package:pkart/utils/constants/colors.dart';

import 'package:lottie/lottie.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation, // Path to the Lottie animation file
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation; // Path to the Lottie file
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Use Lottie.asset to display the Lottie animation
              Lottie.asset(
                animation, // Ensure this path is correct
                fit: BoxFit.cover, // Adjust as needed
              ),
              const SizedBox(height: 24),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              if (showAction)
                SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style: OutlinedButton.styleFrom(backgroundColor: TColors.dark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.light),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
