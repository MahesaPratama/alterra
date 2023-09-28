// ignore_for_file: unused_local_variable
import 'dart:io';

abstract class BangunRuang {
  void ukuran() {
    int? panjang;
    int? lebar;
    int? tinggi;
  }

  void volume() {
    int? volumes;
  }
}

class Kubus extends BangunRuang {
  @override
  void volume() {
    print('Masukkan nilai sisi');
    String? sisi = stdin.readLineSync();
    int volume = int.parse(sisi!);
    int volumes = volume * volume * volume;
    print(
        'Diketahui sisi dari sebuah kubus adalah $sisi , maka Volumenya adalah $volumes');
  }
}

class Balok extends BangunRuang {
  late int input1;
  late int input2;
  late int input3;

  @override
  void ukuran() {
    print('Masukkan nilai panjang');
    String? panjang = stdin.readLineSync();
    input1 = int.parse(panjang!);
    print('Masukkan nilai lebar');
    String? lebar = stdin.readLineSync();
    input2 = int.parse(lebar!);
    print('Masukkan nilai tinggi');
    String? tinggi = stdin.readLineSync();
    input3 = int.parse(tinggi!);
  }

  @override
  void volume() {
    ukuran();
    int volumes = input1 * input2 * input3;
    print(
        'Diketahui panjang = $input1 , lebar = $input2 dan tinggi = $input3, maka Volume dari balok tersebut adalah $volumes');
  }
}

abstract class Matematika {
  void hasil() {}
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int kpk(int x, int y) {
    int max = x > y ? x : y;
    int kpk = max;
    while (true) {
      if (kpk % x == 0 && kpk % y == 0) {
        return kpk;
      }
      kpk += max;
    }
  }

  @override
  void hasil() {
    print('Masukkan nilai x');
    String? input1 = stdin.readLineSync();
    int x = int.parse(input1!);
    print('Masukkan nilai y');
    String? input2 = stdin.readLineSync();
    int y = int.parse(input2!);
    int hasil = kpk(x, y);
    print('KPK dari $x dan $y adalah $hasil');
  }
}

class FaktorPerseketuanTerbesar implements Matematika {
  int fpb(int x, int y) {
    while (y != 0) {
      int r = x % y;
      x = y;
      y = r;
    }
    return x;
  }

  @override
  void hasil() {
    print('Masukkan nilai x');
    String? input1 = stdin.readLineSync();
    int x = int.parse(input1!);
    print('Masukkan nilai y');
    String? input2 = stdin.readLineSync();
    int y = int.parse(input2!);
    int hasil = fpb(x, y);
    print('FPB dari $x dan $y adalah $hasil');
  }
}

void main() {
  print(Kubus()..volume());
  print(Balok()..volume());
  print(KelipatanPersekutuanTerkecil()..hasil());
  print(FaktorPerseketuanTerbesar()..hasil());
}
