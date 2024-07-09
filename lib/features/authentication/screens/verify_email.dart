import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkart/features/authentication/screens/login.dart';

class VerifyEmailAddress extends StatelessWidget {
  const VerifyEmailAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()=> Get.offAll(()=> const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              ///image

              
              ///Title and Subtitle
              
              /// Buttons
            ],
          ),
        ),
      ),
    );
  }
}
