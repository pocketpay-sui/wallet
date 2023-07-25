import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

var imagePath = 'assets/images/';

// var orderSuccessZip = '${imagePath}lottie/order_success.zip';
// var orderFailedZip = '${imagePath}lottie/order_failed.zip';
// var orderSuccess = '${imagePath}lottie/success.json';
// var orderFailed = '${imagePath}lottie/wrong.json';

var appLogo = '${imagePath}splash_image.png';
var ppayLandscapePath = '${imagePath}ppay_landscap_light.png';
var copyImagePath = '${imagePath}copy.svg';
var cartImagePath = '${imagePath}cart.svg';
var filterImagePath = '${imagePath}filter.svg';
var historyImagePath = '${imagePath}history.svg';
var receiveCircleImagePath = '${imagePath}receive_circle.svg';
var scanQRPath = '${imagePath}scan_qr.svg';
var sendArrowImagePath = '${imagePath}send_arrow.svg';
var sendCircleImagePath = '${imagePath}send_circle.svg';
var settingImagePath = '${imagePath}setting.svg';
var walletImagePath = '${imagePath}wallet.svg';
var logoImagePath = '${imagePath}logo.png';

// Images
Image splashLogo = Image.asset(ppayLandscapePath);

Widget loadSVG(String filePath) {
  return SvgPicture.asset(filePath);
}

//
// Widget circleImage(double height, double width, String imageUrl) {
//   return CachedNetworkImage(
//     imageUrl: imageUrl,
//     imageBuilder: (context, imageProvider) => Container(
//       height: height,
//       width: width,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(50)),
//         image: DecorationImage(
//           image: imageProvider,
//           fit: BoxFit.cover,
//         ),
//       ),
//     ),
//     placeholder: (context, url) => placeHolder(height, width),
//     errorWidget: (context, url, error) => errorWidget(height, width),
//   );
// }
//
// Widget showImage(double height, double width, String imageUrl) {
//   return CachedNetworkImage(
//     imageUrl: imageUrl,
//     imageBuilder: (context, imageProvider) => Container(
//       height: height,
//       width: width,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: imageProvider,
//           fit: BoxFit.cover,
//         ),
//       ),
//     ),
//     placeholder: (context, url) => placeHolder(height, width),
//     errorWidget: (context, url, error) => errorWidget(height, width),
//   );
// }

Widget errorWidget(double height, double width) {
  return Container(
      height: height, width: width, child: const Icon(Icons.error_outline));
}

Widget placeHolder(double height, double width) {
  return Container(
    height: height,
    width: width,
    child: const Center(
      child: SizedBox(
        child: CircularProgressIndicator(),
        height: 10.0,
        width: 10.0,
      ),
    ),
  );
}
