// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:kokok_pay/utils/methods/support_methods.dart';
//
// import '../../../resources/size_manager.dart';
// import '../../painter/qr_screen_painter.dart';
//
// class QrAmountScreen extends StatefulWidget {
//   static const String amountKey = 'amount';
//   static const String descriptionKey = 'description';
//
//   const QrAmountScreen({Key? key}) : super(key: key);
//
//   @override
//   State<QrAmountScreen> createState() => _QrAmountScreenState();
// }
//
// class _QrAmountScreenState extends State<QrAmountScreen> {
//   String? amount;
//   String? description;
//   final _formKey = GlobalKey<FormState>();
//
//   void _onFormSubmit() {
//     _formKey.currentState!.save();
//     Navigator.of(context).pop({
//       QrAmountScreen.amountKey: amount,
//       QrAmountScreen.descriptionKey: description,
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Scaffold(
//       appBar: AppBar(title: const Text('My Qr')),
//       body: CustomPaint(
//         painter: QrScreenPainter(theme.colorScheme.primary),
//         child: Center(
//           child: Column(
//             children: [
//               Card(
//                 child: Column(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(SizeResource.value_12),
//                       alignment: Alignment.centerLeft,
//                       color: theme.colorScheme.primary.withOpacity(.5),
//                       child: Text(
//                         'All fields are not mandatory',
//                         style: theme.textTheme.titleMedium,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: SizeResource.value_18,
//                         horizontal: SizeResource.value_12,
//                       ),
//                       child: Form(
//                         key: _formKey,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text('Enter Amount (LAK)'),
//                             const SizedBox(height: SizeResource.value_8),
//                             TextFormField(
//                               decoration: const InputDecoration(hintText: 'Please Enter Amount'),
//                               keyboardType: TextInputType.number,
//                               textInputAction: TextInputAction.next,
//                               inputFormatters: [
//                                 FilteringTextInputFormatter.digitsOnly,
//                               ],
//                               onTapOutside: (event) {
//                                 SupportMethods.closeKeyboard();
//                               },
//                               onSaved: (amount) {
//                                 this.amount = amount;
//                               },
//                             ),
//                             const SizedBox(height: SizeResource.value_12),
//                             const Text('Description'),
//                             const SizedBox(height: SizeResource.value_8),
//                             TextFormField(
//                               decoration: const InputDecoration(
//                                 hintText: 'Please Enter Description',
//                               ),
//                               keyboardType: TextInputType.text,
//                               textInputAction: TextInputAction.done,
//                               onSaved: (description) {
//                                 this.description = description;
//                               },
//                               onFieldSubmitted: (description) {
//                                 _onFormSubmit();
//                               },
//                             ),
//                             const SizedBox(height: SizeResource.value_12),
//                             SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                 onPressed: _onFormSubmit,
//                                 child: const Text('Generate QR'),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
