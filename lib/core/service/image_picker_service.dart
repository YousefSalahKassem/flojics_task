import 'dart:io';

import 'package:flojics_task/core/helper/utils/generic_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService extends StateNotifier<GenericState<File>> {
  static final provider =
      StateNotifierProvider.autoDispose<ImagePickerService, GenericState<File>>(
    (ref) => ImagePickerService(),
  );

  ImagePickerService() : super(GenericState.initial());

  Future<void> pickImage(ImageSource source) async {
    try{
      state = GenericState.loading();
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile == null) {
        state = GenericState.fail('');
      } else {
        state = GenericState.success(File(pickedFile.path));
      }
    } catch (e){
      state = GenericState.fail(e.toString());
    }
  }
}
