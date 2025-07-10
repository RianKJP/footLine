import 'dart:io';
import 'package:image_picker/image_picker.dart';

class MyProduct {
  final ImagePicker _picker = ImagePicker();

  Future<File?> selectionImage({required ImageSource source}) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}