import 'package:firebase/data/lokal/local.dart';
import 'package:firebase/data/models/category_model.dart';
import 'package:firebase/services/local_notification_service.dart';
import 'package:firebase/view_models/category_view_model.dart';
import 'package:firebase/view_models/products_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import '../../../data/models/natification.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../view_models/natification.dart';
import 'add_category_screen.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    String categoriesName = "";
    String imageURL = "";
    String docId = "";
    int son = 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categories",
          style: TextStyle(
            color: AppColors.c_2C2C73,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AddCategoryScreen();
                }));
              },
              icon: Icon(Icons.add,))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
        ),
        child: StreamBuilder<List<CategoryModel>>(
          stream: context.read<CategoriesViewModel>().listenCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
              List<CategoryModel> list = snapshot.data as List<CategoryModel>;
              return ListView(
                children: [
                  TextField(
                    style: TextStyle(color: Colors.black),
                    textInputAction: TextInputAction.next,
                    onChanged: (v) {
                      categoriesName = v;
                    },
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        fillColor: Colors.white,
                        filled: true,
                        hintMaxLines: 4,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                        hintText: "Categories Name",
                        hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.black),
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.black),
                    textInputAction: TextInputAction.next,
                    onChanged: (v) {
                      imageURL = v;
                    },
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        fillColor: Colors.white,
                        filled: true,
                        hintMaxLines: 4,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                        hintText: "Image Url",
                        hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.black),
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.black),
                    textInputAction: TextInputAction.next,
                    onChanged: (v) {
                      docId = v;
                    },
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        fillColor: Colors.white,
                        filled: true,
                        hintMaxLines: 4,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                        hintText: "Doc ID",
                        hintStyle:
                            const TextStyle(color: Colors.black, fontSize: 14),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.black),
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.w),
                      color: AppColors.c_2C2C73,
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            LocalNotificationService.localNotificationService
                                .showNotification(
                                    title: categoriesName,
                                    body: "Yangi Categorie q'shildi",
                                    id: son);
                            son++;
                            context.read<CategoriesViewModel>().insertCategory(
                                  CategoryModel(
                                    imageUrl: imageURL,
                                    categoryName: categoriesName,
                                    docId: docId,
                                    storagePath: "",
                                  ),
                                  context,
                                );
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Text(
                          "Add Categories",
                          style: TextStyle(color: Colors.white),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  ...List.generate(
                    list.length,
                    (index) {
                      CategoryModel category = list[index];
                      return InkWell(
                        onTap: () {
                          context
                              .read<ProductsViewModel>()
                              .getProductsByCategory(category.docId);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5.h),
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.w),
                              color: Colors.white,
                              border: Border.all(
                                  width: 1, color: AppColors.c_2C2C73)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15.w),
                                    child: Image.network(
                                      category.imageUrl,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        category.categoryName,
                                        style: const TextStyle(
                                          color: AppColors.c_2C2C73,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        category.docId,
                                        style: TextStyle(
                                            color: AppColors.c_2C2C73),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.w),
                                      color: AppColors.c_2C2C73,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        LocalNotificationService
                                            .localNotificationService
                                            .showNotification(
                                                title: category.categoryName,
                                                body: "Categoie O'CHIRILDI",
                                                id: son);
                                        son++;

                                        context
                                            .read<NotificationViewModel>()
                                            .addMessage(
                                              natificationModel:
                                                  NatificationModel(
                                                      name:
                                                          "Product  O'chirildi",
                                                      id: idContLocal),
                                            );
                                        idContLocal++;

                                        context
                                            .read<CategoriesViewModel>()
                                            .deleteCategory(
                                                category, context);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 145.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.w),
                                      color: AppColors.c_2C2C73,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        LocalNotificationService
                                            .localNotificationService
                                            .showNotification(
                                                title: category.categoryName,
                                                body: "Categoie yangilandi",
                                                id: son);
                                        son++;
                                        context
                                            .read<CategoriesViewModel>()
                                            .updateCategory(
                                              CategoryModel(
                                                imageUrl:
                                                    "https://dnr.wisconsin.gov/sites/default/files/feature-images/ECycle_Promotion_Manufacturers.jpg",
                                                categoryName: "Electronics",
                                                docId: category.docId,
                                                storagePath: '',
                                              ),
                                              context,
                                            );
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
