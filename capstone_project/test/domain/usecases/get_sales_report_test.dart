import 'package:dartz/dartz.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/sales_report.dart';
import 'package:mobile_flutter/domain/usecases/get_sales_report.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetSalesReport getSalesReport;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    getSalesReport = GetSalesReport(mockRepository);
  });

  group('Get Sales Report Usecase Test', () {
    const query = 'daily';
    const salesReport = SalesReport(
      chart: [
        FlSpot(1, 2),
        FlSpot(2, 1),
      ],
      date: <String>[],
      mostOrdered: 'Salmon',
      sales: 10,
      totalRevenue: 10,
      newMember: 0,
    );
    test('should get sales report from repository', () async {
      when(mockRepository.getSalesReport(
        query: query,
      )).thenAnswer((_) async => const Right(salesReport));
      final result = await getSalesReport.execute(
        query: query,
      );
      expect(result, const Right(salesReport));
    });
  });
}
