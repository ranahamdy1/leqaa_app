// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:leqaa_app/hive_test/boxes.dart';
// import 'package:leqaa_app/hive_test/person.dart';
//
// class PersonScreen extends StatelessWidget {
//   PersonScreen({super.key});
//   final nameController = TextEditingController();
//   final ageController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           TextFormField(
//             controller: nameController,
//           ),
//           TextFormField(
//             controller: ageController,
//           ),
//           ElevatedButton(
//             onPressed: (){
//               //put
//               boxPerson.put("key_${nameController.text}",
//               Person(
//                   name: nameController.text,
//                   age: int.parse(ageController.text),
//               )
//               );
//               //get
//               Person person = boxPerson.getAt(index);
//               print(person.name);
//               //delete
//               boxPerson.deleteAt(index);
//               //clear
//               boxPerson.clear(index);
//             },
//               child: const Text("data"),
//           )
//         ],
//       ),
//     );
//   }
// }
