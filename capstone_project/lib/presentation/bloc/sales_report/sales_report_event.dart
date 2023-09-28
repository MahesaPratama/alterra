part of 'sales_report_bloc.dart';

abstract class SalesReportEvent extends Equatable {
  const SalesReportEvent();
}

class FetchSalesReportQuery extends SalesReportEvent {
  final String timeframe;

  const FetchSalesReportQuery({
    required this.timeframe,
  });
  @override
  List<Object?> get props => [timeframe];
}
