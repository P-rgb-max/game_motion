import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MainController extends GetxController {
  RxBool u = false.obs;
}

final MainController c = Get.put(MainController());

void setGet(void Function() act) {
  act();
  c.u.value = !c.u.value;
}
