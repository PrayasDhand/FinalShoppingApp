import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pkart/features/shop/screens/payment_success_screen.dart';
import 'package:pkart/features/shop/screens/widgets/billing_address_widget.dart';
import 'package:pkart/features/shop/screens/widgets/billing_payment_widget.dart';
import 'package:pkart/features/shop/screens/widgets/billing_amount_widget.dart';

import 'package:pkart/features/shop/screens/widgets/cart_items.dart';
import 'package:pkart/navigation_menu.dart';
import 'package:pkart/utils/constants/image_strings.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';

import '../../../common/widgets/appbar/appbar.dart';


class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
           children: [
             const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: 32.0,),

             ///coupon section
             TRoundedContainer(
               showBorder: true,
               backgroundColor: dark ? Colors.black  :Colors.white,
               padding: const EdgeInsets.only(top:8.0,bottom: 8.0,left: 16.0,right: 8.0 ),
               child: Row(
                 children: [
                   Flexible(
                     child: TextFormField(
                       decoration: const InputDecoration(
                         hintText: 'Have a Promo code? Enter Here',
                         focusedBorder: InputBorder.none,
                         disabledBorder: InputBorder.none,
                         errorBorder: InputBorder.none,
                         enabledBorder: InputBorder.none,
                         
                       ),
                     ),
                   ),

                   SizedBox(width: 80,child: ElevatedButton(onPressed: (){}, child: const Text('Apply'),)),
                 ],
               ),
             ),
             const SizedBox(height: 32.0,),

             ///Billing Section
             TRoundedContainer(
               showBorder: true,
               padding: const EdgeInsets.all(16.0),
               backgroundColor: dark ? Colors.black : Colors.white,
               child: const Column(
                 children: [
                   ///Pricing
                   TBillingAmountSection(),
                    SizedBox(height: 16.0,),
                   ///Divider
                    Divider(),
                    SizedBox(height: 16.0,),

                   TBillingPaymentSection(),
                    SizedBox(height: 16.0),

                   TBillingAddressSection(),

                 ],
               ),
             )
           ],
          ) ,
        ),
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(24.0),
        child: ElevatedButton(onPressed: ()=> Get.to(()=> PaymentSuccessScreen(image: TImages.success, title: 'Payment Successful', subTitle: 'Your Item will be Delivered to you soon...Thanks for shopping with us...', onPressed: ()=> Get.offAll(()=> const NavigationMenu())),), child: const Text('Checkout \$280.0'),),

      ),
    );
  }
}
