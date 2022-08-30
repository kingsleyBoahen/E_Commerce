import 'package:device_preview/device_preview.dart';
import 'package:ecommerce_app/views/splash_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


  void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) =>  MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: SplashView(),
    ),
  ),
);

  
  
  
