import 'package:mvc_boilerplate/src/data/network/apis/main_api.dart';
import 'package:mvc_boilerplate/src/data/network/apis/notification_api.dart';
import 'package:mvc_boilerplate/src/data/network/apis/setting_api.dart';
import 'package:mvc_boilerplate/src/data/network/apis/user_api.dart';
import 'package:mvc_boilerplate/src/data/repository/main_repository.dart';
import 'package:mvc_boilerplate/src/data/repository/notification_repository.dart';
import 'package:mvc_boilerplate/src/data/repository/search_repository.dart';
import 'package:mvc_boilerplate/src/data/repository/settings_repository.dart';
import 'package:mvc_boilerplate/src/data/repository/user_repository.dart';
import 'package:mvc_boilerplate/src/di/module/network_module.dart';
import 'package:dio/dio.dart';
import 'package:mvc_boilerplate/src/data/network/apis/app_api.dart';
import 'package:mvc_boilerplate/src/data/network/dio_client.dart';
import 'package:mvc_boilerplate/src/data/network/rest_client.dart';
import 'package:mvc_boilerplate/src/data/sharedpref/shared_preference_helper.dart';
import 'package:mvc_boilerplate/src/di/module/local_module.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // singletons:----------------------------------------------------------------
  getIt.registerSingletonAsync<SharedPreferences>(
      () => LocalModule.provideSharedPreferences());
  getIt.registerSingleton(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));

  getIt.registerSingleton<Dio>(
      NetworkModule.provideDio(getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(RestClient());

  // api's:---------------------------------------------------------------------
  getIt.registerSingleton(AppApi(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(NotificationApi(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(UserApi(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(SettingsApi(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(MainApi(getIt<DioClient>(), getIt<RestClient>()));


  // repository:----------------------------------------------------------------
  getIt.registerSingleton(NotificationRepository(
    getIt<NotificationApi>(),
    getIt<SharedPreferenceHelper>(),
  ));
  getIt.registerSingleton(UserRepository(
    getIt<UserApi>(),
    getIt<SharedPreferenceHelper>(),
  ));
  getIt.registerSingleton(SettingsRepository(
    getIt<SettingsApi>(),
    getIt<SharedPreferenceHelper>(),
  ));
  getIt.registerSingleton(SearchRepository(
    getIt<SharedPreferenceHelper>(),
  ));
  getIt.registerSingleton(MainDataRepository(
    getIt<MainApi>(),
    getIt<SharedPreferenceHelper>(),
  ));
 // getIt.registerSingleton(MainProvider(getIt<Repository>()));
  /* getIt.registerSingleton(CommentServices());
  getIt.registerSingleton(HomeServices());
*/
}
