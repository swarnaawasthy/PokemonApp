import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:pokemon/domain_layer/home_model.dart';
import 'package:pokemon/domain_layer/i_home_repository.dart';
class HomeController extends GetxController{
  HomeController(this.iHomeRepository);
  final IHomeRepository iHomeRepository;

 List<Results> characters = [];


  @override
  void onInit() {
    super.onInit();
    fetchAPI();
  }

  fetchAPI() async {
    Either<String, HomeModel> result = await iHomeRepository
        .fetchHomePage();
    result.fold((error) {

    }, (r) {
      characters = r.results ?? [];
    });
    update();
  }
}