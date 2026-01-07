import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallet_app_project/features/app/upload/providers/upload_provider.dart';

class UploadScreen extends ConsumerWidget {
  const UploadScreen({super.key});

  Future<void> pickAndUploadImage(
    BuildContext context,
    WidgetRef ref, {
    ImageSource source = ImageSource.gallery,
  }) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: source);

    if (image != null) {
      return;
    } else {
      ref.read(uploadFileProvider(image!.path).future);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Placeholder();
  }
}
