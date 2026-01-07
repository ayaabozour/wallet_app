import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app_project/core/network/api/api_service.dart';
import 'package:wallet_app_project/core/network/header/header_provider.dart';
import 'package:wallet_app_project/core/network/token_types.dart';

final uploadFileProvider =
    FutureProvider.family<bool, String>((ref, path) async {
  final api = ref.read(apiServiceProvider);
  final headers =
      ref.read(headerProvider).build(TokenType.multipart);

  return api.uploadFile(
    path: path,
    headers: headers,
  );
});
