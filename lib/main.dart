import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hdfc_reimagine/features/splash/splash_screen.dart';
import 'package:hdfc_reimagine/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // This is essential
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'HDFC ',
          home: SplashScreen(),
          initialRoute: AppRoutes.splash,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
