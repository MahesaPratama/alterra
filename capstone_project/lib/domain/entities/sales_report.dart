import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';

class SalesReport extends Equatable {
  final List<FlSpot> chart;
  final List<String> date;
  final String mostOrdered;
  final num sales;
  final num totalRevenue;
  final num newMember;

  const SalesReport({
    required this.chart,
    required this.date,
    required this.mostOrdered,
    required this.sales,
    required this.totalRevenue,
    required this.newMember,
  });
  @override
  List<Object> get props => [
        chart,
        date,
        mostOrdered,
        sales,
        totalRevenue,
        newMember,
      ];
}
