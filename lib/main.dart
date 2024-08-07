import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pkart/firebase_options.dart';


import 'app.dart';
import 'data/repositories/authentication_repository.dart';



Future<void> main()  async {

  ///Add Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  ///Init Local Storage
  await GetStorage.init();
  ///Init Payment Methods
  ///Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  ///Initialize firebase

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value)=> Get.put(AuthenticationRepository()),);


  runApp(const App());
}