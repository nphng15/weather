import 'package:get/get.dart';

class mainCardController extends GetxController{
  var mainIndex=0.obs;

  void changeIndex(int newIndex){
    mainIndex.value = newIndex;
    print(mainIndex);
  }  
}