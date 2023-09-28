// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_report_mock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseSalesReportMock _$ResponseSalesReportMockFromJson(
        Map<String, dynamic> json) =>
    ResponseSalesReportMock(
      meta: MetaMock.fromJson(json['meta'] as Map<String, dynamic>),
      data: SalesReportMock.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseSalesReportMockToJson(
        ResponseSalesReportMock instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

SalesReportMock _$SalesReportMockFromJson(Map<String, dynamic> json) =>
    SalesReportMock(
      chart: (json['chart'] as List<dynamic>)
          .map((e) => ChartMock.fromJson(e as Map<String, dynamic>))
          .toList(),
      mostOrdered: json['most_ordered'] as String?,
      sales: json['sales'] as num?,
      totalRevenue: json['total_revenue'] as num?,
      newMember: json['new_member'] as num?,
    );

Map<String, dynamic> _$SalesReportMockToJson(SalesReportMock instance) =>
    <String, dynamic>{
      'chart': instance.chart,
      'most_ordered': instance.mostOrdered,
      'sales': instance.sales,
      'total_revenue': instance.totalRevenue,
      'new_member': instance.newMember,
    };

ChartMock _$ChartMockFromJson(Map<String, dynamic> json) => ChartMock(
      date: json['date'] as String,
      price: json['price'] as num,
    );

Map<String, dynamic> _$ChartMockToJson(ChartMock instance) => <String, dynamic>{
      'date': instance.date,
      'price': instance.price,
    };
