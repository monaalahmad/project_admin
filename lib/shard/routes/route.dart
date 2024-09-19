import 'package:flutter/cupertino.dart';
import '../../store/widght/add_page_store/add_page_store.dart';
import '../../store/widght/get_branch/get_classification.dart';
import '../../store/widght/home_page.dart';
import '../../store/widght/product_detailPage_for_store.dart';
import '../../store/widght/show_store_house/cate_ready.dart';
import '../../store/widght/show_store_house/readyfoarsa.dart';
import '../../storehouse/widght/get_producttostorehouse/get_classification_storehouse.dart';
import '../../storehouse/widght/home_page.dart';
import '../../widght/auth/forgot_code.dart';
import '../../widght/auth/forgot_pass.dart';
import '../../widght/auth/login.dart';
import '../../widght/auth/register.dart';
import '../../widght/auth/reset_pass.dart';
import '../../widght/home_page/homePage.dart';
import '../../widght/manfment_widght/add_widght/add_page.dart';
import '../../widght/manfment_widght/view_widght/branch_view.dart';
import '../../widght/manfment_widght/view_widght/classification_view.dart';
import '../../widght/manfment_widght/view_widght/product_view.dart';
import '../../widght/manfment_widght/view_widght/storehouse_view.dart';
import '../../widght/setting/setting_page.dart';
import '../static/auth.dart';

Map<String , Widget Function(BuildContext)> routs = {

  "/Login": (context) => LoginPage(),
  "/HomePage": (context) => const HomePage(),
  "/BackWidghtLogin": (context) => const BackWidghtLogin(),
  "/UserPage": (context) => const UserPage(),
  "/ForgotCode": (context) => ForgotCode(),
  "/ForgotPass": (context) => ForgotPass(),
  "/ResetPass": (context) => ResetPass(),
  "/AddPage": (context) => const AddPage(),
  "/BranchView": (context) => const BranchView(),
  "/ClassificationView": (context) => ClassificationView(),
  "/ProductView": (context) => const ProductView(),
  "/SettingPage": (context) => const SettingPage(),
  "/AddPageStore": (context) => const AddPageStore(),
  "/StorehouseView": (context) => const StorehouseView(),
  "/ClassificationStoreView": (context) => ClassificationStoreView(),
  "/HomePageStorehouse": (context) => const HomePageStorehouse(),
  "/HomePageStore": (context) => HomePageStore(),
  "/Readyforsale": (context) => Readyforsale(),
  "/catReadyScreen": (context) => catReadyScreen(),
  "/ClassificationStorehouseView": (context) => ClassificationStorehouseView(),
};