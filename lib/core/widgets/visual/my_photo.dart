import 'dart:io';
import 'package:image_picker/image_picker.dart';

class MyPhoto {
  final ImagePicker _picker = ImagePicker();

  Future<File?> selecionarImagem({required ImageSource source}) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}