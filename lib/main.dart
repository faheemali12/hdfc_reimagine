import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:hdfc_reimagine/features/splash/splash_screen.dart';
import 'package:hdfc_reimagine/routes/app_routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://qbtoiqfyskompwicorvz.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFidG9pcWZ5c2tvbXB3aWNvcnZ6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA3MzYxOTYsImV4cCI6MjA1NjMxMjE5Nn0.ZF3K-M_kkSH-shmRSjFPwvKCoHNZAhLTNfmk4iyWq8A',
  );
  runApp(const MyApp());
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
