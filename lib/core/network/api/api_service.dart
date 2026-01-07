import 'package:wallet_app_project/core/network/constance_network/api_endpoints.dart';
import 'package:wallet_app_project/core/network/dio_manager/dio_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});


class ApiService {
 Future<bool> uploadFile({
  required String path,
 Map<String, dynamic>? headers,
 })async{
final respons = await DioManager.getInstance.dioUploadFile(
   url: ApiEndpoints.uploader,
   filePath: path,
   header: headers,
 );

 return respons.statusCode == 200;
 }
}