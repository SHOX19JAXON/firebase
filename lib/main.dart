import 'package:firebase/screens/permissions/permissions_screen.dart';
import 'package:firebase/services/local_notification_service.dart';
import 'package:firebase/view_models/category_view_model.dart';
import 'package:firebase/view_models/image_view_model.dart';
import 'package:firebase/view_models/login_view_model.dart';

import 'package:firebase/screens/routes.dart';
import 'package:firebase/view_models/natification.dart';
import 'package:firebase/view_models/newes_view_model.dart';
import 'package:firebase/view_models/products_view_model.dart';
import 'package:firebase/view_models/tab_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'services/firebase_options.dart';
Future<void>onBackgroundMessageHandler(RemoteMessage message ) async{
  debugPrint("BACKGROUND MODEDA PUSH NOTIFICATION KELDI:${message.notification!.title}");
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage((onBackgroundMessageHandler));

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TabViewModel()),
      ChangeNotifierProvider(create: (_) => auth_view_model()),
      ChangeNotifierProvider(create: (_) => CategoriesViewModel()),
      ChangeNotifierProvider(create: (_) => ProductsViewModel()),
      ChangeNotifierProvider(create: (_) => NotificationViewModel()),
      ChangeNotifierProvider(create: (_) => NewsViewModel()),
      ChangeNotifierProvider(create: (_) => ImageViewModel()),
    ],
    child:  MyApp(),
  ));
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {

    LocalNotificationService.localNotificationService.init(navigatorKey);
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          // home : PermissionsScreen(),
          navigatorKey: navigatorKey,
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
