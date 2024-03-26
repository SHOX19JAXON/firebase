// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import 'package:provider/provider.dart';
//
//
// class UpdateBookScreen extends StatefulWidget {
//   UpdateBookScreen({super.key, required this.bookModel});
//
//  // BookModel bookModel;
//   @override
//   State<UpdateBookScreen> createState() => _UpdateBookScreenState();
// }
//
// class _UpdateBookScreenState extends State<UpdateBookScreen> {
//   // final BookRepo bookRepo = BookRepo();
//
//
//   @override
//
//   Widget build(BuildContext context) {
//
//     final TextEditingController nameController =
//     TextEditingController(text: widget.bookModel.bookName);
//     final TextEditingController descriptionController =
//     TextEditingController(text: widget.bookModel.description);
//     final TextEditingController priceController =
//     TextEditingController(text: widget.bookModel.price.toString());
//     final TextEditingController imageUrlController =
//     TextEditingController(text: widget.bookModel.imageUrl);
//     final TextEditingController authorController =
//     TextEditingController(text: widget.bookModel.author);
//     final TextEditingController categoryIdController =
//     TextEditingController(text: widget.bookModel.categoryId.toString());
//
//
//     return Scaffold(appBar: AppBar(backgroundColor: AppColors.c_29BB89,title: Text("Kitob ma'lumotlarini o'zgartirish"),),
//     body: Padding(
//       padding: const EdgeInsets.all(24),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             10.getH(),
//             TextField(
//               controller: nameController,
//               textInputAction: TextInputAction.next,
//               onChanged: (v){
//                 widget.bookModel=widget.bookModel.copyWith(bookName: v);
//               },
//               decoration:
//               InputDecoration(
//
//                   floatingLabelBehavior:
//                   FloatingLabelBehavior.always,
//                   fillColor: Colors.white  ,
//                   filled: true,
//                   hintMaxLines: 4,
//
//                   contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//                   hintText: "Kitob nomini kiriting",
//                   hintStyle: TextStyle(color: Colors.black, fontSize: 14),
//                   enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
//                       borderRadius: BorderRadius.circular(12)),
//                   disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
//                       borderRadius: BorderRadius.circular(12)),
//                   focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black),
//                       borderRadius: BorderRadius.circular(12))
//               ),
//             ),
//             20.getH(),
//             TextField(
//               controller: authorController,
//               textInputAction: TextInputAction.next,
//               onChanged: (v){
//                 widget.bookModel=widget.bookModel.copyWith(author: v);
//               },
//               decoration:
//               InputDecoration(
//
//                   floatingLabelBehavior:
//                   FloatingLabelBehavior.always,
//                   fillColor: Colors.white  ,
//                   filled: true,
//                   hintMaxLines: 4,
//
//                   contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//                   hintText: "Kitob muallifini kiriting",
//                   hintStyle: TextStyle(color: Colors.black, fontSize: 14),
//                   enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
//                       borderRadius: BorderRadius.circular(12)),
//                   disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
//                       borderRadius: BorderRadius.circular(12)),
//                   focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black),
//                       borderRadius: BorderRadius.circular(12))
//               ),
//             ),
//             20.getH(),
//             TextField(
//               controller: categoryIdController,
//               textInputAction: TextInputAction.next,
//               onChanged: (v){
//                 widget.bookModel=widget.bookModel.copyWith(categoryId: int.parse(v));
//               },
//               decoration:
//               InputDecoration(
//
//                   floatingLabelBehavior:
//                   FloatingLabelBehavior.always,
//                   fillColor: Colors.white  ,
//                   filled: true,
//                   hintMaxLines: 4,
//
//                   contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//                   hintText: "Kitob muallifini kiriting",
//                   hintStyle: TextStyle(color: Colors.black, fontSize: 14),
//                   enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
//                       borderRadius: BorderRadius.circular(12)),
//                   disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
//                       borderRadius: BorderRadius.circular(12)),
//                   focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black),
//                       borderRadius: BorderRadius.circular(12))
//               ),
//             ),
//             20.getH(),
//             TextField(
//               controller: priceController,
//               onChanged: (v){
//                 widget.bookModel=widget.bookModel.copyWith(price: double.parse(v));
//               },
//               textInputAction: TextInputAction.next,
//               decoration:
//               InputDecoration(
//
//                   floatingLabelBehavior:
//                   FloatingLabelBehavior.always,
//                   fillColor: Colors.white  ,
//                   filled: true,
//                   hintMaxLines: 4,
//
//                   contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//                   hintText: "Kitob narxini kiriting",
//                   hintStyle: TextStyle(color: Colors.black, fontSize: 14),
//                   enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
//                       borderRadius: BorderRadius.circular(12)),
//                   disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
//                       borderRadius: BorderRadius.circular(12)),
//                   focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black),
//                       borderRadius: BorderRadius.circular(12))
//               ),
//             ),
//             20.getH(),
//             TextField(
//               controller: descriptionController,
//               textInputAction: TextInputAction.next,
//               onChanged: (v){
//                 widget.bookModel=widget.bookModel.copyWith(description: v);
//               },
//               decoration:
//               InputDecoration(
//
//                   floatingLabelBehavior:
//                   FloatingLabelBehavior.always,
//                   fillColor: Colors.white  ,
//                   filled: true,
//                   hintMaxLines: 4,
//
//                   contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//                   hintText: "Kitob tasnifi",
//                   hintStyle: TextStyle(color: Colors.black, fontSize: 14),
//                   enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
//                       borderRadius: BorderRadius.circular(12)),
//                   disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
//                       borderRadius: BorderRadius.circular(12)),
//                   focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black),
//                       borderRadius: BorderRadius.circular(12))
//               ),
//             ),
//
//             20.getH(),
//             TextField(
//               controller: imageUrlController,
//               keyboardType: TextInputType.text,
//               textInputAction: TextInputAction.done,
//               onTap: ()async{
//
//                 final clipPaste = await Clipboard.getData(Clipboard.kTextPlain);
//                 setState(() {
//                   imageUrlController.text = clipPaste?.text?? '';
//                 });
//               },
//
//               maxLines: null,
//
//               onChanged: (v){
//                 widget.bookModel=widget.bookModel.copyWith(imageUrl: v);
//               },
//               decoration:
//               InputDecoration(
//
//
//                   floatingLabelBehavior:
//                   FloatingLabelBehavior.always,
//                   fillColor: Colors.white  ,
//                   filled: true,
//                   hintMaxLines: 4,
//
//
//                   contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//                   hintText: "Kitob rasmi URL",
//                   hintStyle: TextStyle(color: Colors.black, fontSize: 14),
//                   enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
//                       borderRadius: BorderRadius.circular(12)),
//                   disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
//                       borderRadius: BorderRadius.circular(12)),
//                   focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black),
//                       borderRadius: BorderRadius.circular(12))
//               ),
//             ),
//             40.getH(),
//             TextButton(
//                 style: TextButton.styleFrom(
//                     padding: EdgeInsets.symmetric(vertical: 16),
//                     backgroundColor: AppColors.c_29BB89,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
//                 onPressed: ()async
//                   {
//                     if (widget.bookModel.canAddModel()){
//                       showSuccessMessage("SUCCESS");
//                       context.read<BookViewModel>().updateBook(widget.bookModel);
//                       Navigator.pop(context);
//                       setState(() {});
//                     }
//                     else {
//                       showErrorMessage("ERROR");
//                     }
//
//
//
//
//                 },child: Text("Update", style: AppTextStyle.rubikMedium.copyWith(color: AppColors.white),))
//
//
//           ],
//
//         ),
//       ),
//     ),);
//   }
// }
