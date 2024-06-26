import 'dart:async';
import 'package:cogina/domain/request_body/check_out_body.dart';
import 'package:dio/dio.dart';
import '../../domain/repository/check_out_repo.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base/api_response.dart';

class CheckOutRepositoryImp implements CheckOutRepository{
  final DioClient _dioClient;
  const CheckOutRepositoryImp({
    required DioClient dioClient,
  })  : _dioClient = dioClient;

  @override
  Future<ApiResponse> checkOut({required CheckOutBody checkOutBody}) async{
    try {
      Response response = await _dioClient.post(
          AppURL.kCheckOutURL,
          queryParameters: checkOutBody.toJson()
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
