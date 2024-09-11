

import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:navigatr_teacher/models/product.dart';
import 'package:navigatr_teacher/viewmodels/products_vm.dart';
import 'package:navigatr_teacher/views/cart_screen.dart';

class DetailsScreen extends StatefulWidget {
  late Product p;
  DetailsScreen({Key? key, required this.p}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  late String   imgPah;
  void initState() {
    //Product p = ModalRoute.of(context)!.settings.arguments as Product;
    imgPah= widget.p.image;
    super.initState();
  }
  bool isHeartFilled = false; // حالة القلب
  @override
  Widget build(BuildContext context) {
   // bool isHeartFilled = false; // حالة القلب
    //كائن"p"يستقبل المنتج من الصفحة الرئسية من نوع " Product"
    // Product p = ModalRoute.of(context)!.settings.arguments as Product;

    print("the image is ${ widget.p.thumbnails[0]}");
    return Scaffold(
      appBar: AppBar(
        title: Text(  widget.p.name),
        actions: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context,"/cart",arguments: ProductsVM.cartItems);
            },
            child: Container(
              //  ودجت عتعمل مثل العداد على السلة تحتوي علىمتغيربن " Badge"

              //"ProductsVM.cartItems.length}"عدد عناصر السله
              child: Badge(child: Icon(Icons.shopping_cart),label: Text("${ProductsVM.cartItems.length}")),
              margin: EdgeInsets.only(top: 10,right: 10),),
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           Stack(

              children: [
                Positioned(
                // left: -10,top: 20,
                //  left: 5,
                 // right: 10,


                  child: IconButton(
                    icon: Icon(
                      isHeartFilled ? Icons.favorite : Icons.favorite_border,
                      color: isHeartFilled ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        // تغيير حالة القلب عند الضغط
                        isHeartFilled = !isHeartFilled;
                      });
                    },
                  ),
                ),

              ],
            ),
           // Stack(
           //   children: [
           //     Positioned(
           //         right: 0,
           //         left: 100,
           //         child: Container(
           //           child: Center(child: Text("50%")),
           //           width: 50,
           //           height: 50,
           //           decoration:BoxDecoration (shape: BoxShape.circle,color: Colors.red),)),
           //   ],
           // ),

            Image.network( imgPah),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: ListView(
                //
                children: widget. p.thumbnails.map((e) => InkWell(
                  onTap: (){
                    imgPah=e;
                    setState(() {

                    });

                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[300]),
                            child: Center(
                              child: Image.network(e),),),
                ))
                    .toList(),
                scrollDirection: Axis.horizontal,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text( widget.p.brand),
                  Text( widget.p.price.toString()),
                ],),
            ),
            SizedBox(height: 15,),
            Text( widget.p.description)

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ProductsVM.addToCart(p:  widget.p,qty: 1);
        setState(() {

        });
        // Fluttertoast.showToast(
        //     msg: "product added to cart ",
        //     toastLength: Toast.LENGTH_SHORT,
        //
        //     timeInSecForIosWeb: 1,
        //
        //     fontSize: 16.0
        // );


      },child: Icon(Icons.add_shopping_cart),),
    );
  }
}
