part of 'sales_report_bloc.dart';

abstract class SalesReportState extends Equatable {}

class InitialState extends SalesReportState {
  @override
  List<Object?> get props => [];
}

class EmptyState extends SalesReportState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends SalesReportState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends SalesReportState {
  final SalesReport salesReportEntity;

  LoadedState({required this.salesReportEntity});

  @override
  List<Object?> get props => [salesReportEntity];
}

class ConnectionErrorState extends SalesReportState {
  final String message;

  ConnectionErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ErrorState extends SalesReportState {
  final String message;

  ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
