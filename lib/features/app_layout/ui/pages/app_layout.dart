import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/features/app_layout/logic/app_cubit.dart';
import 'package:flutter_projects/features/app_layout/ui/widgets/bottom_nav_bar.dart';

class AppLayOut extends StatefulWidget {
  const AppLayOut({super.key});

  static String routeName = 'app_layout';

  @override
  State<AppLayOut> createState() => _AppLayOutState();
}

class _AppLayOutState extends State<AppLayOut> {
  @override
  Widget build(BuildContext context) {
    final appCubit = BlocProvider.of<AppCubit>(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              body: PopScope(
                canPop: appCubit.currentIndex != 0 ? false : true,
                onPopInvoked: (result) {
                  appCubit.changeBottomNavigationBarIndex(0);
                },
                child: BottomNavBar(),
          )),
        );
      },
    );
  }
}
