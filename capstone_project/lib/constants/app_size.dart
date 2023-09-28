part of 'constant.dart';

class Gap {
  static const w4 = SizedBox(width: 4);
  static const w8 = SizedBox(width: 8);
  static const w10 = SizedBox(width: 10);
  static const w12 = SizedBox(width: 12);
  static const w14 = SizedBox(width: 14);
  static const w16 = SizedBox(width: 16);
  static const w20 = SizedBox(width: 20);
  static const w24 = SizedBox(width: 24);
  static const w32 = SizedBox(width: 32);
  static const w48 = SizedBox(width: 48);
  static const w60 = SizedBox(width: 60);
  static const w96 = SizedBox(width: 96);

  static const h4 = SizedBox(height: 4);
  static const h8 = SizedBox(height: 8);
  static const h10 = SizedBox(height: 10);
  static const h12 = SizedBox(height: 12);
  static const h14 = SizedBox(height: 14);
  static const h16 = SizedBox(height: 16);
  static const h20 = SizedBox(height: 20);
  static const h24 = SizedBox(height: 24);
  static const h32 = SizedBox(height: 32);
  static const h48 = SizedBox(height: 48);
  static const h60 = SizedBox(height: 60);
  static const h96 = SizedBox(height: 96);

  static SizedBox customHeight(double value) {
    return SizedBox(
      height: value,
    );
  }

  static SizedBox customWidth(double value) {
    return SizedBox(
      width: value,
    );
  }
}
