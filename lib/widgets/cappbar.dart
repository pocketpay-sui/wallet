import 'package:pocket_pay_wallet/utils/constants/colors.dart';
import 'package:pocket_pay_wallet/utils/constants/strings.dart';
import 'package:pocket_pay_wallet/widgets/ctext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double height;
  final List<Widget>? actionWidgets;
  final bool showBackButton;

  CustomAppBar(
      {this.height = kToolbarHeight,
      this.title,
      this.actionWidgets,
      this.showBackButton = false});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.keyboard_backspace,
                color: AppColors.white,
              ))
          : avtarImage(),
      leadingWidth: 60,
      automaticallyImplyLeading: false,
      title: CText(
        text: title ?? Strings.appName,
        color: AppColors.white,
        fontSize: 18,
      ),
      centerTitle: false,
      actions: actionWidgets,
    );
  }
}

Widget avtarImage() {
  return IconButton(
    onPressed: () {},
    icon: Container(
      margin: EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        image: DecorationImage(
          image: NetworkImage(
              'https://img.freepik.com/free-vector/hand-drawn-nft-style-ape-illustration_23-2149622021.jpg?w=2000'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),
      ),
    ),
  );
}
