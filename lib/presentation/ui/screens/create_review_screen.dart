// import 'package:e_commerce_app/presentation/ui/screens/review_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CreateReviewScreen extends StatelessWidget {
//   const CreateReviewScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Get.to(ReviewScreen(productId: ,));
//             },
//             icon: Icon(
//               Icons.arrow_back_ios,
//               color: Colors.black,
//             )),
//         title: Text(
//           'Create Review',
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 30,
//               ),
//               TextField(
//                 decoration: InputDecoration(hintText: 'First Name'),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextField(
//                 decoration: InputDecoration(hintText: 'Last Name'),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Review',
//                   contentPadding: EdgeInsets.all(8),
//                 ),
//                 maxLines: 7,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Text('Submit'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }
