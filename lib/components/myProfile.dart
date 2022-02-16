// import 'package:classmates/components/custom_textfield.dart';
// import 'package:classmates/components/reusable_button.dart';
// import 'package:classmates/components/user_avatar.dart';
// import 'package:flutter/material.dart';

// class ProfileWidget extends StatelessWidget {
//   ProfileWidget({Key? key,}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Center(
//           child: Text(
//             "My Profile",
//             style: TextStyle(
//                 color: Colors.white, fontSize: 36, fontWeight: FontWeight.w700),
//           ),
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const UserAvatar(),
//             Container(
//               margin: const EdgeInsets.only(top: 20, left: 5),
//               child: const Text(
//                 "Badges",
//                 style: TextStyle(color: Colors.white, fontSize: 22),
//               ),
//             )
//           ],
//         ),
//         Container(
//           padding: const EdgeInsets.only(left: 6),
//           child: const Text(
//             "Name",
//             style: TextStyle(
//                 fontFamily: 'Roboto', fontSize: 20, color: Colors.white),
//           ),
//         ),
//         CustomTextField(
//           controller: nameController,
//         ),
//         const SizedBox(
//           height: 15.0,
//         ),
//         Container(
//           padding: const EdgeInsets.only(left: 6),
//           child: const Text(
//             "College",
//             style: TextStyle(
//                 fontFamily: 'Roboto', fontSize: 20, color: Colors.white),
//           ),
//         ),
//         CustomTextField(
//           controller: collegeController,
//         ),
//         const SizedBox(
//           height: 15.0,
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.only(left: 6),
//                       child: const Text(
//                         "Year",
//                         style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: 20,
//                             color: Colors.white),
//                       ),
//                     ),
//                     CustomTextField(controller: yearController)
//                   ]),
//             ),
//             Expanded(
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.only(left: 6),
//                       child: const Text(
//                         "Department",
//                         style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: 20,
//                             color: Colors.white),
//                       ),
//                     ),
//                     CustomTextField(controller: deptController)
//                   ]),
//             )
//           ],
//         ),
//         const SizedBox(
//           height: 30,
//         ),
//         Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: const [
//               ReusableButton(
//                 text: "Save",
//               ),
//               ReusableButton(
//                 // onPressed: () => showBottomSheet(context: context, builder: ),
//                 text: "Add Badges",
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   }