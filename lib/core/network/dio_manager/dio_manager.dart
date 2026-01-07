import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:wallet_app_project/core/network/dio_manager/api_interceptors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final dioProvider = Provider<DioManager>((ref) {
  return DioManager.getInstance..init();
});

class DioManager {
  DioManager._();
  static final DioManager getInstance = DioManager._();

  Dio? _dio;

  Dio init() {
    _dio ??= Dio(
      BaseOptions(
        baseUrl: 'https://demo.vueltd.co.uk/api/v1',
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        responseType: ResponseType.json,
        receiveDataWhenStatusError: true,
        validateStatus: (_) => true,
      ),
    );
    _dio!.interceptors.add(ApiInterceptors());
    return _dio!;
  }

  Future<Response> dioGet({
    var url,
    Map<String, dynamic>? header,
    var queryParameters,
  }) async {
    Logger().i(
      "dioGet url: $url header: $header queryParameters: $queryParameters",
    );

    return await _dio!.get(
      url,
      options: Options(headers: header),
      queryParameters: queryParameters,
    );
  }

  Future<Response> dioPost({
    var url,
    Map<String, dynamic>? header,
    var body,
    Map<String, dynamic>? queryParameters,
  }) async {
    Logger().i("dioPost url: $url");
    Logger().i("dioPost header: $header");
    return await _dio!.post(
      url,
      queryParameters: queryParameters,
      options: Options(headers: header),
      data: body,
      onSendProgress: (count, total) {},
    );
  }

  Future<Response> dioPostForm({
    var url,
    Map<String, dynamic>? header,
    var body,
  }) async {
    Logger().i("dioPostForm url: $url");
    Logger().i("dioPostForm header: $header");
    Logger().i("dioPostForm body: $body");

    return await _dio!.post(
      url,
      options: Options(headers: header),
      data: FormData.fromMap(body ?? {}),
      onSendProgress: (count, total) {},
    );
  }

  Future<Response> dioUpdate({
    var url,
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
  }) async {
    return await _dio!.put(
      url,
      options: Options(headers: header),
      data: body,
    );
  }

  Future<Response> dioDelete({
    var url,
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
  }) async {
    return await _dio!.delete(
      url,
      options: Options(headers: header),
      data: body,
    );
  }

  Future<Response> dioPutForm({
    var url,
    Map<String, dynamic>? header,
    var body,
  }) async {
    Logger().i("dioPutForm url: $url");
    Logger().i("dioPutForm header: $header");
    Logger().i("dioPutForm body: $body");

    return await _dio!.put(
      url,
      options: Options(headers: header),
      data: body,
    );
  }

  Future<Response> dioPatchForm({
    var url,
    Map<String, dynamic>? header,
    var body,
  }) async {
    Logger().i("dioPatchForm url: $url");
    Logger().i("dioPatchForm header: $header");
    Logger().i("dioPatchForm body: $body");

    return await _dio!.patch(
      url,
      options: Options(headers: header),
      data: body,
    );
  }

  Future<Response> dioPut({
    var url,
    Map<String, dynamic>? header,
    var body,
  }) async {
    Logger().i("dioPut url: $url");
    Logger().i("dioPut header: $header");
    Logger().i("dioPut body: $body");

    return await _dio!.put(
      url,
      options: Options(headers: header),
      data: body,
    );
  }

  Future<Response<dynamic>> dioDownloadFile({
    required String url,
    required var body,
    required Map<String, dynamic> header,
    required String savePath,
  }) {
    Logger().i("dioDownloadFile url: $url");
    Logger().i("dioDownloadFile header: $header");

    return _dio!.download(
      url,
      savePath,
      data: body,
      options: Options(headers: header),
      onReceiveProgress: (recieved, total) {
        if (total != -1) {
          Logger().i("${(recieved / total * 100).toStringAsFixed(0)}%");
        }
      },
    );
  }

  Future<Response> dioUploadFile({
    required String url,
    required String filePath,
    String fileKey = 'file',
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
  }) async {
    Logger().i("dioUploadFile url: $url");
    Logger().i("dioUploadFile header: $header");
    Logger().i("dioUploadFile body: $body");

    final fileName = filePath.split('/').last;

    FormData formData = FormData.fromMap({
      ...?body,
      fileKey: await MultipartFile.fromFile(filePath, filename: fileName),
    });

    return await _dio!.post(
      url,
      data: formData,
      options: Options(headers: header),
      onSendProgress: (count, total) {
        if (total != -1) {
          Logger().i("${(count / total * 100).toStringAsFixed(0)}%");
        }
      },
    );
  }
}
