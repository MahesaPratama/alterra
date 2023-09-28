import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/sales_report.dart';

void main() {
  group('SalesReport Entity Test', () {
    const salesReport = SalesReport(
      chart: [
        FlSpot(1, 1),
        FlSpot(2, 2),
        FlSpot(3, 3),
      ],
      date: [
        '2021-08-01',
        '2021-08-02',
        '2021-08-03',
      ],
      mostOrdered: 'Sushi',
      sales: 15000,
      totalRevenue: 50000,
      newMember: 200,
    );
    test('should have correct parameters', () {
      expect(salesReport.chart, isA<List<FlSpot>>());
      expect(salesReport.date, isA<List<String>>());
      expect(salesReport.mostOrdered, isA<String>());
      expect(salesReport.sales, isA<num>());
      expect(salesReport.totalRevenue, isA<num>());
      expect(salesReport.newMember, isA<num>());
    });

    test("should extends equatable", () {
      expect(salesReport.props, salesReport.props);
    });
  });
}
