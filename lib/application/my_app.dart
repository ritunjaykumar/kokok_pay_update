import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '/models/enums/enums.dart';
import '/resources/routes_manager.dart';
import '/resources/string_manager.dart';
import '/resources/theme_manager.dart';
import '/screens/unknown/unknown_screen.dart';
import '/service/provider/settings_provider.dart';
import '../service/provider/notification_provider.dart';
import '../utils/constant/app_constant.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => AppSettingProvider(context)),
        ChangeNotifierProvider(
          create: (ctx) => NotificationProvider(context),
          lazy: false,
        ),
      ],
      child: Consumer<AppSettingProvider>(
        builder: (_, settingProvider, child) {
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: settingProvider.getLocal(),
            localeResolutionCallback: (Locale? locale, Iterable<Locale> localIt) {
              Locale tempLocal;
              if (localIt.contains(Locale(locale!.languageCode))) {
                tempLocal = locale;
              } else {
                tempLocal = Locale(AppLanguage.english.language, AppLanguage.english.countryCode);
              }
              settingProvider.updateHeaderLang(tempLocal.languageCode);
              return tempLocal;
            },
            debugShowCheckedModeBanner: false,
            title: StringResource().appTitle,
            theme: ThemeResources().getLightThemeData(),
            darkTheme: ThemeResources().getDarkThemeData(),
            // themeMode: settingProvider.themeMode,
            themeMode: ThemeMode.light,
            onGenerateRoute: RouteResource.getGeneratedRoutes,
            routes: RouteResource.getStaticRoute(context),
            initialRoute: Routes.splashScreen,
            // initialRoute: Routes.dashboardScreen,
            themeAnimationCurve: Curves.easeIn,
            themeAnimationDuration: const Duration(seconds: 1),
            onUnknownRoute: (RouteSettings routeSetting) {
              return MaterialPageRoute(builder: (_) => const UnknownScreen());
            },
            restorationScopeId: AppConstant.restorationId,
          );
        },
      ),
    );
  }
}
