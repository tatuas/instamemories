import 'dart:math';

class RandomStringUtils {
  final _randomChars =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  final rand = Random();

  String generate(int length) {
    final codeUnits = List.generate(
      length,
      (index) {
        final n = rand.nextInt(_randomChars.length);
        return _randomChars.codeUnitAt(n);
      },
    );
    return String.fromCharCodes(codeUnits);
  }
}
