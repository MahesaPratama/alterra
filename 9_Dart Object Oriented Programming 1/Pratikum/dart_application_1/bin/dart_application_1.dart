import 'dart:io';

class Hewan {
  var beratHewan = {'Sapi': 100, 'Kambing': 20};
}

class Mobil extends Hewan {
  int maksimumMuatan = 500;
  var muatan = {'Kuda': 80, 'kucing': 2};
  var total = 0;
  void tambahMuatan() {
    for (var value in muatan.values) {
      total += value;
    }
    if (total < maksimumMuatan) {
      muatan.addAll(beratHewan);
      print(muatan);
    } else {
      print('muatan sudah penuh');
    }
  }
}

class Calculator {
  int satu = 10;
  int dua = 15;
  void tambah() {
    print(satu + dua);
  }

  void kurang() {
    print(satu - dua);
  }

  void kali() {
    print(satu * dua);
  }

  void bagi() {
    print(satu / dua);
  }
}

class Course {
  String? judul = stdin.readLineSync();
  String? deskripsi = stdin.readLineSync();
}

class Student {
  var nama = 'Mahesa';
  String kelas = 'Flutter';
  Map kursusTersedia = {'Judul & Deskripsi': 'Flutter, MSIB BATCH 4'};
  void tambahKursus() {
    Course input = Course();
    kursusTersedia['Judul & Deskripsi'] = '${input.judul} , ${input.deskripsi}';
    print('Kursus yang tersedia: \n$kursusTersedia');
  }

  void hapusKursus() {
    String? input = stdin.readLineSync();
    kursusTersedia.removeWhere((key, value) => value == input);
    print(kursusTersedia);
  }
}

class TokoBuku {
  Map buku = {
    'Isi Buku': '\n001 \nBuku Pemograman \nAltera \n200.000 \nPemograman'
  };
  void tambah() {
    String? input = stdin.readLineSync();
    buku['Isi Buku'] = input;
    print(buku);
  }

  void hapus() {
    String? input = stdin.readLineSync();
    buku.removeWhere((key, value) => value == input);
    print(buku);
  }

  void data() {
    print(buku);
  }
}

void main(List<String> arguments) async {
  print('Menambah kursus / Menghapus Kursus / Cek Kursus');
  String? input1 = stdin.readLineSync()?.toLowerCase();
  if (input1 == 'menambah kursus') {
    Student().tambahKursus();
  } else if (input1 == 'menghapus kursus') {
    Student().hapusKursus();
  } else if (input1 == 'cek kursus') {
    print(Student().kursusTersedia);
  } else {
    print('Perintah tidak ditemukan');
  }

  print('Tambah data buku / Hapus data buku / Cek buku');
  String? input2 = stdin.readLineSync()?.toLowerCase();
  if (input2 == 'tambah data buku') {
    TokoBuku().tambah();
  } else if (input2 == 'hapus data buku') {
    TokoBuku().hapus();
  } else if (input2 == 'cek buku') {
    print(TokoBuku().buku);
  } else {
    print('Perintah tidak ditemukan');
  }
}
