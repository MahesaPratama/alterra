import 'dart:io';

import 'package:mobile_flutter/data/datasources/local_data_souce.dart';
import 'package:mobile_flutter/data/datasources/remote_data_source.dart';
import 'package:mobile_flutter/data/models/api/post/checkout_model.dart';
import 'package:mobile_flutter/data/models/api/post/membership_model.dart';
import 'package:mobile_flutter/data/models/api/post/user_model.dart';
import 'package:mobile_flutter/domain/entities/membership.dart';

import 'package:mobile_flutter/domain/entities/product.dart';
import 'package:mobile_flutter/domain/entities/product_category.dart';
import 'package:mobile_flutter/domain/entities/user_checkout.dart';
import 'package:mobile_flutter/domain/entities/user_login.dart';
import 'package:mobile_flutter/utils/error/exception.dart';
import 'package:mobile_flutter/domain/entities/sales_report.dart';
import 'package:mobile_flutter/utils/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mobile_flutter/data/datasources/mock_data_source.dart';
import 'package:mobile_flutter/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  final MockDataSource mockDataSource;
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({
    required this.localDataSource,
    required this.mockDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, SalesReport>> getSalesReport(
      {required String query}) async {
    try {
      final result = await mockDataSource.fetchSalesReportMock(query);
      return Right(result.toEntity());
    } on MockServerException {
      return const Left(MockServerFailure('Mock Server Failure'));
    } on SocketException {
      return const Left(
        ConnectionFailure(
          'You seem to be offline. Please check your internet connection and try again.',
        ),
      );
    }
  }

  @override
  Future<bool> getStatusOnboarding() async {
    final result = await localDataSource.getStatusOnboarding();
    return result;
  }

  @override
  Future<bool> setStatusOnboarding(bool status) async {
    final result = await localDataSource.setStatusOnboarding(status);
    return result;
  }

  @override
  Future<Either<Failure, UserLogin>> getUserLocal() async {
    try {
      final userLocal = await localDataSource.getUserLogin();
      return Right(userLocal.toEntity());
    } on DatabaseException {
      return const Left(DatabaseFailure('Failed to get data from database'));
    }
  }

  @override
  Future<Either<Failure, String>> getUserToken() async {
    try {
      final result = await localDataSource.getUserToken();
      return Right(result);
    } on DatabaseException {
      return const Left(DatabaseFailure('Failed to get data from database'));
    }
  }

  @override
  Future<bool> postLogout() async {
    final result = await localDataSource.clearSharedPreferences();
    return result;
  }

  @override
  Future<Either<Failure, String>> postLogin(
      {required UserLogin userLogin}) async {
    try {
      final userModel = UserModel.fromEntity(userLogin);
      final result = await remoteDataSource.postLogin(userModel: userModel);
      await localDataSource.setUserLogin(userModel: userModel);
      await localDataSource.setUserToken(token: result);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(
          'You seem to be offline. Please check your internet connection and try again.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductCategory>>> getProductCategory(
      {required String token}) async {
    try {
      final result = await remoteDataSource.getCategory(token: token);
      return Right(result.map((model) => model.toEntity()).toList());
    } on TokenException catch (e) {
      return Left(TokenFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(
          'You seem to be offline. Please check your internet connection and try again.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductByCategory({
    required String token,
    required String categoryName,
  }) async {
    try {
      final result = await remoteDataSource.getProductByCategory(
        token: token,
        category: categoryName,
      );
      return Right(result.map((model) => model.toEntity()).toList());
    } on TokenException catch (e) {
      return Left(TokenFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(
          'You seem to be offline. Please check your internet connection and try again.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> postCheckout({
    required String token,
    required UserCheckout userCheckout,
  }) async {
    try {
      final checkoutModel = CheckoutModel.fromEntity(userCheckout);
      final result = await remoteDataSource.postCheckout(
        token: token,
        checkoutModel: checkoutModel,
      );
      return Right(result);
    } on TokenException catch (e) {
      return Left(TokenFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(
          'You seem to be offline. Please check your internet connection and try again.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> postMembership(
      {required String token, required Membership membership}) async {
    try {
      final membershipModel = MembershipModel.fromEntity(membership);
      final result = await remoteDataSource.postMembership(
        token: token,
        membershipModel: membershipModel,
      );
      return Right(result);
    } on TokenException catch (e) {
      return Left(TokenFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(
          'You seem to be offline. Please check your internet connection and try again.',
        ),
      );
    }
  }
}
