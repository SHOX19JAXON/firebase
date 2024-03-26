import 'package:firebase/data/models/product_model.dart';
import 'package:firebase/utils/images/app_images.dart';
import 'package:firebase/utils/project_extensions.dart';
import 'package:firebase/utils/styles/app_text_style.dart';
import 'package:firebase/utils/utilities.dart';
import 'package:firebase/view_models/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';

import '../../../data/models/category_model.dart';
import '../../../services/local_notification_service.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../view_models/category_view_model.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  // final String docId;
  // final String productName;
  // final String productDescription;
  // final double price;
  // final String imageUrl;
  // final String categoryId;
  int id = 1;

  @override
  Widget build(BuildContext context) {
    String docId = "";
    String productName = "";
    String productDescription = "";
    double price = 0;
    String imageUrl = "";
    String categoryId = "";
 int son = 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c_2C2C73,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          "Add product screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              10.getH(),
              TextField(
                style: TextStyle(color: Colors.black),
                textInputAction: TextInputAction.next,
                onChanged: (v) {
                  productName = v;
                },
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    fillColor: Colors.white,
                    filled: true,
                    hintMaxLines: 4,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                    hintText: "Product Name",
                    hintStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.black),
                        borderRadius: BorderRadius.circular(12))),
              ),
              20.getH(),
              TextField(
                style: TextStyle(color: Colors.black),
                textInputAction: TextInputAction.next,
                onChanged: (v) {
                  productDescription = v;
                },
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    fillColor: Colors.white,
                    filled: true,
                    hintMaxLines: 4,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                    hintText: "Product Description",
                    hintStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.black),
                        borderRadius: BorderRadius.circular(12))),
              ),
              20.getH(),
              TextField(
                style: TextStyle(color: Colors.black),
                textInputAction: TextInputAction.next,
                onChanged: (v) {
                  categoryId = v;
                },
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    fillColor: Colors.white,
                    filled: true,
                    hintMaxLines: 4,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                    hintText: "Product Id",
                    hintStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.black),
                        borderRadius: BorderRadius.circular(12))),
              ),
              20.getH(),
              TextField(
                style: TextStyle(color: Colors.black),
                onChanged: (v) {
                  price = v as double;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    fillColor: Colors.white,
                    filled: true,
                    hintMaxLines: 4,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                    hintText: "Product price",
                    hintStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.black),
                        borderRadius: BorderRadius.circular(12))),
              ),
              20.getH(),
              TextField(
                style: TextStyle(color: Colors.black),
                textInputAction: TextInputAction.next,
                onChanged: (v) {
                  imageUrl = v;
                },
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    fillColor: Colors.white,
                    filled: true,
                    hintMaxLines: 4,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                    hintText: "image Url",
                    hintStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.black),
                        borderRadius: BorderRadius.circular(12))),
              ),
              20.getH(),
              TextField(
                style: TextStyle(color: Colors.black),
                textInputAction: TextInputAction.done,
                onChanged: (v) {
                  docId = v;
                },
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    fillColor: Colors.white,
                    filled: true,
                    hintMaxLines: 4,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                    hintText: "Kitob rasmi URL",
                    hintStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.black),
                        borderRadius: BorderRadius.circular(12))),
              ),
              40.getH(),
              TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: AppColors.c_2C2C73,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () async {
                  if (productName.isNotEmpty &&
                      productDescription.isNotEmpty &&
                      price.isFinite) {
                    context.read<ProductsViewModel>().insertProducts(
                          ProductModel(
                            docId: docId,
                            price: price,
                            imageUrl: imageUrl,
                            productName: productName,
                            productDescription: productDescription,
                            categoryId: categoryId,
                          ),
                          context,
                        );
                    LocalNotificationService.localNotificationService
                        .showNotification(
                        title:productName ,
                        body: "Maxsulot q'shildi",
                        id: son);
                    son++;
                    showSuccessMessage("SUCCESS");

                    Navigator.pop(context);
                  } else {
                    showErrorMessage("ERROR");
                  }
                },
                child: Text(
                  "Add",
                  style:
                      AppTextStyle.rubikMedium.copyWith(color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
