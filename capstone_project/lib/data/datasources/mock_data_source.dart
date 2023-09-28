import 'dart:convert';

import 'package:mobile_flutter/data/models/mock/sales_report_mock.dart';
import 'package:mobile_flutter/utils/error/exception.dart';
import 'package:http/http.dart' as http;

abstract class MockDataSource {
  Future<ResponseSalesReportMock> fetchSalesReportMock(String timeframe);
}

class MockDataSourceImpl implements MockDataSource {
  final http.Client client;
  static const baseUrlMockApi =
      'https://b3f69fa0-bd09-4a58-aef7-f83a861d117c.mock.pstmn.io/api/v1';
  static const endpointMockSalesReport = '/sales-report?timeframe=';

  MockDataSourceImpl({required this.client});

  @override
  Future<ResponseSalesReportMock> fetchSalesReportMock(timeframe) async {
    final response = await client
        .get(Uri.parse('$baseUrlMockApi$endpointMockSalesReport$timeframe'));
    if (response.statusCode == 200) {
      dynamic result = json.decode(response.body);
      return ResponseSalesReportMock.fromJson(result);
    } else {
      throw MockServerException();
    }
  }
}
