import 'package:amazon_ui/store/auth_store/auth_store.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencyInjection() async {
  await initServices();
  await initStore();
}

initServices() async {}

initStore() {
  sl.registerSingleton<AuthStore>(AuthStore());
}
