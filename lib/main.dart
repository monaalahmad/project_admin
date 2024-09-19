import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_admin/shard/routes/route.dart';
import 'package:project_admin/store/widght/home_page.dart';
import 'package:project_admin/storehouse/widght/home_page.dart';
import 'package:project_admin/theme/theme_provider.dart';
import 'package:project_admin/widght/logo_sreen/logo.dart';
import 'package:project_admin/widght/home_page/homePage.dart';
import 'controller/get_branch/branch_controller.dart';
import 'local/local.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_storage/get_storage.dart';
import 'local/local_controller.dart';

const baseUrl = 'http://10.0.2.2:8000';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await GetStorage.init();
  await Get.putAsync(() async => MyLocaleController(sharedPreferences));
  Get.put(sharedPreferences);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final token = box.read('token');
    Get.put(BranchController());
    return GetMaterialApp(
      title: '1'.tr,
      debugShowCheckedModeBanner: false,
      locale: Get.find<MyLocaleController>().initLang,
      translations: MyLocal(),
      home: LogoPage(),
      routes: routs,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}

//token != null ? const HomePage() :
//token != null ? HomePageStore():
//token != null ? const HomePageStorehouse():