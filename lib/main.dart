
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_projects/core/helpers/remote/dio_helper.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/features/app_layout/ui/pages/app_layout.dart';
import 'package:flutter_projects/features/auth/data/api/register_api%20.dart';
import 'package:flutter_projects/features/auth/logic/login_cubit/log_in_cubit.dart';
import 'package:flutter_projects/features/auth/logic/register_cubit/register_cubit.dart';
import 'package:flutter_projects/features/auth/ui/login_screen/login_screen.dart';
import 'package:flutter_projects/features/edit_profile/data/api/reset_pass_api.dart';
import 'package:flutter_projects/features/edit_profile/logic/change_password_cubit/change_password_cubit.dart';
import 'package:flutter_projects/features/home_tab/logic/home_tab_cubit.dart';
import 'package:flutter_projects/features/movie_details/logic/movie_details/movie_details_cubit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/bloc_observer.dart';
import 'core/helpers/local/cache_helper.dart';
import 'core/resources/app_localizations.dart';
import 'features/Onboarding/ui/first_onboard_page.dart';
import 'features/Onboarding/ui/onboarding_pages.dart';
import 'features/Splash/splash_screen.dart';
import 'features/app_layout/logic/app_cubit.dart';
import 'features/auth/data/api/login_api.dart';
import 'features/auth/data/repo/login_repo/login_repo_contract_impl.dart';
import 'features/edit_profile/logic/edit_profile_cubit/edit_profile_cubit.dart';
import 'features/edit_profile/ui/edit_profile_screen/edit_profile_screen.dart';
import 'features/movie_details/ui/movie_details.dart';

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
        BlocProvider(create: (context) => HomeTabCubit()..getMoviesList()),
        BlocProvider(
            create: (context) => LogInCubit(
                loginRepo: LoginRepoContractImpl(LoginApiService()))),
        BlocProvider(
            create: (context) =>
                RegisterCubit(apiService: RegisterApiService())),
        BlocProvider(create: (context) => ChangePasswordCubit(ResetPassApi())),
        BlocProvider(create: (context) => AppCubit()..getSavedLanguage()),
        BlocProvider(create: (context) => EditProfileCubit()),
        BlocProvider(create: (context) => MovieDetailsCubit()),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = AppCubit.get(context);
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            locale: cubit.locale,
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (deviceLocal, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocal != null &&
                    deviceLocal.languageCode == locale.languageCode) {
                  return deviceLocal;
                }
              }
              return supportedLocales.first;
            },
            theme: ThemeData(
              scaffoldBackgroundColor: ColorManager.mainColor,
              textTheme: GoogleFonts.interTextTheme(),
              useMaterial3: true,
            ),
            home: AppLayOut(),
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              FirstOnboardPage.route: (context) => FirstOnboardPage(),
              OnboardingPages.route: (context) => OnboardingPages(),
              AppLayOut.routeName: (context) => AppLayOut(),
              EditProfileScreen.routeName: (context) =>
              const EditProfileScreen(),
              MovieDetails.routeName: (context) => MovieDetails(
                movieId: 1,
              ),
            },
          );
        },
      ),
    );
  }
}