import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  final String title;
  final VoidCallback onViewAll;
  final bool showViewAll;

  const TSectionHeading({
    super.key,
    required this.title,
    required this.onViewAll,
    this.showViewAll = false, // Default to true, so button shows unless explicitly set to false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (showViewAll) // Conditionally show the button
            TextButton(
              onPressed: onViewAll,
              child: const Text('View All'),
            ),
        ],
      ),
    );
  }
}
