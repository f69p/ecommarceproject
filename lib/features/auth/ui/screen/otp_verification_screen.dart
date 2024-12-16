import 'dart:async';

import 'package:ecommarceproject/app/app_colors.dart';
import 'package:ecommarceproject/app/app_constants.dart';
import 'package:ecommarceproject/features/auth/ui/screen/complete_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/app_logo_widget.dart';

class OtpVarificationScreen extends StatefulWidget {
  const OtpVarificationScreen({super.key});

  static const String name = '/email-verification';

  @override
  State<OtpVarificationScreen> createState() => _EmailVarificationScreenState();
}

class _EmailVarificationScreenState extends State<OtpVarificationScreen> {
  final TextEditingController _otplTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxInt _remainingTime = AppConstants.resendOtpTimeOutInSecs.obs;
  late Timer timer;
  RxBool _enableResendCodeButton = false.obs;

  @override
  void initState() {
    super.initState();
    _startResendCodeTimer();
  }

  void _startResendCodeTimer() {
    _enableResendCodeButton.value = false;
    _remainingTime.value = AppConstants.resendOtpTimeOutInSecs;
    Timer.periodic(const Duration(seconds: 1), (t) {
      _remainingTime.value--;
      if (_remainingTime.value == 0) {
        t.cancel();
        _enableResendCodeButton.value = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80),
                const AppLogoWidgets(),
                const SizedBox(height: 24),
                Text('Enter OTP Code',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text('A 6 Digit OTP Code has been Sent',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey)),
                const SizedBox(height: 12),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    activeColor: AppColors.themColor,
                    inactiveColor: AppColors.themColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  appContext: context,
                  controller: _otplTEController,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    //if (_formKey.currentState!.validate()) {}
                    Navigator.pushReplacementNamed(context, CompleteProfileScreen.name);
                  },
                  child: const Text('Next'),
                ),
                const SizedBox(height: 24),
                Obx(
                  () => Visibility(
                    visible: !_enableResendCodeButton.value,
                    child: RichText(
                      text: TextSpan(
                        text: 'This code will be expire in ',
                        style: const TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: '${_remainingTime}s',
                            style: TextStyle(
                              color: AppColors.themColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: _enableResendCodeButton.value,
                    child: TextButton(
                      onPressed: () {
                        _startResendCodeTimer();
                      },
                      child: const Text('Resend Code'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
