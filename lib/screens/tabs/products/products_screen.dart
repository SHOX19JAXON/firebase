import 'package:firebase/data/models/product_model.dart';
import 'package:firebase/screens/tabs/add_product_screen/add_product_screen.dart';
import 'package:firebase/screens/tabs/products/vidget_items/product_widget.dart';
import 'package:firebase/services/local_notification_service.dart';
import 'package:firebase/utils/project_extensions.dart';
import 'package:firebase/view_models/natification.dart';
import 'package:firebase/view_models/products_view_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../data/models/natification.dart';
import '../../../utils/colors/app_colors.dart';
import '../product_info_screen/product_info_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int son = 1;

  @override
  Widget build(BuildContext context) {
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
              // context.read<ProductsViewModel>().insertProducts(
              //       ProductModel(
              //         price: 12.5,
              //         imageUrl:
              //             "https://i.ebayimg.com/images/g/IUMAAOSwZGBkTR-K/s-l400.png",
              //         productName: "Nokia 12 80",
              //         docId: "",
              //         productDescription: "productDescription",
              //         categoryId: "kcggCJzOEz7gH1LQy44x",
              //       ),
              //       context,
              //     );
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
                            NatificationModel nati = NatificationModel(
                                name: productModel.productName, id: son);
                            son++;
                            NotificationViewModel().natification.add(nati);
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
                            // "https://th.bing.com/th/id/R.7b72d0e17b496199e48ee384d8bc9f00?rik=Z33tT%2bXleUnlTQ&riu=http%3a%2f%2fwww.pngmart.com%2ffiles%2f13%2fiPhone-12-Transparent-Images-PNG.png&ehk=aPPAg%2fQyxClzsrxOfHW8sIdYC%2fSngQ9JInZsdvuxg%2bY%3d&risl=&pid=ImgRaw&r=0",
                            // https://static-assets.business.amazon.com/assets/in/24th-jan/705_Website_Blog_Appliances_1450x664.jpg.transform/1450x664/image.jpg
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
