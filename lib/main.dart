import 'package:clima/consts/typo.dart';
import 'package:clima/views/home_screen.dart';
import 'package:clima/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';

final navigatorKey = GlobalKey<NavigatorState>();
get appContext => navigatorKey.currentState!.context;
final logger = Logger();

void main() {
  runApp(Clima());
}

class Clima extends StatelessWidget {
  Clima({super.key});

  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: SplashScreen.id,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        name: HomeScreen.id,
        builder: (context, state) => HomeScreen(),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (context, child) => MaterialApp.router(
        theme: ThemeData(
            fontFamily: Typo.regular,
            bottomSheetTheme:
                BottomSheetThemeData(backgroundColor: Colors.transparent)),
        routerConfig: router,
      ),
    );
  }
}
