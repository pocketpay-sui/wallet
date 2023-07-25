import 'package:pocket_pay_wallet/features/dashboard/controller/dashboard_controller.dart';
import 'package:pocket_pay_wallet/features/dashboard/view/dashboard_feature_screen.dart';
import 'package:pocket_pay_wallet/features/loading/loading_screen.dart';
import 'package:pocket_pay_wallet/utils/constants/colors.dart';
import 'package:pocket_pay_wallet/utils/constants/images.dart';
import 'package:pocket_pay_wallet/utils/constants/strings.dart';
import 'package:pocket_pay_wallet/utils/get_snackbar.dart';
import 'package:pocket_pay_wallet/utils/storage_secure_service.dart';
import 'package:pocket_pay_wallet/utils/utils.dart';
import 'package:pocket_pay_wallet/widgets/btn_gradient.dart';
import 'package:pocket_pay_wallet/widgets/cappbar.dart';
import 'package:pocket_pay_wallet/widgets/cbutton.dart';
import 'package:pocket_pay_wallet/widgets/ctext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CreateWallet extends StatefulWidget {
  CreateWallet({super.key});

  @override
  State<CreateWallet> createState() => _CreateWalletState();
}

class _CreateWalletState extends State<CreateWallet> {
  DashboardController dashboardController =
      Get.isRegistered<DashboardController>()
          ? Get.find<DashboardController>()
          : Get.put(DashboardController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dashboardController.generateWalletMnemonic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(
        showBackButton: true,
        title: '',
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          CText(
            text: Strings.backupMnemonics,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: 16,
          ),
          CText(
            text: Strings.mnemonicDesc,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CText(
                text: Strings.mnemonicWords,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(
                          text: dashboardController.walletMnemonc.value))
                      .then((_) {
                    SnackBarUtils.showSuccessSnackBar('Copied');
                  });
                },
                icon: Icon(
                  Icons.copy,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Obx(() {
            return GridView.builder(
              itemCount: dashboardController.createWalletMnemonic.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return BtnGradient(
                  height: 70,
                  colors: [AppColors.iconBG, AppColors.iconBG],
                  child: Center(
                      child: CText(
                          text:
                              dashboardController.createWalletMnemonic[index])),
                );
              },
            );
          }),
          SizedBox(
            height: 16,
          ),
          CButton(
            text: Strings.createWallet,
            onButtonPressed: () async {
              Utils.showProgressDia();

              await dashboardController.initSui().then((value) {
                Utils.hideProgressDia();
                Get.to(() => DashboardFeatureScreen())!
                    .then((value) => Get.back());
              });
            },
          )
        ],
      ),
    );
  }
}
