import 'dart:async';

import 'package:ecommarceproject/app/app_colors.dart';
import 'package:ecommarceproject/app/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/app_logo_widget.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  static const String name = '/complete_profile_screen';

  @override
  State<CompleteProfileScreen> createState() => _EmailVarificationScreenState();
}

class _EmailVarificationScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNamelTEController = TextEditingController();
  final TextEditingController _lastNamelTEController = TextEditingController();
  final TextEditingController _mobilelTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingTEController = TextEditingController();
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

            child: Column(
              children: [
                const SizedBox(height: 80),
                const AppLogoWidgets(
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 24),
                Text('Complete Profile',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text('Get Started with Your details',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey)),
                const SizedBox(height: 12),
              _buildForm(),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                     if (_formKey.currentState!.validate()) {}
                  },
                  child: const Text('Complete'),
                ),
                const SizedBox(height: 24),

              ],
            ),
          ),
        ),
    );

  }
  Widget _buildForm(){
    return Form(
      key: _formKey,
      child: Column(
       children: [
         TextFormField(
           autovalidateMode: AutovalidateMode.onUserInteraction,
           controller: _firstNamelTEController,
           decoration:const InputDecoration(
             hintText: 'First Name',
           ),
           validator:(String?value){
             if(value?.trim().isEmpty??true){
               return 'Enter Your First Name';
             }
           },
         ),
         const SizedBox(height: 8),
         TextFormField(
           autovalidateMode: AutovalidateMode.onUserInteraction,
           controller: _lastNamelTEController,
           decoration:const InputDecoration(
             hintText: 'Last Name',
           ),
           validator:(String?value){
             if(value?.trim().isEmpty??true){
               return 'Enter Your Last Name';
             }
           },
         ),
         const SizedBox(height: 8),
         TextFormField(
           autovalidateMode: AutovalidateMode.onUserInteraction,
           controller: _mobilelTEController,
           keyboardType: TextInputType.phone,
           maxLength: 11,
           decoration:const InputDecoration(
             hintText: 'Mobile',
           ),
           validator:(String?value){
             if(value?.trim().isEmpty??true){
               return 'Enter Your Mobile Number';
             }
             if(RegExp(r'^01[3-9]\d{8}$').hasMatch(value!)==false){
               return 'Enter valid mobile number';
             }
             return null;
           },

         ),
         const SizedBox(height: 8),
         TextFormField(
           autovalidateMode: AutovalidateMode.onUserInteraction,
           controller: _cityTEController,
           decoration:const InputDecoration(
             hintText: 'City',
           ),
           validator:(String?value){
             if(value?.trim().isEmpty??true){
               return 'Enter Your City';
             }
           },
         ),
         const SizedBox(height: 8),
         TextFormField(
           autovalidateMode: AutovalidateMode.onUserInteraction,
           controller: _shippingTEController,
           maxLines: 4,
           decoration:const InputDecoration(

             hintText: 'Shipping Address',
           ),
           validator:(String?value){
             if(value?.trim().isEmpty??true){
               return 'Enter your Shipping Address';
             }
           },
         ),
         const SizedBox(height: 8),
       ],
      ),);
  }
  void dispose(){
    _firstNamelTEController.dispose();
    _lastNamelTEController.dispose();
    _mobilelTEController.dispose();
    _cityTEController.dispose();
    _shippingTEController.dispose();
    super.dispose();
  }
}

