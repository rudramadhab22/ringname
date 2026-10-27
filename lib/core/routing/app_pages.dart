import 'package:get/get.dart';
import 'app_routes.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/add_caller/presentation/views/add_caller_view.dart';
import '../../features/settings/presentation/views/settings_view.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: AppRoutes.addCaller,
      page: () => const AddCallerView(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsView(),
    ),
  ];
}
