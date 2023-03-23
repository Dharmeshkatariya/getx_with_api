import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  RxDouble opacity = .2.obs;
  RxBool notification = false.obs;
  RxList<String> foodList = ["Banana", "Mango", "Orange", "apple"].obs;
  RxList emptyList = [].obs;
  RxString imagePath = "".obs;

  setOpacity(double value){
    opacity.value = value;
  }
  setNotification(bool value){
    notification.value = value;
  }
  addFavList(String value){
    emptyList.add(value);
  }
  removeFavList(String value){
  emptyList.remove(value);
  }

  imagePick()async{
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      imagePath.value = image.path.toString();
    }
  }
}
