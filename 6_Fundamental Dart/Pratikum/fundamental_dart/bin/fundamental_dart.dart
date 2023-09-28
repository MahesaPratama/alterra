import 'dart:io';

class Rumus {
  void luasPersegi() {
    print('Masukkan Nilai s');
    String? input = stdin.readLineSync();
    int s = int.parse(input!);
    int hasil = s * s;
    print('Diketahui sisi persegi adalah $s maka Luas Persegi adalah $hasil');
  }

  void kelilingPersegi() {
    print('Masukkan Nilai s');
    String? input = stdin.readLineSync();
    int s = int.parse(input!);
    int hasil = 4 * s;
    print(
        'Diketahui sisi persegi adalah $s maka Keliling Persegi adalah $hasil');
  }

  void luasPersegiPanjang() {
    print('Masukkan Nilai p');
    String? input1 = stdin.readLineSync();
    int p = int.parse(input1!);
    print('Masukkan Nilai l');
    String? input2 = stdin.readLineSync();
    int l = int.parse(input2!);
    int hasil = p * l;
    print('Diketahui P = $p & L = $l maka Luas Persegi Panjang adalah $hasil');
  }

  void kelilingPersegiPanjang() {
    print('Masukkan Nilai p');
    String? input1 = stdin.readLineSync();
    int p = int.parse(input1!);
    print('Masukkan Nilai l');
    String? input2 = stdin.readLineSync();
    int l = int.parse(input2!);
    int hasil = 2 * (p + l);
    print(
        'Diketahui P = $p & L = $l maka Keliling Persegi Panjang adalah $hasil');
  }

  void kelilingLingkaran() {
    double phi = 3.14;
    print('Masukkan nilai d');
    String? input = stdin.readLineSync();
    int d = int.parse(input!);
    num hasil = phi * d;
    print('Diketahui d = $d maka Keliling Lingkaran adalah $hasil');
  }

  void luasLingkaran() {
    double phi = 3.14;
    print('Masukkan nilai r');
    String? input = stdin.readLineSync();
    int r = int.parse(input!);
    num hasil = phi * r * r;
    print('Diketahui r = $r maka Luas Lingkaran adalah $hasil');
  }

  void volumeTabung() {
    print('Masukkan nilai r');
    String? input1 = stdin.readLineSync();
    int r = int.parse(input1!);
    double phi = 3.14;
    print('Masukkan nilai t');
    String? input2 = stdin.readLineSync();
    int t = int.parse(input2!);
    num hasil = phi * r * r * t;
    print('Diketahui r = $r & t = $t maka volume tabung adalah adalah $hasil');
  }

  void variabel() {
    String a = 'Basic';
    String b = ' Dart';
    String c = ' Programming';
    print(a + b + c);
  }

  void palindrom() {
    var a = 'kasur rusak';
    var b = a.split('').reversed.join();
    if (a == b) {
      print('kasur rusak adalah Polindrom');
    } else if (a != b) {
      print('kasur rusak Bukan Polindrom');
    }

    var c = 'mobil balap';
    var d = c.split('').reversed.join();
    if (c == d) {
      print('mobil balap adalah Polindrom');
    } else if (c != d) {
      print('mobil balap bukan Polindrom');
    }
  }

  void faktor() {
    int nilai = 24;
    for (int i = 1; i <= nilai; ++i) {
      if (nilai % i == 0) {
        print(i);
      }
    }
  }
}

void main(List<String> arguments) {
  Rumus persegi = Rumus()
    ..luasPersegi()
    ..kelilingPersegi()
    ..luasPersegiPanjang()
    ..kelilingPersegiPanjang()
    ..kelilingLingkaran()
    ..luasLingkaran()
    ..variabel()
    ..volumeTabung()
    ..palindrom()
    ..faktor();
  print(persegi);
}
