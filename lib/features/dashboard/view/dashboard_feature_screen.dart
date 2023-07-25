import 'package:pocket_pay_wallet/features/dashboard/controller/dashboard_controller.dart';
import 'package:pocket_pay_wallet/utils/constants/colors.dart';
import 'package:pocket_pay_wallet/utils/constants/images.dart';
import 'package:pocket_pay_wallet/utils/constants/strings.dart';
import 'package:pocket_pay_wallet/widgets/btn_gradient.dart';
import 'package:pocket_pay_wallet/widgets/cappbar.dart';
import 'package:pocket_pay_wallet/widgets/ctext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sui/sui_account.dart';

class DashboardFeatureScreen extends StatelessWidget {
  DashboardFeatureScreen({super.key});

  DashboardController dashboardController =
      Get.isRegistered<DashboardController>()
          ? Get.find<DashboardController>()
          : Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: CustomAppBar(
          actionWidgets: [
            IconButton(onPressed: () {}, icon: loadSVG(historyImagePath))
          ],
        ),
        body: Obx(() {
          return dashboardController.selectedBottomTabIndex.value == 0
              ? WalletTab()
              : dashboardController.selectedBottomTabIndex.value == 1
                  ? NFTTab()
                  : SettingTab();
        }),
        bottomNavigationBar: BottomTab());
  }
}

class BottomTab extends StatelessWidget {
  DashboardController dashboardController =
      Get.isRegistered<DashboardController>()
          ? Get.find<DashboardController>()
          : Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BtnGradient(
            height: 50,
            width: 100,
            colors: dashboardController.selectedBottomTabIndex.value == 0
                ? [AppColors.colorAccent, AppColors.colorAccentLight]
                : [AppColors.iconBG, AppColors.iconBG],
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: loadSVG(walletImagePath),
              onPressed: () {
                dashboardController.selectedBottomTabIndex.value = 0;
              },
            ),
          ),
          BtnGradient(
            height: 50,
            width: 100,
            colors: dashboardController.selectedBottomTabIndex.value == 1
                ? [AppColors.colorAccent, AppColors.colorAccentLight]
                : [AppColors.iconBG, AppColors.iconBG],
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: loadSVG(cartImagePath),
              onPressed: () {
                dashboardController.selectedBottomTabIndex.value = 1;
              },
            ),
          ),
          BtnGradient(
            height: 50,
            width: 100,
            colors: dashboardController.selectedBottomTabIndex.value == 2
                ? [AppColors.colorAccent, AppColors.colorAccentLight]
                : [AppColors.iconBG, AppColors.iconBG],
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: loadSVG(settingImagePath),
              onPressed: () {
                dashboardController.selectedBottomTabIndex.value = 2;
              },
            ),
          )
        ],
      );
    });
  }
}

class Tokens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            leading: BtnGradient(
                height: 40,
                width: 40,
                colors: [AppColors.iconBG, AppColors.iconBG],
                child: Icon(
                  Icons.abc,
                  color: Colors.white,
                )),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CText(
                  text: 'SUI',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                CText(
                  text: '103.22 USDT',
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 8,
          );
        },
        itemCount: 4);
  }
}

class WalletTab extends StatefulWidget {
  @override
  State<WalletTab> createState() => _WalletTabState();
}

class _WalletTabState extends State<WalletTab> {
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
      // await dashboardController.initSui();
      dashboardController.suiAddress.value =
          dashboardController.suiAccount.value?.getAddress() ?? '';
      print(dashboardController.suiAccount.value?.getPublicKey());
      print(dashboardController.suiAccount.value?.getAddress());
      print(dashboardController.suiAccount.value?.getSecretKey());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          // CText(text: dashboardController.walletMnemonc.value),
          // CText(text: dashboardController.suiAddress.value),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 16, left: 16),
            child: Row(
              children: [
                Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CText(
                          text: Strings.availableBalance,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        CText(
                          text: '10000',
                          fontWeight: FontWeight.w700,
                          fontSize: 36,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CText(
                              text: Strings.getTrimmedAddress(
                                  dashboardController.suiAddress.value),
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            BtnGradient(
                              height: 20,
                              width: 70,
                              cornerRadius: 5,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CText(
                                    text: Strings.copy,
                                    fontSize: 10,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  loadSVG(copyImagePath),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CText(text: Strings.scanQR),
                        const SizedBox(
                          height: 10,
                        ),
                        loadSVG(scanQRPath),
                      ],
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, right: 16, left: 16, bottom: 16),
            child: Row(
              children: [
                SizedBox(
                  width: Get.width * 0.07,
                ),
                Expanded(
                  child: BtnGradient(
                    height: 75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        loadSVG(sendCircleImagePath),
                        const SizedBox(
                          height: 5,
                        ),
                        CText(text: Strings.send)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.1,
                ),
                Expanded(
                  child: BtnGradient(
                    height: 75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        loadSVG(receiveCircleImagePath),
                        const SizedBox(
                          height: 5,
                        ),
                        CText(text: Strings.receive)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.07,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Obx(() {
              return Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              dashboardController.selectedTabIndex.value = 0;
                            },
                            child: CText(
                              text: Strings.tokens,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            )),
                        dashboardController.selectedTabIndex.value == 0
                            ? BtnGradient(
                                height: 2,
                              )
                            : const Divider(
                                height: 2,
                                color: Colors.grey,
                              )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              dashboardController.selectedTabIndex.value = 1;
                            },
                            child: CText(
                              text: Strings.nfts,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            )),
                        dashboardController.selectedTabIndex.value == 1
                            ? BtnGradient(
                                height: 2,
                              )
                            : const Divider(
                                height: 2,
                                color: Colors.grey,
                              )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () {}, icon: loadSVG(filterImagePath)),
                  )
                ],
              );
            }),
          ),
          Tokens(),
        ],
      );
    });
  }
}

class NFTTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}

class SettingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}
