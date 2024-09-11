













import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHeartIcon extends StatefulWidget {
  @override
  _MyHeartIconState createState() => _MyHeartIconState();
}
class _MyHeartIconState extends State<MyHeartIcon> {
  bool isHeartFilled = false; // حالة القلب

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {  },
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
    );
  }
}

















// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class _MyHeartIconState extends State<MyHeartIcon> {
//   bool isHeartFilled = false; // حالة القلب
//
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
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
//     );
//   }
// }
//
// class MyHeartIcon {
// }
//
//
// /*
//
// في السطر المذكور، نستخدم ويدجت Icon لعرض أيقونة. دعوني أفسر ما يحدث هنا:
//
// isHeartFilled ? Icons.favorite : Icons.favorite_border:
// هذا هو تعبير مشروط (conditional expression) يستخدم لتحديد أيقونة القلب المعروضة.
// إذا كانت قيمة isHeartFilled صحيحة (أي true)، فسيتم استخدام أيقونة ممتلئة (Icons.favorite)، وإلا سيتم استخدام أيقونة فارغة (Icons.favorite_border).
// color: isHeartFilled ? Colors.red : Colors.grey:
// هذا يحدد لون الأيقونة.
// إذا كانت قيمة isHeartFilled صحيحة، سيكون لون الأيقونة أحمر (Colors.red)، وإلا سيكون رماديًا (Colors.grey).
// باختصار، الكود يقوم بعرض أيقونة القلب (ممتلئة أو فارغة) ويحدد لونها استنادًا إلى قيمة isHeartFilled.
//  */
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// //
// // class MyHeartIcon extends StatefulWidget {
// //   @override
// //   _MyHeartIconState createState() => _MyHeartIconState();
// // }
// //
// // class _MyHeartIconState extends State<MyHeartIcon> {
// //   bool isHeartFilled = false; // حالة القلب
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return IconButton(
// //       icon: Icon(
// //         isHeartFilled ? Icons.favorite : Icons.favorite_border,
// //         color: isHeartFilled ? Colors.red : Colors.grey,
// //       ),
// //       onPressed: () {
// //         setState(() {
// //           // تغيير حالة القلب عند الضغط
// //           isHeartFilled = !isHeartFilled;
// //         });
// //       },
// //     );
// //   }
// // }
