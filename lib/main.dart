import 'package:flutter/material.dart';
import 'package:flutter_projects/pages/Onboarding/first_onboard_page.dart';
import 'package:flutter_projects/pages/Onboarding/onboarding_pages.dart';
import 'package:flutter_projects/pages/Splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FirstOnboardPage(),
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route: (context) => SplashScreen(),
        FirstOnboardPage.route: (context) => FirstOnboardPage(),
        OnboardingPages.route: (context) => OnboardingPages(),
      },
    );
  }
}
