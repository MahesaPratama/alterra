import 'dart:convert';

import 'package:mobile_flutter/data/models/api/category_model.dart';
import 'package:mobile_flutter/data/models/api/post/checkout_model.dart';
import 'package:mobile_flutter/data/models/api/post/membership_model.dart';
import 'package:mobile_flutter/data/models/api/post/user_model.dart';
import 'package:mobile_flutter/data/models/api/product_model.dart';
import 'package:mobile_flutter/data/models/api/response/category_response.dart';
import 'package:mobile_flutter/data/models/api/response/checkout_response.dart';
import 'package:mobile_flutter/data/models/api/response/login_response.dart';
import 'package:mobile_flutter/data/models/api/response/membership_response.dart';
import 'package:mobile_flutter/data/models/api/response/product_response.dart';
import 'package:mobile_flutter/utils/error/exception.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<String> postLogin({required UserModel userModel});
  Future<List<CategoryModel>> getCategory({required String token});
  Future<List<ProductModel>> getProductByCategory({
    required String token,
    required String category,
  });
  Future<String> postCheckout({
    required String token,
    required CheckoutModel checkoutModel,
  });
  Future<String> postMembership({
    required String token,
    required MembershipModel membershipModel,
  });
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  static const baseRemoteUrl = 'http://128.199.206.32:8000/api/v1';
  static const endpointlogin = '/cashier/login';
  static const endpointCategory = '/cashier/order/category';
  static const endpointProductByCategory = '/cashier/order?category';
  static const endpointCheckout = '/cashier/checkout';
  static const endpointMembership = '/cashier/membership';

  RemoteDataSourceImpl({required this.client});

  @override
  Future<String> postLogin({required UserModel userModel}) async {
    final body = userModel.toJson();

    final response = await client.post(
      Uri.parse('$baseRemoteUrl$endpointlogin'),
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
      },
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      dynamic result = json.decode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(result);
      return loginResponse.data!.token;
    } else {
      dynamic result = json.decode(response.body);
      LoginResponse responseLogin = LoginResponse.fromJson(result);
      throw ServerException(
          message: responseLogin.meta?.message ?? 'Server Exception');
    }
  }

  @override
  Future<List<CategoryModel>> getCategory({required String token}) async {
    final response = await client.get(
      Uri.parse('$baseRemoteUrl$endpointCategory'),
      headers: {
        "Authorization": token,
      },
    );
    if (response.statusCode == 200) {
      dynamic result = json.decode(response.body);
      CategoryResponse categoryResponse = CategoryResponse.fromJson(result);
      if (categoryResponse.data == null) {
        return [];
      } else {
        List<CategoryModel> categories = categoryResponse.data!;
        return categories;
      }
    } else if (response.statusCode == 401) {
      throw TokenException(message: 'Token is Expired');
    } else {
      dynamic result = json.decode(response.body);
      CategoryResponse categoryResponse = CategoryResponse.fromJson(result);
      throw ServerException(
          message: categoryResponse.meta?.message ?? 'Server Exception');
    }
  }

  @override
  Future<List<ProductModel>> getProductByCategory(
      {required String token, required String category}) async {
    final response = await client.get(
      Uri.parse('$baseRemoteUrl$endpointProductByCategory=$category&page=1'),
      headers: {
        "Authorization": token,
      },
    );
    if (response.statusCode == 200) {
      dynamic result = json.decode(response.body);
      ProductResponse productResponse = ProductResponse.fromJson(result);
      if (productResponse.data == null) {
        return [];
      } else {
        List<DataProductResponse> dataProductResponse = productResponse.data!;
        final products = dataProductResponse.first.products;
        return products;
      }
    } else if (response.statusCode == 401) {
      throw TokenException(message: 'Token is Expired');
    } else {
      dynamic result = json.decode(response.body);
      ProductResponse productResponse = ProductResponse.fromJson(result);
      throw ServerException(
          message: productResponse.meta?.message ?? 'Server Exception');
    }
  }

  @override
  Future<String> postCheckout({
    required String token,
    required CheckoutModel checkoutModel,
  }) async {
    final body = checkoutModel.toJson();
    final response = await client.post(
      Uri.parse('$baseRemoteUrl$endpointCheckout'),
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": token,
      },
      body: json.encode(body),
    );

    if (response.statusCode == 201) {
      dynamic result = json.decode(response.body);
      CheckoutResponse checkoutResponse = CheckoutResponse.fromJson(result);
      return checkoutResponse.meta!.message;
    } else if (response.statusCode == 401) {
      throw TokenException(message: 'Token is Expired');
    } else {
      dynamic result = json.decode(response.body);
      CheckoutResponse checkoutResponse = CheckoutResponse.fromJson(result);
      throw ServerException(
          message: checkoutResponse.meta?.message ?? 'Server Exception');
    }
  }

  @override
  Future<String> postMembership({
    required String token,
    required MembershipModel membershipModel,
  }) async {
    final body = membershipModel.toJson();
    final response = await client.post(
      Uri.parse('$baseRemoteUrl$endpointMembership'),
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": token,
      },
      body: json.encode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      dynamic result = json.decode(response.body);
      MembershipResponse membershipResponse =
          MembershipResponse.fromJson(result);
      return membershipResponse.data!.memberCode;
    } else if (response.statusCode == 401) {
      throw TokenException(message: 'Token is Expired');
    } else {
      dynamic result = json.decode(response.body);
      MembershipResponse membershipResponse =
          MembershipResponse.fromJson(result);
      throw ServerException(
          message: membershipResponse.meta?.message ?? 'Server Exception');
    }
  }
}
