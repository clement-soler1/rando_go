import 'package:encrypt/encrypt.dart';

class Security {

  static final String _seed1 = "Bg8B3qig3x";
  static final String _seed2 = "9VRi7YwfxD";

  static final Key _key = Key.fromUtf8("5FZ1EkZWp14ZAxUI4NrTdz9sGDBhTRH0");
  static final IV _iv = IV.fromUtf8("Bp02n1Kn");

  static String encrypt(String pwd) {
    Encrypter encrypter = Encrypter(Salsa20(_key));
    String saltedPwd = _seed1 + pwd + _seed2;
    return encrypter.encrypt(saltedPwd,iv: _iv).base64;
  }
}