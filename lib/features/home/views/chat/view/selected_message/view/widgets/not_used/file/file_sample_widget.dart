// import 'package:custom_clippers/custom_clippers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:leqaa_app/core/extensions/assets_widgets.dart';
// import 'package:leqaa_app/core/utils/app_assets.dart';
// import 'package:leqaa_app/core/utils/app_colors.dart';
// import 'package:leqaa_app/core/widgets/text_widget.dart';
//
// class FileSampleWidget extends StatelessWidget {
//   const FileSampleWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(right: 60),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Image.asset("chat_container".getPngAsset),
//               Flexible(
//                 child: ClipPath(
//                   clipper: LowerNipMessageClipper(MessageType.receive),
//                   child: Container(
//                     padding: const EdgeInsets.all(18),
//                     decoration: const BoxDecoration(
//                       color: AppColors.mainColor,
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(9),
//                               color: AppColors.smallTextColor
//                           ),
//                           child: Image.asset("chat_container".getPngAsset),
//                         ),
//                         9.wSize,
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const TextWidget("New Document.pdf",color: AppColors.whiteColor,),
//                             Container(
//                                 height: 20,
//                                 width: 44,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(44),
//                                     color: AppColors.smallTextColor
//                                 ),
//                                 child: const Center(
//                                     child: TextWidget("1,2 MB",
//                                         fontSize: 11,
//                                         color: AppColors.whiteColor
//                                     ),
//                                 )
//                             ),
//                           ],
//                         )
//                       ],
//                     )
//                   ),
//                 ),
//               ),
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
//                       color: AppColors.smallTextColor,
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(9),
//                               color: AppColors.smallTextColor
//                           ),
//                           child: Image.asset("chat_container".getPngAsset),
//                         ),
//                         9.wSize,
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const TextWidget("New Document.pdf",color: Colors.black,),
//                             Container(
//                                 height: 20,
//                                 width: 44,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(44),
//                                     color: Colors.grey
//                                 ),
//                                 child: const Center(
//                                   child: TextWidget("1,2 MB",
//                                       fontSize: 11,
//                                       color: Colors.black
//                                   ),
//                                 )
//                             ),
//                           ],
//                         )
//                       ],
//                     )
//                   ),
//                 ),
//               ),
//             ),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Text("13:00"),
//                 Icon(Icons.done_all_outlined, color: AppColors.mainColor),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
