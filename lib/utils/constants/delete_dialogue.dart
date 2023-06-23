// import 'package:flutter/material.dart';

// class DeleteDialogue extends StatelessWidget {
//   const DeleteDialogue({super.key, required this.func, required this.index});

//   final Function func;
//   final String index;

//   @override
//   Widget build(BuildContext context) {
//     deleteDialogueContext(BuildContext context) {
//       Widget cancelBtn = TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           child: const Text("Cancel"));
//       Widget deleteBtn = TextButton(
//           onPressed: () {
//             func(index);
//             Navigator.of(context).pop();
//           },
//           child: const Text("Delete"));
//       AlertDialog deleteDialogue = AlertDialog(
//         title: const Text("Delete Transaction"),
//         content: const Text(
//             "Deleting this transaction will remove it from transaction database"),
//         actions: [cancelBtn, deleteBtn],
//       );
//       showDialog(
//         context: context,
//         builder: (BuildContext builder) => deleteDialogue,
//       );
//     }
//   }
// }
