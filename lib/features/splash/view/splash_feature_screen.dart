import 'dart:async';

import 'package:pocket_pay_wallet/features/landing/view/landing_feature_screen.dart';
import 'package:pocket_pay_wallet/utils/constants/colors.dart';
import 'package:pocket_pay_wallet/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashFeatureScreen extends StatefulWidget {
  const SplashFeatureScreen({super.key});

  @override
  State<SplashFeatureScreen> createState() => _SplashFeatureScreenState();
}

class _SplashFeatureScreenState extends State<SplashFeatureScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 3), () {
      navigate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(child: SizedBox(width: 300, child: splashLogo)),
    );
  }

  Future<void> navigate() async {
    // bool isLoggedIn = StorageUtil.getBoolean(StorageUtil.IS_LOGGEDIN);
    // print('isLoggedIn $isLoggedIn ');
    // if (isLoggedIn) {
    //   if (StorageUtil.getLoginUserData().data?.flag == '1') {
    //     await Get.offAll(() => DashboadScreen());
    //   } else {
    //     await Get.offAll(() => AddProfileScreen());
    //   }
    // } else {
    Get.offAll(() => const LandingFeatureScreen());
    // }
  }
}
