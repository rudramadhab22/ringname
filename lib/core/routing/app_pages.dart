import 'package:get/get.dart';
import 'app_routes.dart';
import '../../features/home/presentation/views/home_view.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
    ),
  ];
}
