import 'package:dartz/dartz.dart';

import 'package:pokemon/domain_layer/home_model.dart';

import '../domain_layer/i_home_repository.dart';
import '../network/network_layer.dart';

class HomeRepository implements IHomeRepository{
  final ApiBaseHelper apiBaseHelper;
  HomeRepository({
    required this.apiBaseHelper,
});

  @override
  Future<Either<String, HomeModel>> fetchHomePage() async {
    try {
      CustomResponse response = await apiBaseHelper.request(
        url: "https://pokeapi.co/api/v2/pokemon-species/",
        method: HTTPMETHOD.GET,
      );
      if (response.fullResponse.data["results"] != null) {
        return right(HomeModel.fromJson(
            response.fullResponse.data));
      }
      return left(response.message);
    } catch (e) {
      return left("Error");
    }
  }



  }

