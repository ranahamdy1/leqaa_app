// import 'package:custom_clippers/custom_clippers.dart';
// import 'package:flutter/material.dart';
// import 'package:leqaa_app/core/extensions/assets_widgets.dart';
// import 'package:leqaa_app/core/utils/app_assets.dart';
// import 'package:leqaa_app/core/utils/app_colors.dart';
//
// class DeletedSampleWidget extends StatelessWidget {
//   const DeletedSampleWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(right: 55),
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
//                     child: Row(
//                       children: [
//                         const Icon(Icons.block_flipped,color: AppColors.mainColor,),
//                         2.wSize,
//                         const Expanded(
//                           child: Text(
//                             "This message has been deleted.",
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: AppColors.mainColor,
//                             ),
//                           ),
//                         ),
//                       ],
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
//                 padding: const EdgeInsets.only(top: 20, left: 55,right: 22), // Adjust padding
//                 child: ClipPath(
//                   clipper: LowerNipMessageClipper(MessageType.send),
//                   child: Container(
//                     padding: const EdgeInsets.all(18),
//                     decoration: const BoxDecoration(
//                       color: AppColors.babyPinkColor,
//                     ),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.block_flipped,
//                           color: AppColors.secondColor,
//                         ),
//                         2.wSize,
//                         const Expanded(
//                           child: Text(
//                             "This message has been deleted.",
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: AppColors.secondColor,
//                             ),
//                           ),
//                         ),
//                       ],
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
