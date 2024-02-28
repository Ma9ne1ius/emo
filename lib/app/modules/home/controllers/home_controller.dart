import 'package:emo/app/data/services/storage.dart';
import 'package:get/get.dart';

abstract class EmoData {
  static List<String> emoList = ['😊', '😂', '🤣', '❤', '😁', '😎'];
}

class HomeController extends GetxController {
  final storageService = Get.find<StorageService>();
  final index = 0.obs;

  String getEmo() {
    return EmoData.emoList[(index.value % EmoData.emoList.length).toInt()];
  }

  void changeIndex() {
    index.value++;
    var i = index.value % EmoData.emoList.length;
    index.value = i.toInt();
    
    storageService.wrightIndex( index.value);
  }

  @override
  void onInit() {
    super.onInit();
    index.value = storageService.readIndex();
  }
}
