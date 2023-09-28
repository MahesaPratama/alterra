import 'dart:convert';

import 'package:mobile_flutter/data/models/api/post/user_model.dart';
import 'package:mobile_flutter/utils/error/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<bool> setStatusOnboarding(bool status);
  Future<bool> getStatusOnboarding();
  Future<void> setUserLogin({required UserModel userModel});
  Future<UserModel> getUserLogin();
  Future<void> setUserToken({required String token});
  Future<String> getUserToken();
  Future<bool> clearSharedPreferences();
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  static const dbOnboarding = 'dbOnboarding';
  static const dbLogin = 'dbLogin';
  static const dbToken = 'dbToken';

  @override
  Future<bool> getStatusOnboarding() async {
    final result = sharedPreferences.getBool(dbOnboarding);
    if (result != null) {
      return result;
    } else {
      return false;
    }
  }

  @override
  Future<bool> setStatusOnboarding(bool status) async {
    final result = await sharedPreferences.setBool(
      dbOnboarding,
      status,
    );
    return result;
  }

  @override
  Future<void> setUserLogin({required UserModel userModel}) async {
    final model = jsonEncode(userModel.toJson());
    await sharedPreferences.setString(dbLogin, model);
  }

  @override
  Future<UserModel> getUserLogin() async {
    final localUser = sharedPreferences.getString(dbLogin);
    if (localUser != null) {
      final result = jsonDecode(localUser);
      return UserModel.fromJson(result);
    } else {
      throw DatabaseException();
    }
  }

  @override
  Future<void> setUserToken({required String token}) async {
    await sharedPreferences.setString(dbToken, token);
  }

  @override
  Future<String> getUserToken() async {
    final userToken = sharedPreferences.getString(dbToken);
    if (userToken != null) {
      return userToken;
    } else {
      throw (DatabaseException());
    }
  }

  @override
  Future<bool> clearSharedPreferences() async {
    final resultLogin = await sharedPreferences.remove(dbLogin);
    final resultToken = await sharedPreferences.remove(dbToken);
    return (resultLogin && resultToken);
  }
}
