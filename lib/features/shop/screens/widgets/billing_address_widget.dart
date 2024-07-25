import 'package:flutter/material.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Shipping Address",
              style: Theme.of(context).textTheme.headlineSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(width: 16), // Adjusted spacing
            TextButton(
              iconAlignment: IconAlignment.end,
              onPressed: () {},
              child: const Text('Change'),
            ),
          ],
        ),
        Text('Prayas Dhand',style: Theme.of(context).textTheme.bodyLarge ,),
        const SizedBox(height: 8.0,),

          Row(
          children: [
            const Icon(Icons.phone,color: Colors.grey,size: 16,),
            const SizedBox(width: 16.0,),
            Text('+92-317-8059535',style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: 8.0,),
        Row(
          children: [
            const Icon(Icons.location_history,color: Colors.grey,size: 16,),
            const SizedBox(width: 16.0,),
            Expanded(child: Text('#3238, Salvatore Mansion, Mystic Falls, Virginia, USA',style: Theme.of(context).textTheme.bodyMedium,softWrap: true,)),
          ],
        ),
        const SizedBox(height: 8.0,),
      ],
    );
  }
}
