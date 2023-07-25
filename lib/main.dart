import 'package:pocket_pay_wallet/features/splash/view/splash_feature_screen.dart';
import 'package:pocket_pay_wallet/utils/constants/colors.dart';
import 'package:pocket_pay_wallet/utils/constants/strings.dart';
import 'package:pocket_pay_wallet/utils/storage_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeftWithFade,
      builder: EasyLoading.init(),
      theme: ThemeData(
          primaryColor: AppColors.colorPrimary,
          colorScheme: ThemeData().colorScheme.copyWith(
              primary: AppColors.colorPrimary,
              secondary: AppColors.colorAccent),
          appBarTheme: AppBarTheme(
              color: AppColors.colorPrimary,
              iconTheme: IconThemeData(color: AppColors.colorAccent),
              titleTextStyle: TextStyle(
                  fontFamily: Strings.fontFamilyName,
                  color: AppColors.colorAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
      home: const SplashFeatureScreen(),
    );
  }
}
