import 'package:image_picker/image_picker.dart';

Future<String> imgFromCamera(String name) async {
  XFile? image = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 50);
  return "${image!.path}:$name";
}