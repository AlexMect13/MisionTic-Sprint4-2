import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import 'ui/app.dart';
import 'ui/controllers/shopping_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ShoppingController());
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  // TODO
  // agregar el ShoppingController al DI de Get
  runApp(const MyApp());
}
