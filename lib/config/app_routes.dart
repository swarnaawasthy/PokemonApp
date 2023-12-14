import 'package:pokemon/presentation_layer/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPage{
  static final all = [
  GetPage(
  name: AppRoute.homepage,
  page: ()=> HomeScreen(),
  ),
  ];

}

abstract class AppRoute {
  static const homepage = '/homepage';
}
