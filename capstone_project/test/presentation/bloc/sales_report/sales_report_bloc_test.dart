import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/sales_report.dart';
import 'package:mobile_flutter/presentation/bloc/sales_report/sales_report_bloc.dart';
import 'package:mobile_flutter/utils/error/failure.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late SalesReportBloc salesReportBloc;
  late MockGetSalesReport mockGetSalesReport;

  setUp(() {
    mockGetSalesReport = MockGetSalesReport();
    salesReportBloc = SalesReportBloc(mockGetSalesReport);
  });

  group('Sales Report Bloc', () {
    const queryTimeFrame = 'daily';
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
    const salesReportEmpty = SalesReport(
      chart: <FlSpot>[],
      date: <String>[],
      mostOrdered: 'Salmon',
      sales: 10,
      totalRevenue: 10,
      newMember: 0,
    );
    test('initial state should return InitialState', () {
      expect(
        SalesReportBloc(mockGetSalesReport).state,
        InitialState(),
      );
    });

    test('FetchSalesReportQuery props should return correct values', () {
      const event = FetchSalesReportQuery(timeframe: queryTimeFrame);
      expect(event.props, [queryTimeFrame]);
    });

    blocTest<SalesReportBloc, SalesReportState>(
      'emits [LoadedState] when FetchSalesReportQuery is added and data not empty',
      build: () {
        when(mockGetSalesReport.execute(query: queryTimeFrame)).thenAnswer(
          (_) async => const Right(salesReport),
        );
        return salesReportBloc;
      },
      act: (bloc) => bloc.add(const FetchSalesReportQuery(
        timeframe: queryTimeFrame,
      )),
      expect: () => <SalesReportState>[
        LoadingState(),
        LoadedState(salesReportEntity: salesReport),
      ],
    );

    blocTest<SalesReportBloc, SalesReportState>(
      'emits [EmptyState] when FetchSalesReportQuery is added but data is empty',
      build: () {
        when(mockGetSalesReport.execute(query: queryTimeFrame)).thenAnswer(
          (_) async => const Right(salesReportEmpty),
        );
        return salesReportBloc;
      },
      act: (bloc) => bloc.add(const FetchSalesReportQuery(
        timeframe: queryTimeFrame,
      )),
      expect: () => <SalesReportState>[
        LoadingState(),
        EmptyState(),
      ],
    );

    blocTest<SalesReportBloc, SalesReportState>(
      'emits [ConnectionErrorState] when FetchSalesReportQuery is added but connection is not established',
      build: () {
        when(mockGetSalesReport.execute(query: queryTimeFrame)).thenAnswer(
          (_) async => const Left(ConnectionFailure(
            'You seem to be offline. Please check your internet connection and try again.',
          )),
        );
        return salesReportBloc;
      },
      act: (bloc) => bloc.add(const FetchSalesReportQuery(
        timeframe: queryTimeFrame,
      )),
      expect: () => <SalesReportState>[
        LoadingState(),
        ConnectionErrorState(
          message:
              'You seem to be offline. Please check your internet connection and try again.',
        ),
      ],
    );

    blocTest<SalesReportBloc, SalesReportState>(
      'emits [ErrorState] when FetchSalesReportQuery is added but failure',
      build: () {
        when(mockGetSalesReport.execute(query: queryTimeFrame)).thenAnswer(
          (_) async => const Left(MockServerFailure(
            'Response Mock Server Failure',
          )),
        );
        return salesReportBloc;
      },
      act: (bloc) => bloc.add(const FetchSalesReportQuery(
        timeframe: queryTimeFrame,
      )),
      expect: () => <SalesReportState>[
        LoadingState(),
        ErrorState(
          message: 'Response Mock Server Failure',
        ),
      ],
    );
  });
}
