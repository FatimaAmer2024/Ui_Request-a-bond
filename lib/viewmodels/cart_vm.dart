import 'package:navigatr_teacher/models/product.dart';

class CartVM{
  static double calcTotalAmount(List<Map<Product,int>>items){
    double amount=0.0;
    items.forEach((e){
      e.forEach((k,v){
        amount+=k.price * v;
      });
    });

    return amount;
  }
}