import 'package:pocket_pay_wallet/features/dashboard/view/dashboard_feature_screen.dart';
import 'package:pocket_pay_wallet/utils/constants/colors.dart';
import 'package:pocket_pay_wallet/utils/constants/images.dart';
import 'package:pocket_pay_wallet/utils/constants/strings.dart';
import 'package:pocket_pay_wallet/widgets/cappbar.dart';
import 'package:pocket_pay_wallet/widgets/cbutton.dart';
import 'package:pocket_pay_wallet/widgets/ctext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImportWalletScreen extends StatelessWidget {
  const ImportWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(
        showBackButton: true,
        title: '',
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 24, right: 24),
        children: [
          // Image.asset(
          //   logoImagePath,
          //   width: 300,
          // ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 24,
            ),
            child: CText(
              text: Strings.importText,
              fontSize: 16,
              textAlign: TextAlign.center,
            ),
          ),
          TextField(
            cursorColor: AppColors.white,
            style: TextStyle(
                color: AppColors.white, fontFamily: Strings.fontFamilyName),
            maxLines: 4,
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.iconBG,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(
            height: 16,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     CButton(
          //       onButtonPressed: () {
          //         Get.back();
          //       },
          //       text: Strings.back,
          //       fontSize: 16,
          //       btnColor: [AppColors.iconBG, AppColors.iconBG],
          //       width: Get.width * 0.3,
          //     ),
          //     CButton(
          //         onButtonPressed: () {
          //           Get.to(() => DashboardFeatureScreen());
          //         },
          //         fontSize: 16,
          //         text: Strings.importWallet,
          //         width: Get.width * 0.3),
          //   ],
          // ),
          CButton(
            onButtonPressed: () {
              Get.to(() => DashboardFeatureScreen());
            },
            fontSize: 16,
            text: Strings.importWallet,
          ),
        ],
      ),
    );
  }
}
