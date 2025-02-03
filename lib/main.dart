import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/helpers/remote/dio_helper.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/features/auth/logic/login_cubit/log_in_cubit.dart';
import 'package:flutter_projects/features/auth/logic/register_cubit/register_cubit.dart';
import 'package:flutter_projects/features/auth/logic/reset_password_cubit/reset_password_cubit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/bloc_observer.dart';
import 'core/helpers/local/cache_helper.dart';
import 'features/Onboarding/ui/first_onboard_page.dart';
import 'features/Onboarding/ui/onboarding_pages.dart';
import 'features/Splash/splash_screen.dart';
import 'features/edit_profile/logic/edit_profile_cubit.dart';
import 'features/edit_profile/ui/edit_profile_screen/edit_profile_scren.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LogInCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ResetPasswordCubit()),
        BlocProvider(create: (context) => EditProfileCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: ColorManager.mainColor,
          textTheme: GoogleFonts.interTextTheme(),
          useMaterial3: true,
        ),
        home: FirstOnboardPage(),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          FirstOnboardPage.route: (context) => FirstOnboardPage(),
          OnboardingPages.route: (context) => OnboardingPages(),
          EditProfileScren.routeName: (context) => const EditProfileScren(),
        },
      ),
    );
  }
}
