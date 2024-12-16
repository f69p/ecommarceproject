
import 'package:ecommarceproject/app/app_theme_data.dart';
import 'package:ecommarceproject/features/auth/ui/screen/complete_profile_screen.dart';
import 'package:ecommarceproject/features/auth/ui/screen/email_varification_screen.dart';
import 'package:ecommarceproject/features/auth/ui/screen/otp_verification_screen.dart';
import 'package:ecommarceproject/features/auth/ui/screen/splash_screen.dart';

import 'package:flutter/material.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      routes: {
        '/':(context)=>const SplashScreen(),
        EmailVarificationScreen.name:(context)=>
            const EmailVarificationScreen(),
        OtpVarificationScreen.name:(context)=>
            const OtpVarificationScreen(),
        CompleteProfileScreen.name:(context)=>
    const CompleteProfileScreen(),
      },
    );
  }
}
