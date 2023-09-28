import 'dart:io';

class Perulangan {
  void percabangan() {
    print('Masukkan Nilai');
    String? input = stdin.readLineSync();
    int nilai = int.parse(input!);
    if (nilai > 70) {
      print('Nilai A');
    } else if (nilai > 40) {
      print('Nilai B');
    } else if (nilai > 0) {
      print('Nilai C');
    } else {}
  }

  void looping() {
    int i = 1;
    for (i; i <= 10; i++) {
      print('Nilai ke $i');
    }
  }

  void pyramid() {
    int baris = 8;
    int space = baris - 1;
    int bintang = 1;
    for (int i = 1; i <= baris; i++) {
      for (int j = 1; j <= space; j++) {
        stdout.write(' ');
      }
      for (int k = 1; k <= bintang; k++) {
        stdout.write('* ');
      }
      space--;
      bintang += 2;
      stdout.write('\n');
    }
  }

  void jamPasir() {
    int a, b, c, d = 11;
    for (a = 0; a <= d - 1; a++) {
      for (b = 0; b < a; b++) {
        stdout.write(" ");
      }
      for (c = a; c <= d - 1; c++) {
        stdout.write("0" " ");
      }
      stdout.writeln("");
    }
    for (a = d - 1; a >= 0; a--) {
      for (b = 0; b < a; b++) {
        stdout.write(" ");
      }
      for (c = a; c <= d - 1; c++) {
        stdout.write("0" " ");
      }
      stdout.writeln("");
    }
  }

  void faktorial() {
    int nilaiA = 10;
    int hasil1 = 1;
    for (int a = 1; a <= nilaiA; a++) {
      hasil1 *= a;
    }
    print('Faktorial dari 10 adalah : $hasil1');

    int nilaiB = 40;
    int hasil2 = 1;
    for (int b = 1; b <= nilaiB; b++) {
      hasil2 *= b;
    }
    print('Faktorial dari 40 adalah : $hasil2');

    int nilaiC = 50;
    int hasil3 = 1;
    for (int c = 1; c <= nilaiC; c++) {
      hasil3 *= c;
    }
    print('Faktorial dari 50 adalah : $hasil3');
  }

  void luasLingkaran() {
    double phi = 3.14;
    print('Masukkan nilai r');
    String? input = stdin.readLineSync();
    int r = int.parse(input!);
    num hasil = phi * r * r;
    print('Diketahui r = 20, maka luas lingkarannya adalah $hasil');
  }
}

void main(List<String> arguments) {
  // ignore: unused_local_variable
  Perulangan isi = Perulangan()
    ..percabangan()
    ..looping()
    ..pyramid()
    ..jamPasir()
    ..faktorial()
    ..luasLingkaran();
}
