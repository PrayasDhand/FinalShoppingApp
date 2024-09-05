import 'package:flutter/material.dart';
import 'package:pkart/common/styles/shimmer.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key,  this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 100,
      child: ListView.separated(itemBuilder: (_,__){
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TShimmerEffect(width: 55, height: 55,radius: 55,),
            SizedBox(height: 16/2,),

            TShimmerEffect(width: 55, height: 8)
          ],
        );
      }, separatorBuilder: (_,__)=> const SizedBox(width: 16,), itemCount: itemCount),
    );
  }
}
