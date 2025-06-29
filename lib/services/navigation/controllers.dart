import 'package:get_it/get_it.dart';
import 'package:lambda_dent_dash/data/repo/db_manager_repo.dart';
import 'package:lambda_dent_dash/services/navigation/navigation_service.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(()=> DbManagerRepo());
}
