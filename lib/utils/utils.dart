// import 'dart:io';

// import 'package:device_info/device_info.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:math';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class Utils {
//   static Future<String> getDevicVersionDetails() async {
//     String deviceName;
//     String deviceVersion; // get version
//     String identifier;
//     final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
//     try {
//       if (Platform.isAndroid) {
//         var build = await deviceInfoPlugin.androidInfo;
//         deviceName = build.model;
//         deviceVersion = build.version.toString();
//         identifier = build.androidId; //UUID for Android
//       } else if (Platform.isIOS) {
//         var data = await deviceInfoPlugin.iosInfo;
//         deviceName = data.name;
//         deviceVersion = data.systemVersion;
//         identifier = data.identifierForVendor; //UUID for iOS
//       }
//     } on PlatformException {
//       print('Failed to get platform version');
//     }

// //if (!mounted) return;
//     return deviceVersion;
//   }

//   static Future<String> getDeviceDetails() async {
//     String deviceName;
//     String deviceVersion;
//     String identifier;
//     final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
//     try {
//       if (Platform.isAndroid) {
//         var build = await deviceInfoPlugin.androidInfo;
//         deviceName = build.model;
//         deviceVersion = build.version.toString();
//         identifier = build.androidId; //UUID for Android
//       } else if (Platform.isIOS) {
//         var data = await deviceInfoPlugin.iosInfo;
//         deviceName = data.name;
//         deviceVersion = data.systemVersion;
//         identifier = data.identifierForVendor; //UUID for iOS
//       }
//     } on PlatformException {
//       print('Failed to get platform version');
//     }

// //if (!mounted) return;
//     return identifier;
//   }

  static String dateFormat = 'dd-MM-yyyy';

  static String getTodaysDate() {
    var now = DateTime.now();
    var formatter = DateFormat(dateFormat);
    String formattedDate = formatter.format(now);
    print(formattedDate);
    return formattedDate;
  }

  static String convertDatetimeToDate(DateTime dateTime) {
    var formatter = DateFormat(dateFormat);
    String formattedDate = formatter.format(dateTime);
    print(formattedDate);
    return formattedDate;
  }

  static String getTodaysDateYYYYMMDD() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd hh:mm:ss');
    String formattedDate = formatter.format(now);
    print(formattedDate);
    return formattedDate;
  }

  static showProgressDia({String? msg}) {
    EasyLoading.show(
      status: msg ?? 'Please Wait...',
    );
  }

  static hideProgressDia() {
    EasyLoading.dismiss();
  }

  // static makingPhoneCall(String mobNo) async {
  //   var url = Uri.parse("tel:$mobNo");
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // static String getAppStoreUrl() {
  //   final appId = Platform.isAndroid ? '' : '1529601384';
  //   final url = Uri.parse(
  //     Platform.isAndroid
  //         ? "https://play.google.com/store/apps/details?id=$appId"
  //         : "https://apps.apple.com/app/id$appId",
  //   );
  //   return url.toString();
  // }

  static String? getIdFromUrl(String url) {
    if (url.contains(' ')) {
      return null;
    }

    late final Uri uri;
    try {
      uri = Uri.parse(url);
    } catch (e) {
      return null;
    }

    if (!['https', 'http'].contains(uri.scheme)) {
      return null;
    }

    // youtube.com/watch?v=xxxxxxxxxxx
    if (['youtube.com', 'www.youtube.com', 'm.youtube.com']
            .contains(uri.host) &&
        uri.pathSegments.isNotEmpty &&
        uri.pathSegments.first == 'watch' &&
        uri.queryParameters.containsKey('v')) {
      final videoId = uri.queryParameters['v']!;
      return isValidId(videoId) ? videoId : null;
    }

    // youtu.be/xxxxxxxxxxx
    if (uri.host == 'youtu.be' && uri.pathSegments.isNotEmpty) {
      final videoId = uri.pathSegments.first;
      return isValidId(videoId) ? videoId : null;
    }

    // www.youtube.com/shorts/xxxxxxxxxxx
    // www.youtube.com/embed/xxxxxxxxxxx
    if (uri.host == 'www.youtube.com' &&
        uri.pathSegments.length == 2 &&
        ['shorts', 'embed'].contains(uri.pathSegments.first)) {
      final videoId = uri.pathSegments[1];
      return isValidId(videoId) ? videoId : null;
    }

    return null;
  }

  static bool isValidId(String id) =>
      RegExp(r'^[_\-a-zA-Z0-9]{11}$').hasMatch(id);

  static Future<String> encryptString(String input, String encryptKey) async {
    final key = encrypt.Key.fromUtf8(encryptKey);
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(input, iv: iv);
    return encrypted.base64;
  }

  static Future<String> decryptString(
      String encryptedInput, String encryptKey) async {
    final key = encrypt.Key.fromUtf8(encryptKey);
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    Uint8List bytes = base64Decode(encryptedInput);
    final encrypted = encrypt.Encrypted(bytes);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }

  static Future<String> getSecretString(String string1) async {
    // Input Device Id
    // DEVICE ID
    List ls = string1
        .replaceAll(RegExp(r'[^\w\s]+'), '')
        .replaceAll(RegExp(' '), '')
        .split(''); // replacing white spacing and special characters
    ls.shuffle(); // shuffling the device id
    var random = ls.join(''); // RANDOM ID
    var randomNumber =
        Random.secure().nextInt(999999999); // RANDOM NUMBER generate
    var randomString = generateRandomString(16); // RANDOM STRING generate
    String joinString = randomString +
        random +
        randomNumber.toString(); // JOINED ALL 3 RANDOM DATA
    List finalLS = joinString
        .replaceAll(RegExp(r'[^\w\s]+'), '')
        .replaceAll(RegExp(' '), '')
        .split(''); // replacing white spacing and special characters
    finalLS.shuffle(); // shuffling the new combined random string
    var finalString = finalLS.join('');
    int randomBreakPont = await generateRandomNumber(
        finalString.length); // generating the new number for breakevenpoint
    if (randomBreakPont < 16) {
      finalString =
          finalString.substring(randomBreakPont, randomBreakPont + 16);
    } else {
      finalString =
          finalString.substring(randomBreakPont - 16, randomBreakPont);
    }

    return finalString; // final secret key
  }

  static Future<int> generateRandomNumber(int len) async {
    Random rnd = Random();
// Define min and max value
    int min = 1, max = len;
//Getting range
    int num = min + rnd.nextInt(max - min);
    // print("$num is in the range of $min and $max");
    return num;
  }

  static String generateRandomString(int len) {
    var r = Random.secure();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }
}
