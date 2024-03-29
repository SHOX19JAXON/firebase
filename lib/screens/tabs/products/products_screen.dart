import 'package:firebase/data/lokal/local.dart';
import 'package:firebase/data/models/product_model.dart';
import 'package:firebase/screens/tabs/add_product_screen/add_product_screen.dart';
import 'package:firebase/screens/tabs/products/vidget_items/product_widget.dart';
import 'package:firebase/services/local_notification_service.dart';
import 'package:firebase/utils/project_extensions.dart';
import 'package:firebase/view_models/natification.dart';
import 'package:firebase/view_models/products_view_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../data/models/natification.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/constants/app_constant.dart';
import '../../permissions/permissions_screen.dart';
import '../product_info_screen/product_info_screen.dart';

Future<void> onBackgroundFCM(RemoteMessage message) async {
  debugPrint(
      "BACKGROUND MODEDA PUSH NOTIFICATION KELDI:${message.notification!.title}");
}

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int son = 1;

  _init() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    debugPrint("FCM TOKEN ${fcmToken}");
    FirebaseMessaging.onMessage.listen((remoteMessage) {
      debugPrint(
          "Push notification keldiku☺️ => ${remoteMessage.notification!.title}");
      if (remoteMessage.notification != null) {
        print(son);
        son++;
        LocalNotificationService().showNotification(
            title: remoteMessage.notification!.title!,
            body: remoteMessage.notification!.body!,
            id: son);
      }
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Products",
          style: TextStyle(color: AppColors.c_2C2C73),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AddProductScreen();
              }));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: StreamBuilder<List<ProductModel>>(
        stream: context.read<ProductsViewModel>().listenProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            List<ProductModel> list = snapshot.data as List<ProductModel>;
            return ListView(
              children: [
                SizedBox(height: 20,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25.h()),
                  child: Container(
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(15.w()),
                      color: AppColors.c_2C2C73,
                    ),
                    width: double.infinity,

                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const PermissionsScreen();
                        }));
                      },
                      child: const Text(
                        "Permissions",
                        style: TextStyle(color: AppColors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w()),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(25),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 15,
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    children: [
                      ...List.generate(list.length, (index) {
                        ProductModel productModel = list[index];

                        return InkWell(
                          borderRadius: BorderRadius.circular(20.w()),
                          onTap: () {
                            LocalNotificationService.localNotificationService
                                .showNotification(
                                    title: productModel.productName,
                                    body: productModel.productDescription,
                                    id: son);

                            context.read<NotificationViewModel>().addMessage(
                                  natificationModel: NatificationModel(
                                      name:
                                          "categoriy   Yngilandi Malumot qo'shildi",
                                      id: idContLocal),
                                );
                            idContLocal++;

                            context
                                .read<ProductsViewModel>()
                                .getProductsByCategory(productModel.categoryId);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductInfoScreen(
                                productModel1: productModel,
                              );
                            }));
                          },
                          child: ProductsItem(
                            docId: '',
                            productName: productModel.productName,
                            productDescription: productModel.productDescription,
                            price: productModel.price,
                            imageUrl: productModel.imageUrl,
                            // AppConstants.malumot==true?  productModel.storagePath :
                            categoryId: productModel.productDescription,
                          ),
                        );
                      })
                    ],
                  ),
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
