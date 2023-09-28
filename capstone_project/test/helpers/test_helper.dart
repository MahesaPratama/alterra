import 'package:mobile_flutter/domain/repositories/repository.dart';
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
import 'package:mockito/annotations.dart';

@GenerateMocks([
  // USECASE
  PostCheckoutProduct,
  PostLogin,
  PostMembership,
  GetUserLocal,
  PostLogout,
  GetStatusOnboarding,
  SetStatusOnboarding,
  GetProductByCategory,
  GetProductCategory,
  GetSalesReport,
  GetUserToken,
  // REPOSITORY
  Repository
], customMocks: [])
void main() {}
