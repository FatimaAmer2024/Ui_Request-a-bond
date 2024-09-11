

import 'package:flutter/material.dart';
import 'package:navigatr_teacher/models/product.dart';
import 'package:navigatr_teacher/viewmodels/products_vm.dart';
import 'package:navigatr_teacher/views/details_screen.dart';
//initState تتنفد قبل داله البناء
class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> allProducts=[];
  @override
  void initState() {
    ProductsVM pVM=ProductsVM();
    allProducts=pVM.loadAllProducts();
    super.initState();
  }
  //isHeartFilled هو اسم المتغير الذي يُمثل حالة القلب.
  //false هو القيمة الابتدائية للمتغير، مما يعني أن القلب غير ممتلئ في البداية.
  bool isHeartFilled = false; // حالة القلب


//Icon va =Icon(Icons.favorite_border_rounded);
  @override
  Widget build(BuildContext context) {
    int x=0;
    bool isHeartFilled = false;
    //انشانا كائن "allProducts"نضع فية جميع العناصر الاتية من دالةloadAllProducts()  الاتية من قاعدة البيانات بعد معالحتها
    //List<Product> allProducts=pVM.loadAllProducts();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            child: Badge(child: Icon(Icons.shopping_cart),
                label: Text("${ProductsVM.cartItems.length}")),
            margin: EdgeInsets.only(top: 10,right: 10),),

        ],
        title: Text("Home Screen"),
      ),
      body:ListView.builder(
          itemCount: allProducts.length,
          itemBuilder: (ctx,index){
            return
            //الودجت التي لاتحتوي على تفاعل او ضغط رز مثل "onTap:" نعملها داخل"InkWell"
              InkWell(
                onTap: (){

                  Navigator.pushNamed(context, "/details",arguments: allProducts[index]);
                 // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>DetailsScreen(),settings: RouteSettings(arguments: allProducts[index])));
                },
                child: Card(

                child: Column(children: [
                  //"allProducts[index]"كائن من كلاس المنتجاب
                Stack(
                  children: [

                    Positioned(
                      right: 0,
                        child: Container(
                          child: Center(child: Text("50%")),
                          width: 50,
                          height: 50,
                          decoration:BoxDecoration (shape: BoxShape.circle,color: Colors.red),)),
                    Image.network(allProducts[index].image),
                    Positioned(
                      // left: -10,top: 20,



                      // onTap: (){
                      // if(  va ==Icon(Icons.favorite,color: Colors.red))
                      //  va =Icon(Icons.favorite);
                      //  else
                      //   va =Icon(Icons.favorite_border_rounded,);
                      // },

                      child: IconButton(
                        icon:
                            allProducts[index].isHeartFilled,
                          // isHeartFilled ? Icons.favorite : Icons.favorite_border,
                          // color: isHeartFilled ? Colors.red : Colors.grey,

                        onPressed: () {

                          isHeartFilled= isHeartFilled ?false:true;
                          setState(() {
                            isHeartFilled ?
                            allProducts[index].isHeartFilled=Icon(Icons.favorite,color: Colors.red,):
                            allProducts[index].isHeartFilled=Icon(Icons.favorite_border,color: Colors.grey,);
                            // تغيير حالة القلب عند الضغط
                            //!isHeartFilled يُقلب قيمة المتغير isHeartFilled (إذا كان true، سيصبح false، والعكس بالعكس).
                          //  isHeartFilled = !isHeartFilled;
                          });
                        },
                      ),


                      //MaterialButton(
                      //     onPressed: () {  },
                      //     child: IconButton(
                      //       icon: Icon(
                      //         isHeartFilled ? Icons.favorite : Icons.favorite_border,
                      //         color: isHeartFilled ? Colors.red : Colors.grey,
                      //       ),
                      //       onPressed: () {
                      //         setState(() {
                      //           // تغيير حالة القلب عند الضغط
                      //           isHeartFilled = !isHeartFilled;
                      //         });
                      //       },
                      //     ),
                      //   )
                    )
                  ],
                ),
                             // Image.network("https://storage.googleapis.com/pod_public/1300/168838.jpg"),
                ListTile(

                  subtitle: Text(allProducts[index].brand),
                  title: Text(allProducts[index].name),
                  trailing: Text("${allProducts[index].price}"),
                  leading: InkWell(
                    onTap: (){
                   //   x+=1;
                      setState(() {

                      });
                    },
                      child: Icon(Icons.add_shopping_cart_outlined)),
                )
                            ],),),
              );
          })

    );
  }
}
