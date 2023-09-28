import 'package:get_it/get_it.dart';

import 'package:mobile_flutter/data/datasources/remote_data_source.dart';
import 'package:mobile_flutter/data/datasources/local_data_souce.dart';
import 'package:mobile_flutter/data/datasources/mock_data_source.dart';
import 'package:mobile_flutter/domain/repositories/repository.dart';
import 'package:mobile_flutter/data/repositories/repository_impl.dart';
import 'package:mobile_flutter/domain/usecases/get_product_by_category.dart';
import 'package:mobile_flutter/domain/usecases/get_product_category.dart';
import 'package:mobile_flutter/domain/usecases/get_sales_report.dart';
import 'package:mobile_flutter/domain/usecases/get_status_onboarding.dart';
import 'package:mobile_flutter/domain/usecases/get_user_local.dart';
import 'package:mobile_flutter/domain/usecases/get_user_token.dart';
import 'package:mobile_flutter/domain/usecases/post_checkout_product.dart';
import 'package:mobile_flutter/domain/usecases/post_login.dart';
import 'package:mobile_flutter/domain/usecases/post_logout.dart';
import 'package:mobile_flutter/domain/usecases/post_membership.dart';
import 'package:mobile_flutter/domain/usecases/set_status_onboarding.dart';
import 'package:mobile_flutter/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/login/login_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/membership/membership_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/onboarding/onboarding_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/product/product_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/product_category/product_category_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/sales_report/sales_report_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/token/token_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
Future<void> init() async {
  // Bloc
  sl.registerFactory(() => OnboardingBloc(sl(), sl()));
  sl.registerFactory(() => LoginBloc(sl(), sl(), sl()));
  sl.registerFactory(() => SalesReportBloc(sl()));
  sl.registerFactory(() => TokenBloc(sl()));
  sl.registerFactory(() => ProductCategoryBloc(sl()));
  sl.registerFactory(() => ProductBloc(sl()));
  sl.registerFactory(() => CheckoutBloc(sl()));
  sl.registerFactory(() => MembershipBloc(sl()));

  // Use Case
  sl.registerLazySingleton(() => GetStatusOnboarding(sl()));
  sl.registerLazySingleton(() => SetStatusOnboarding(sl()));
  sl.registerLazySingleton(() => GetSalesReport(sl()));
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => PostLogout(sl()));
  sl.registerLazySingleton(() => GetUserLocal(sl()));
  sl.registerLazySingleton(() => GetUserToken(sl()));
  sl.registerLazySingleton(() => GetProductCategory(sl()));
  sl.registerLazySingleton(() => GetProductByCategory(sl()));
  sl.registerLazySingleton(() => PostMembership(sl()));
  sl.registerLazySingleton(() => PostCheckoutProduct(sl()));

  // Repository
  sl.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      localDataSource: sl(),
      mockDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data Source
  sl.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<MockDataSource>(
    () => MockDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(client: sl()),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
