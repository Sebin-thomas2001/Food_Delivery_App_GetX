import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class KycController extends GetxController {
  RxString profileImagePath = "null".obs;

  RxString locationName = "null".obs;

  pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      profileImagePath(image.path);
    }
  }

  takePicture() async {
    final ImagePicker picker = ImagePicker();
    // take image using camera.
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      profileImagePath(image.path);
    }
  }

  fetchLocation(){
    
  }
}
