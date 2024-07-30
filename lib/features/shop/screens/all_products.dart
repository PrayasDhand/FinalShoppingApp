import 'package:flutter/material.dart';

import 'package:pkart/common/widgets/appbar/appbar.dart';


import 'package:pkart/features/shop/screens/widgets/sortable_products.dart';



class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Popular Products'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: TSortableProducts(),
        ),
      ),
    );
  }
}


