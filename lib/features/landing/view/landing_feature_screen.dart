import 'package:pocket_pay_wallet/features/create_wallet/view/create_wallet.dart';
import 'package:pocket_pay_wallet/features/dashboard/view/dashboard_feature_screen.dart';
import 'package:pocket_pay_wallet/features/import_wallet/view/import_wallet_screen.dart';
import 'package:pocket_pay_wallet/utils/constants/colors.dart';
import 'package:pocket_pay_wallet/utils/constants/images.dart';
import 'package:pocket_pay_wallet/utils/constants/strings.dart';
import 'package:pocket_pay_wallet/widgets/cbutton.dart';
import 'package:pocket_pay_wallet/widgets/ctext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LandingFeatureScreen extends StatelessWidget {
  const LandingFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacer(),
            Image.asset(
              ppayLandscapePath,
              width: 300,
            ),
            SizedBox(
              height: 48,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24),
              child: CText(
                text: Strings.landingText,
                fontSize: 16,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24),
              child: CText(
                text: Strings.landingText2,
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            CButton(
              onButtonPressed: () {
                Get.to(() => CreateWallet());
              },
              text: Strings.createWallet,
              width: Get.width * 0.7,
            ),
            CButton(
                onButtonPressed: () {
                  Get.to(() => ImportWalletScreen());
                },
                text: Strings.importWallet,
                width: Get.width * 0.7)
          ],
        ),
      ),
    );
  }
}
