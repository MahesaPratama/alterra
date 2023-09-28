// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

Future fungsiSatu() async {
  List<int> data = [1, 2, 3, 4, 5];
  List<int> pengali = [6, 7, 8, 9, 10];
  List<int> jumlah = [];
  await Future.forEach(data, (data) async {
    await Future.delayed(Duration(seconds: 2), () {
      print(data);
    });
  });
  for (int i = 0; i < data.length; i++) {
    jumlah.add(data[i] * pengali[i]);
  }
  print(jumlah);
}

Future fungsiDua() async {
  List<dynamic> dua = [
    ['Mahesa', 'Pratama'],
    [20, 'Tahun']
  ];
  var tiga = {'Nama': dua[0], 'Umur': dua[1]};
  print(tiga);

  List<int> nilai = [7, 5, 3, 5, 2, 1];
  int rataRata = 0;
  for (int i = 0; i < nilai.length; i++) {
    rataRata += nilai[i];
  }
  num pembulatan = rataRata / nilai.length;
  print(pembulatan.ceil());

  int nilaiF = 5;
  int hasil = 1;
  await Future.delayed(Duration(seconds: 3), () {
    for (int a = 1; a <= nilaiF; a++) {
      hasil *= a;
    }
    print('Faktorial dari 5 adalah : $hasil');
  });
}

void eksplorasi() {
  List dataSama = [
    'amuse',
    'tommy',
    'kaira',
    'spoon',
    'HKS',
    'litchfield',
    'amuse',
    'HKS'
  ];
  var dataSama2 = dataSama.toSet().toList();
  print(dataSama2);

  List banyakData = [
    'js',
    'js',
    'js',
    'golang',
    'python',
    'js',
    'js',
    'golang',
    'rust'
  ];
  var kelompok = groupBy(banyakData, (item) => item);
  var banyaknya = kelompok.map((key, value) => MapEntry(key, value.length));
  print(banyaknya);
}

void main(List<String> arguments) async {
  await fungsiSatu();
  await fungsiDua();
  eksplorasi();
}
