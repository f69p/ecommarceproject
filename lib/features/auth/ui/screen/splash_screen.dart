import 'package:ecommarceproject/app/assets_path.dart';
import 'package:ecommarceproject/features/auth/ui/screen/email_varification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/app_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    _moveToNextScreen();
  }



  Future<void>_moveToNextScreen() async{
    await Future.delayed(const Duration(seconds: 2),);
    Navigator.pushReplacementNamed(context, EmailVarificationScreen.name);
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           const Spacer(),
                 AppLogoWidgets(),
            const Spacer(),
              const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}

