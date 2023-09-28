import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_flutter/data/models/mock/meta_mock.dart';
import 'package:mobile_flutter/domain/entities/sales_report.dart';

part 'sales_report_mock.g.dart';

@JsonSerializable()
class ResponseSalesReportMock extends Equatable {
  final MetaMock meta;
  final SalesReportMock data;

  const ResponseSalesReportMock({
    required this.meta,
    required this.data,
  });

  factory ResponseSalesReportMock.fromJson(Map<String, dynamic> json) =>
      _$ResponseSalesReportMockFromJson(json);

  SalesReport toEntity() {
    List<FlSpot> spots = [];
    List<String> date = [];
    for (int i = 0; i < data.chart.length; i++) {
      spots.add(FlSpot(i.toDouble(), data.chart[i].price.toDouble()));
      date.add(data.chart[i].date);
    }
    return SalesReport(
      chart: spots,
      date: date,
      mostOrdered: data.mostOrdered ?? '-',
      sales: data.sales ?? 0,
      totalRevenue: data.totalRevenue ?? 0,
      newMember: data.newMember ?? 0,
    );
  }

  @override
  List<Object> get props => [
        meta,
        data,
      ];
}

@JsonSerializable()
class SalesReportMock extends Equatable {
  final List<ChartMock> chart;
  @JsonKey(name: 'most_ordered')
  final String? mostOrdered;
  final num? sales;
  @JsonKey(name: 'total_revenue')
  final num? totalRevenue;
  @JsonKey(name: 'new_member')
  final num? newMember;

  const SalesReportMock({
    required this.chart,
    this.mostOrdered,
    this.sales,
    this.totalRevenue,
    this.newMember,
  });

  factory SalesReportMock.fromJson(Map<String, dynamic> json) =>
      _$SalesReportMockFromJson(json);

  @override
  List<Object?> get props => [
        chart,
        mostOrdered,
        sales,
        totalRevenue,
        newMember,
      ];
}

@JsonSerializable()
class ChartMock extends Equatable {
  final String date;
  final num price;

  const ChartMock({
    required this.date,
    required this.price,
  });

  factory ChartMock.fromJson(Map<String, dynamic> json) =>
      _$ChartMockFromJson(json);

  @override
  List<Object> get props => [
        date,
        price,
      ];
}
