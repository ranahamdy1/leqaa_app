// import 'package:custom_clippers/custom_clippers.dart';
// import 'package:flutter/material.dart';
// import 'package:leqaa_app/core/utils/app_assets.dart';
// import 'package:leqaa_app/core/utils/app_colors.dart';
//
// class EmptySampleWidget extends StatelessWidget {
//   const EmptySampleWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(right: 288),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Flexible(
//                 child: ClipPath(
//                   clipper: LowerNipMessageClipper(MessageType.receive),
//                   child: Container(
//                     padding: const EdgeInsets.all(18),
//                     decoration: const BoxDecoration(
//                       color: AppColors.pageControllerColorWithOpacity,
//                     ),
//                     child: const Text(
//                       "   ",
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Image.asset("chat_container".getPngAsset),
//             ],
//           ),
//         ),
//         Column(
//           children: [
//             Container(
//               alignment: Alignment.centerRight,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 20, left: 60), // Adjust padding
//                 child: ClipPath(
//                   clipper: LowerNipMessageClipper(MessageType.send),
//                   child: Container(
//                     padding: const EdgeInsets.all(18),
//                     decoration: const BoxDecoration(
//                       color: AppColors.babyPinkColor,
//                     ),
//                     child: const Text(
//                       "   ",
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const Row(
//               children: [
//                 Text("13:00"),
//                 Icon(Icons.done_all_outlined,
//                     color: AppColors.pageControllerColor
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
