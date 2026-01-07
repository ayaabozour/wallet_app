import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../dio_manager/dio_manager.dart';

final dioProvider = Provider<DioManager>((ref) {
  return DioManager.getInstance..init();
});
