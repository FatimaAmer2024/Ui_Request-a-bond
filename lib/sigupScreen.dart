import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigatr_teacher/viewmodels/ueser_vm.dart';

class SigupScreen extends StatefulWidget {
  const SigupScreen({super.key});

  @override
  State<SigupScreen> createState() => _SigupScreenState();
}

class _SigupScreenState extends State<SigupScreen> {
  GlobalKey<FormState> fkey = GlobalKey();
  TextEditingController userControl =TextEditingController();
TextEditingController passWoedControol=TextEditingController();
TextEditingController emailControol =TextEditingController();
String? gender;
bool isAccept=false;
bool isPolicyAcceptted=false;
String? selectedCity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFFEDB0EF),),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Form(
                    key:fkey ,
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                           // border: BorderRadius.circular(20),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage("amges/f.jpg"), fit: BoxFit.fill,),

                           // border: BorderSide(b)
                          ),
                        ),

                        SizedBox(height: 20,),
                        TextFormField(
                          controller:userControl ,
                          //الدالة تأخذ معامل واحد (x)، وتُفحص قيمته
                          //إذا كانت القيمة غير فارغة وليست null، سيتم إرجاع قيمة null (مما يعني أن القيمة صحيحة).
                          //إذا كانت القيمة فارغة أو null، سيتم إرجاع رسالة الخطأ “this field is required” (هذا الحقل مطلوب).
                          //ادا كان ترو يرجعو "null"ادا كان فولس يرجع رسالة الخطاء

                          validator: (f)=> f!=null&& f.isNotEmpty?null:"the field is empty",
                          decoration: InputDecoration(
                              hintText: "enter your name",
                              counterStyle: TextStyle(color: Color(0xFFEDB0EF)),
                              label: Text("your name",style: TextStyle(color: Color(0xFF360F31)),),
                              prefixIcon: Icon(Icons.account_circle_rounded,color: Color(0xFF360F31),),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Color(0xFF360F31))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Color(0xFFEDB0EF)))),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: passWoedControol,
                          validator: (v)=>checkPassWord(v),

                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              hintText: "enter your password",
                              prefixIcon: Icon(Icons.password,color: Color(0xFF360F31),),
                              counterStyle: TextStyle(color: Color(0xFFEDB0EF)),
                              label: Text("your pasword",style: TextStyle(color: Color(0xFF360F31)),),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Color(0xFF360F31))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Color(0xFFEDB0EF)))),
                        ),

                        SizedBox(height: 20,),
                        TextFormField(
                          //الدالة تأخذ معامل واحد (e)، والذي يُمثل القيمة المدخلة في حقل البريد الإلكتروني.
                          //ذا يعني أننا نقوم بتعيين دالة للتحقق من صحة البريد الإلكترون
                          validator: (e)=>checkEmail(e),
                          keyboardType: TextInputType.url,
                          decoration: InputDecoration(
                              hintText: "enter your email",
                              prefixIcon: Icon(Icons.email_outlined,color: Color(0xFF360F31),),
                              counterStyle: TextStyle(color: Color(0xFFEDB0EF)),
                              label: Text("your Email",style: TextStyle(color: Color(0xFF360F31)),),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Color(0xFF360F31))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Color(0xFFEDB0EF)))),
                        ),
                        SizedBox(height: 20,),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("male"),
                              Radio(
                                  value: "male", groupValue: gender, onChanged:(b){
                                gender=b;
                                setState(() {

                                });

                              }),
                              Text("famale"),
                              Radio(value: "famale", groupValue:gender, onChanged:(v){
                                gender=v;
                                setState(() {

                                });
                              })
                            ],
                          ),
                        ),

                        Row(children: [

                          Checkbox(value: isAccept, onChanged: (x){
                           isAccept=x!;
                           setState(() {

                           });

                          }),
                          Text("if Accept put rtue"),

                        ],

                        ),
                        Row(children: [

                          Checkbox(value: isPolicyAcceptted, onChanged: (x){
                            isPolicyAcceptted=x!;
                            setState(() {

                            });

                          }),
                          Text("if Accept put rtue"),
                        ],),
                        DropdownButton(
                          dropdownColor:  Color(0xFFEDB0EF),
                        value:selectedCity,
                            hint: Text("selcted"),
                            items: [DropdownMenuItem(child: Text("Hadramot"),value: "Ha")], onChanged: (x){
                          selectedCity=x!;
                          setState(() {

                          });

                        }),



                      ],


                    ),
                  ),
                ),


              ],

            ),

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
        if(fkey.currentState!.validate());
       // UserVm
      },),
    );
  }

  checkEmail(String? e) {
    return "the email is false";
  }

  checkPassWord(String? v) {}
}
