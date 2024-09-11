import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF360F31),
      body: Column(
        children: [
          Container(

            child: Center(
                child: Text("Thanks",style: TextStyle(color:  Color(0xFF360F31),fontWeight: FontWeight.bold,fontSize: 40),)),
            width: MediaQuery.of(context).size.width,
            height: 350,
            decoration: BoxDecoration(color:Color(0xFFEDB0EF) ,
              borderRadius: BorderRadius.circular(20)),
            ),
SizedBox(height: 80,),
Center(child: Text("The request has been completed successfully",style: TextStyle(color:  Color(0xFFEDB0EF),fontWeight: FontWeight.bold),)),
          SizedBox(height: 30,),
          Icon(Icons.thumb_up_alt_rounded,color:Color(0xFFEDB0EF) ,size: 70,)
        ],
      ),
    );
  }
}
