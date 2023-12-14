import 'package:pokemon/domain_layer/home_model.dart';
import 'package:dartz/dartz.dart';

abstract class IHomeRepository{
  Future<Either<String, HomeModel>> fetchHomePage();
}