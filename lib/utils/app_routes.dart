import 'package:flutter/material.dart';
import 'package:navigatr_teacher/models/product.dart';
import 'package:navigatr_teacher/views/Thinks.dart';
import 'package:navigatr_teacher/views/cart_screen.dart';
import 'package:navigatr_teacher/views/details_screen.dart';
import 'package:navigatr_teacher/views/home_screen.dart';
import 'package:navigatr_teacher/views/login_screen.dart';
import 'package:navigatr_teacher/views/not_found.dart';
import 'package:navigatr_teacher/views/splash_screen.dart';
import 'package:navigatr_teacher/views/Thinks.dart';

import '../heart.dart';
import '../sigupScreen.dart';
import '../views/demoStateful.dart';

class AppRoutes{
  //ادارة الروت
  //التنقل بين الصفحات"routeManager"
  static Route<dynamic>? routeManager(RouteSettings settings ){

    switch(settings.name){
      case '/home': return MaterialPageRoute(builder: (ctx)=>HomeScreen());

      case '/details':{ Product prod=settings.arguments as Product;
        return MaterialPageRoute(builder: (ctx)=>DetailsScreen(p:prod),settings: settings);}
      case '/cart':{
        List<Map<Product,int>> cartItems=settings.arguments as List<Map<Product,int>>;
        return MaterialPageRoute(builder: (ctx)=>CartScreen(cart: cartItems));}
      case '/splash': return MaterialPageRoute(builder: (ctx)=>SplashScreen());
     // case '/State': return MaterialPageRoute(builder: (ctx)=>DemoeScreen());
      case '/State': return MaterialPageRoute(builder: (ctx)=>MyHeartIcon());
      case '/sigup': return MaterialPageRoute(builder: (ctx)=>SigupScreen());
      case '/thanks': return MaterialPageRoute(builder: (ctx)=>ThanksScreen());

      case '/login': return MaterialPageRoute(builder: (ctx)=>LoginScreen());
      default:return MaterialPageRoute(builder: (ctx)=>NotFoundScreen());
    }


  }
}