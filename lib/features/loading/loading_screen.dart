import 'package:pocket_pay_wallet/features/dashboard/controller/dashboard_controller.dart';
import 'package:pocket_pay_wallet/features/dashboard/view/dashboard_feature_screen.dart';
import 'package:pocket_pay_wallet/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  DashboardController dashboardController =
      Get.isRegistered<DashboardController>()
          ? Get.find<DashboardController>()
          : Get.put(DashboardController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // dashboardController.suiAccount?.value =
      await dashboardController.initSui();

      print(dashboardController.suiAccount.value?.getPublicKey());
      print(dashboardController.suiAccount.value?.getAddress());
      print(dashboardController.suiAccount.value?.getSecretKey());
      Get.off(() => DashboardFeatureScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
        ),
      ),
    );
  }
}
