import 'package:get/get.dart';
import 'package:therapist/model/data.dart';

class ChatController extends GetxController {
  List messageList = messagesList.obs;

  void updateMessageList(Message msg) {
    messageList.add(msg);
  }
}
