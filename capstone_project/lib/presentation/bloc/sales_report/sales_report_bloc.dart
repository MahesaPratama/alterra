import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/domain/usecases/get_sales_report.dart';
import 'package:mobile_flutter/utils/error/failure.dart';
import 'package:mobile_flutter/domain/entities/sales_report.dart';

part 'sales_report_event.dart';
part 'sales_report_state.dart';

class SalesReportBloc extends Bloc<SalesReportEvent, SalesReportState> {
  final GetSalesReport getSalesReport;
  SalesReportBloc(
    this.getSalesReport,
  ) : super(InitialState()) {
    on<FetchSalesReportQuery>((event, emit) async {
      emit(LoadingState());
      final result = await getSalesReport.execute(query: event.timeframe);
      result.fold((failure) {
        if (failure is ConnectionFailure) {
          emit(ConnectionErrorState(message: failure.message));
        } else {
          emit(ErrorState(message: failure.message));
        }
      }, (data) {
        if (data.chart.isEmpty) {
          emit(EmptyState());
        } else {
          emit(LoadedState(salesReportEntity: data));
        }
      });
    });
  }
}
