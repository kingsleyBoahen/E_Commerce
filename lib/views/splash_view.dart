import 'dart:async';
import 'package:ecommerce_app/views/all_products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
     
     Timer(Duration(seconds: 2), (() => Navigator.push(context, MaterialPageRoute(builder: (context) => AllProductView(),)) ));
    super.initState();
  }
  Widget build(BuildContext context) {

    TextStyle shoptitleStyle = Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 30);    
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 45,
                backgroundColor: Colors.green,
              ),
              RichText(text: TextSpan(
                text: "E-",style: shoptitleStyle,
                children: [
                  TextSpan(text: "Shop",
                  style: shoptitleStyle.copyWith(color: Colors.green)
                  )
                ]
                ))
            ]
          ),
        )
      );
  }
}