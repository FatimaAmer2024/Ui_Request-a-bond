import 'dart:ffi';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  GlobalKey<FormState> fkey = GlobalKey();
  TextEditingController userControl =TextEditingController();
  TextEditingController noteControl=TextEditingController();
  TextEditingController phonlControol =TextEditingController();
  String? selected;
  String? payment;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFFEDB0EF),),
      body: SingleChildScrollView(
        child: Form(
          key:  fkey,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment:    MainAxisAlignment.start,
              children: [
                Text("user name" ,style: TextStyle(color: Color(0xFF360F31),),),
              SizedBox(height: 8,),
              TextFormField(
               controller:phonlControol ,
                validator: (n){
                 if(n!.isEmpty){
                   return "this field is required";
                 }
                 final regexp =RegExp(r"^[a-zA-Z]+ [a-zA-Z]+ [a-zA-Z]+");
                 if(!regexp.hasMatch(n)){
                   return "enter your fall name";
                 }
                },

                // validator: (x){
                //  if (x!.isEmpty || !RegExp(r"^[a-zA-Z]+ [a-zA-Z]+ [a-zA-Z]+").hasMatch(x.toString())){
                //   return "error";
                //  }
                //  return null;
                // },
                decoration: InputDecoration(

                    hintText: "enter your name",
                    counterStyle: TextStyle(color: Color(0xFFEDB0EF)),
                    label: Text("your name",style: TextStyle(color: Color(0xFFEDB0EF)),),
                    prefixIcon: Icon(Icons.account_circle_rounded,color: Color(0xFFEDB0EF),),
                    enabledBorder: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFFEDB0EF),style: BorderStyle.solid,width: 4)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFFEDB0EF)))),
              ),
                SizedBox(height: 10,),
                Text("Numer Phone" ,style: TextStyle(color: Color(0xFF360F31),),),
                SizedBox(height: 10,),
                TextFormField(
                  controller:userControl ,
                   // validator: (x)=>x!=null && x.isNotEmpty?null:"this field is required",
              validator: (x){
                //x!=null && x.isNotEmpty?
                // { x.length==9? null:"must be from 9 number"}:"this field is required";
                if (x!=null && x.isNotEmpty){
                  if(x.length==9) {
                    if(x[0]=="7" && ( x[1]=="7" ||x[1]=="8"||x[1]=="1"||x[1]=="3"))
                      return null;
                    return 'the number is not Yemeni';
                    } return "Complete the number";
                }
                return "this field is required";
},

                  decoration: InputDecoration(
                      hintText: "enter your number",
                      counterStyle: TextStyle(color: Color(0xFFEDB0EF)),
                      label: Text("your number",style: TextStyle(color: Color(0xFFEDB0EF)),),
                      prefixIcon: Icon(Icons.account_circle_rounded,color: Color(0xFFEDB0EF),),
                      enabledBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFEDB0EF),style: BorderStyle.solid,width: 4)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFEDB0EF)))),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(right: 100),
                  width: 200,
                  height: 70,
                  decoration: BoxDecoration(color: Color(0xFFEDB0EF) ,borderRadius: BorderRadius.circular(10)),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Delivery time" ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      DropdownButton(

                        items: [DropdownMenuItem(child: Text("morning",style: TextStyle(color:  Color(0xFFEDB0EF),fontWeight: FontWeight.bold)),value: "m",),
                        DropdownMenuItem(child: Text("night",style: TextStyle(color:  Color(0xFFEDB0EF),fontWeight: FontWeight.bold)),value: "n",),
                        DropdownMenuItem(child: Text("noon",style: TextStyle(color:  Color(0xFFEDB0EF),fontWeight: FontWeight.bold)),value: "no",),
                        DropdownMenuItem(child: Text("afternoon",style: TextStyle(color:  Color(0xFFEDB0EF),fontWeight: FontWeight.bold)),value: "a",),


                      ], onChanged: (e){

                        selected=e;
                        setState(() {

                        });
                      },value: selected,
                        hint:Text( "select"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(right: 100),
                  width: 200,
                  height:200,
                  decoration: BoxDecoration(color: Color(0xFFEDB0EF) ,borderRadius: BorderRadius.circular(10)),
                  child: Column(

                   // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Payment Methods",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                  SizedBox(height: 5,),
                  Row(children: [
                    Radio(
                        value: "reseve", groupValue:payment, onChanged:(b){
                      payment=b;
                      setState(() {
                      });
                    }),
                    Text("when reseve"),
                  ],),
                    Row(children: [
                      Radio(value: "alomqy", groupValue:payment, onChanged:(v){
                        payment=v;
                        setState(() {
                        });
                      }),
                      Text("alomqy"),
                    ],),
                   Row(children: [
                     Radio(value: "alkoraymi", groupValue:payment, onChanged:(v){
                       payment=v;
                       setState(() {

                       });

                     }),
                     Text("alkoraymi"),
                   ],)
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller:noteControl ,

                 // validator: (f)=> f!=null&& f.isNotEmpty?null:"the field is empty",
                  decoration: InputDecoration(
                 //     hintText: "enter your name",
                      counterStyle: TextStyle(color: Color(0xFFEDB0EF)),
                      label: Text("your note",style: TextStyle(color: Color(0xFFEDB0EF)),),
                      prefixIcon: Icon(Icons.note,color: Color(0xFFEDB0EF),),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFEDB0EF),style: BorderStyle.solid,width: 4)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFEDB0EF)))),
                  maxLines: 3,
                ),

            ],),
          ),
        ),
      ),


      floatingActionButton: FloatingActionButton(
        splashColor: Color(0xFFEDB0EF),
        backgroundColor: Color(0xFFEDB0EF),

        child:Icon( Icons.save_outlined,color: Color(0xFF360F31),),
        onPressed: (){
          // وضع الفورم الحالي"currentState"
          //    هدة الداله تعمل تحقق على كل دوال التحقق".validate()"
          if(fkey.currentState!.validate()&&selected !=null&& payment!=null){
Navigator.pushNamed(context, '/thanks',);
          }
         else print("eroor");




          // UserVm
        },),




    );

  }
}
