import 'package:flutter_provider_architecture/core/services/api.dart';
import 'package:flutter_provider_architecture/core/services/authentication_service.dart';
import 'package:flutter_provider_architecture/core/services/post_service.dart';
import 'package:flutter_provider_architecture/core/view_models/comments_model.dart';
import 'package:flutter_provider_architecture/core/view_models/home_model.dart';
import 'package:flutter_provider_architecture/core/view_models/like_button_model.dart';
import 'package:flutter_provider_architecture/core/view_models/login_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => PostsService());

  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
  locator.registerFactory(() => LikeButtonModel());
}
