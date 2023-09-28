import 'package:dartz/dartz.dart';
import 'package:mobile_flutter/utils/error/failure.dart';
import 'package:mobile_flutter/domain/entities/sales_report.dart';
import 'package:mobile_flutter/domain/repositories/repository.dart';

class GetSalesReport {
  final Repository repository;

  GetSalesReport(this.repository);

  Future<Either<Failure, SalesReport>> execute({required String query}) {
    return repository.getSalesReport(query: query);
  }
}
