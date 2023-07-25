import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static String IS_FIRST_TIME = 'isFirstTime';
  static String IS_LOGGEDIN = 'isLoggedIn';
  static String TOKEN = 'token';
  static String MOB_NO = 'mobNo';
  static String FCM_TOKEN = 'fcmToken';
  static String DRIVER_ID = 'driverId';
  static String USER_MODEL = 'userModel';
  static String PERMISSION_MODEL = 'permissionModel';
  static String CHAT_LIST = 'chatList';
  static String MY_DOC_LIST = 'docList';
  static String NOTI_LIST = 'notiList';
  static String SETTING_LIST = 'settingList';
  static String DUTY_STATUS = 'dutyStatus';
  static String PAGES_MODEL = 'pagesModel';
  static String NOTIFICATION_STATUS = 'notificationStatus';
  static String NOTIFICATION_SOUND_STATUS = 'notificationSoundStatus';
  static String CART_MODEL = 'cartModel';

  static StorageUtil? _storageUtil;
  static SharedPreferences? _preferences;

  static Future<StorageUtil> getInstance() async {
    // keep local instance till it is fully initialized.
    var secureStorage = StorageUtil._();
    await secureStorage._init();
    _storageUtil = secureStorage;

    return _storageUtil!;
  }

  StorageUtil._();
  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> logOut() async {
    String token = getString(FCM_TOKEN);
    await _preferences!.clear();
    putString(FCM_TOKEN, token);
  }

  // get string
  static String getString(String key, {String defValue = ''}) {
    print(key + " <> getString");
    if (_preferences == null) {
      return defValue;
    }
    return _preferences!.getString(key) ?? defValue;
  }

  // put string
  static Future<bool>? putString(String key, String value) {
    // print(key + "<>" + value);
    if (_preferences == null) return null;
    print(key + "<>" + value);
    return _preferences!.setString(key, value);
  }

  // get boolean
  static bool getBoolean(String key, {bool defValue = false}) {
    print("$defValue<>");
    if (_preferences == null) return defValue;
    return _preferences!.getBool(key) ?? defValue;
  }

  // put boolean
  static Future<bool>? putBoolean(String key, bool value) {
    if (_preferences == null) return null;
    return _preferences!.setBool(key, value);
  }

  // get int
  static int getInt(String key, {int defValue = 0}) {
    print("$defValue<>");
    if (_preferences == null) return defValue;
    return _preferences!.getInt(key) ?? defValue;
  }

  // put int
  static Future<bool>? putInt(String key, int value) {
    if (_preferences == null) return null;
    return _preferences!.setInt(key, value);
  }

  // static Future<bool>? putLoginUserData(LoginModel value) {
  //   // print(key + "<>" + value);
  //   if (_preferences == null) return null;

  //   return _preferences!.setString(StorageUtil.USER_MODEL, jsonEncode(value));
  // }

  // static LoginModel getLoginUserData() {
  //   LoginModel userData = LoginModel.fromJson(
  //       jsonDecode(StorageUtil.getString(StorageUtil.USER_MODEL)));
  //   return userData;
  // }

  // static Future<bool>? storePages(PagesModel value) {
  //   // print(key + "<>" + value);
  //   if (_preferences == null) return null;
  //   return _preferences!.setString(StorageUtil.PAGES_MODEL, jsonEncode(value));
  // }

  // static PagesModel getPages() {
  //   PagesModel data = PagesModel.fromJson(
  //       jsonDecode(StorageUtil.getString(StorageUtil.PAGES_MODEL)));
  //   return data;
  // }

  // static Future<bool>? storeCartList(ProductCartModel value) {
  //   // print(key + "<>" + value);
  //   if (_preferences == null) return null;
  //   return _preferences!.setString(StorageUtil.CART_MODEL, jsonEncode(value));
  // }

  // static ProductCartModel getCartList() {
  //   ProductCartModel data = ProductCartModel.fromJson(
  //       jsonDecode(StorageUtil.getString(StorageUtil.CART_MODEL)));
  //   return data;
  // }
// ******************* STORE & GET LIST AS STRING *********************
//  StorageUtil.putString('studentData', json.encode(studData));
//
//  Iterable i = jsonDecode(StorageUtil.getString('studentData'));
//  List<StudentData> posts =
//  (i as List).map((i) => StudentData.fromJson(i)).toList();
//
//  print(posts[0].clientID.toString());
}
