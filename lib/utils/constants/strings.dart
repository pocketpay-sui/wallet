class Strings {
  static String appName = 'PocketPay';
  static String fontFamilyName = 'Overpass';
  static String fontGothamFamilyName = 'Gotham';

  static String createWallet = 'Create Wallet';
  static String importWallet = 'Import Wallet';
  static String availableBalance = 'Available Balance';
  static String scanQR = 'Scan The QR';
  static String send = 'Send';
  static String receive = 'Receive';
  static String copy = 'Copy';
  static String tokens = 'Tokens';
  static String nfts = 'NFT\'s';
  static String landingText =
      'PocketPay is a decentralized payment protocol designed to facilitate fast, secure, and cost-effective transactions on the Sui Blockchain.';
  static String landingText2 =
      'We are bringing lightening speed to transactions.';
  static String importText =
      'Import your existing wallet by entering the 12 word recovery phrase.';
  static String cancel = 'Cancel';
  static String back = 'Back';
  static String backupMnemonics = 'Backup Your Mnemonic';
  static String mnemonicDesc =
      'Write down the Mnemonic words in order. Save it properly.';
  static String mnemonicWords = 'Mnemonic Words';

  static String addRsSymbol(String value) {
    return value.isEmpty ? '' : '₹ $value';
  }

  static String getTrimmedAddress(String address) {
    if (address.isEmpty) {
      return '';
    }
    int strLen = address.trim().length;
    return firstChars(address) + '...' + lastChars(address, strLen);
  }

  static String lastChars(String address, int len) {
    return address.substring(len - 6);
  }

  static String firstChars(String address) {
    return address.substring(0, 6);
  }

  static String getTrimmedTransactionID(String address) {
    int strLen = address.trim().length;
    return firstCharsTXNID(address, 5) +
        '...' +
        lastCharsTXNID(address, strLen);
  }

  static String lastCharsTXNID(String address, int len) {
    return address.substring(len - 5);
  }

  static String firstCharsTXNID(String address, int len) {
    return address.substring(0, len);
  }
}
