import 'package:e_course_flutter/controller/change_language_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/controller/main_app_contronller.dart';
import 'package:e_course_flutter/l10n/support_locale.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ChangeLanguageController());
  await Get.find<ChangeLanguageController>().getLang();

  Get.put(MainAppController());
  runApp(const MyApp());
}

class MyApp extends GetView<MainAppController> {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final local = controller.stateAppLang.value;
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: ManagerRoutes.manager,
          initialRoute: ManagerRoutes.splashScreen,
          // INTL
          supportedLocales: L10n.support,
          locale: local,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode &&
                  supportedLocale.countryCode == locale?.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
        );
      },
    );
  }
}
