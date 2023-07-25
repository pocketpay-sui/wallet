import 'package:pocket_pay_wallet/utils/storage_secure_service.dart';
import 'package:get/get.dart';
import 'package:sui/sui.dart';

class DashboardController extends GetxController {
  RxInt selectedTabIndex = RxInt(0);
  RxInt selectedBottomTabIndex = RxInt(0);

  RxString walletMnemonc = RxString('');
  RxString suiAddress = RxString('');
  RxList<String> createWalletMnemonic = RxList.empty();
  Rxn<SuiAccount> suiAccount = Rxn<SuiAccount>();
  Rx<SuiClient> suiClient = Rx(SuiClient(Constants.testnetAPI));
  final StorageSecureService _storageSecureService = StorageSecureService();
  Future<void> generateWalletMnemonic() async {
    String mnemonic = SuiAccount.generateMnemonic();
    walletMnemonc.value = mnemonic;
    createWalletMnemonic.value = mnemonic.split(' ');
  }

  Future<void> initSui() async {
    if (walletMnemonc.value.isNotEmpty) {
      SuiAccount sui = await getSuiAccount();
      suiAccount.value = sui;
      SuiClient client = SuiClient(Constants.testnetAPI, account: sui);
      suiClient.value = client;

      print(sui.getPublicKey());
      print(sui.getAddress());
      print(sui.getSecretKey());
    }
  }

  Future<SuiAccount> getSuiAccount() async {
    String mnemoinc = walletMnemonc.value;
    // _storageSecureService.containsKeyInSecureData(key)
    return SuiAccount.fromMnemonics(mnemoinc, SignatureScheme.ED25519);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initSui();
  }
}
