import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Models/theme_model.dart';
import 'Providers/json_decode_provider.dart';
import 'Providers/theme_provider.dart';
import 'Views/Screens/AllVersesPage.dart';
import 'Views/Screens/ChapterDetilPage.dart';
import 'Views/Screens/HomePage.dart';
import 'Views/Screens/shlokdetailpage.dart';
import 'Views/Screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isDark = prefs.getBool('appTheme') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(
            themeModel: ThemeModel(
              isDark: isDark,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ChapterJsonDecodeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShlokJsonDecodeProvider(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: (Provider.of<ThemeProvider>(context).themeModel.isDark)
            ? ThemeMode.dark
            : ThemeMode.light,
        routes: {
          '/': (context) => const SplashScreen(),
          'Home_Page': (context) => const HomePage(),
          'chapter_detail_page': (context) => const ChapterDetailPage(),
          'all_verses_page': (context) => const AllVersesPage(),
          'shlok_detail_page': (context) => const ShlokDetailPage(),
        },
      ),
    ),
  );
}
