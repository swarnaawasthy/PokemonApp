import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:pokemon/network/error_handling.dart';

enum HTTPMETHOD { GET, POST}

final apiBaseHelper = ApiBaseHelper();

class ApiBaseHelper {
  final Dio dio = Dio(BaseOptions(
    responseType: ResponseType.json,
  ));

  Future<CustomResponse> request({
    required String url,
    dynamic data,
    HTTPMETHOD method = HTTPMETHOD.GET,
    int? timeOut,
  }) async {
    Response? response;
    try {

      /// Check For Network
      if (!await checkInternetConnectivity()) {
        return CustomResponse(
          message: 'network error',
          data: null,
          success: false,
          fullResponse: null,
        );
      }
      switch (method) {
        case HTTPMETHOD.GET:
          response = await dio.get(
            url,
          );
          break;
        case HTTPMETHOD.POST:
          response = await dio.post(
            url,
            data: data,
            options: timeOut == null
                ? Options()
                : Options(receiveTimeout: timeOut, sendTimeout: timeOut),
          );
          break;
        default:
      }

      final resData = response?.data is Map ? response?.data["results"] : "";

      return CustomResponse(
        success: true,
        message: '',
        data: resData,
        fullResponse: response,
      );
    } on DioError catch (error) {
      return ErrorHandling.responseError(error);
    }
  }


}

class CustomResponse {
  bool success;
  String message;
  dynamic data;
  dynamic fullResponse;
  CustomResponse({
    required this.success,
    required this.message,
    @required this.data,
    this.fullResponse,
  });
}

Future<bool> checkInternetConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else if (connectivityResult == ConnectivityResult.none) {
    return false;
  } else {
    return false;
  }
}


