import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/global_injections.dart';
import 'package:sample_project/services/localizations/app_localizations/app_localizations.dart';

import 'src/core/navigation/routes.dart';
import 'src/layers/controllers/global_shared_controller/global_config_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  Intl.systemLocale = await findSystemLocale();
  setupGlobalInjections();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final themeData = ThemeData(textTheme: GoogleFonts.dmSansTextTheme());

  @override
  Widget build(BuildContext context) {
    // global controllers
    return MultiProvider(
      providers: [
        ListenableProvider.value(value: getIt<GlobalConfigController>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('pt'),
        ],
        onGenerateTitle: (context) =>
            AppLocalizations.of(context)!.sampleProject,
        theme: themeData.copyWith(
          textTheme: GoogleFonts.dmSansTextTheme(),
          appBarTheme: AppBarTheme(
            backgroundColor: themeData.scaffoldBackgroundColor,
            centerTitle: true,
            foregroundColor: themeData.primaryColor,
            titleTextStyle: themeData.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: themeData.primaryColor,
            ),
          ),
          dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          cardTheme: CardTheme(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 3,
          ),
        ),
        builder: (context, child) {
          return Container(
            color: themeData.scaffoldBackgroundColor,
            child: child,
          );
        },
        routerConfig: goRouterInstance,
      ),
    );
  }
}
