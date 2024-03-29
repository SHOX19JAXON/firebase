import 'package:firebase/data/models/category_model.dart';
import 'package:firebase/screens/tabs/news_screen/news_screen.dart';
import 'package:firebase/screens/tabs/products/products_screen.dart';
import 'package:firebase/screens/tabs/profile/profile_screen.dart';
import 'package:firebase/screens/tabs/push_notefication/push_screen.dart';
import 'package:firebase/utils/colors/app_colors.dart';
import 'package:firebase/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';

import '../../view_models/tab_view_model.dart';
import 'categories_screen/categories_screen.dart';
import 'notification/notification.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {


  List<Widget> screens = [
    ProductsScreen(),
    ProfileScreen(),
    PushNotificationScreen(),
    CategoriesScreen(),
    Notification1(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[context.watch<TabViewModel>().getIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor : AppColors.c_2C2C73,
        currentIndex: context.watch<TabViewModel>().getIndex,
        onTap: (newIndex) {
          context.read<TabViewModel>().changeIndex(newIndex);
        },
        items:  [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.home,),
            label: "Products",
            activeIcon: SvgPicture.asset(AppImages.home,color: Colors.black,)
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.black,),
            label: "Profile",

            activeIcon: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.dataset_outlined,color: Colors.black,),
            label: "News",
            // backgroundColor : AppColors.white,

            activeIcon: Icon(Icons.dataset_outlined,color: Colors.black,),
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.savat,color: Colors.black,),
            label: "Categories",
            // backgroundColor : AppColors.white,

            activeIcon: SvgPicture.asset(AppImages.savat,color: AppColors.black,),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.list,color: Colors.black,),
            label: "Categories",
            // backgroundColor : AppColors.black,

            activeIcon: Icon(Icons.list,color: Colors.black,)
          ),
        ],
      ),
    );
  }
}
