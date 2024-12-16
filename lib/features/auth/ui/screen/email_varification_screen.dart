
import 'package:ecommarceproject/features/auth/ui/screen/otp_verification_screen.dart';
import 'package:ecommarceproject/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailVarificationScreen extends StatefulWidget {
  const EmailVarificationScreen({super.key});

  static const String name='/otp-verification';

  @override
  State<EmailVarificationScreen> createState() => _EmailVarificationScreenState();
}

class _EmailVarificationScreenState extends State<EmailVarificationScreen> {
  final TextEditingController _emailTEController=TextEditingController();
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child:Form(
            key: _formKey,
            child: Column(

              children: [
             const SizedBox(height: 80),
                const AppLogoWidgets(),
                const SizedBox(height: 24),
                Text('Welcome Back',
                    style:Theme.of(context).textTheme.titleLarge
                ),
                const SizedBox(height: 8),
                Text('Please Enter Your Email address',
                    style:Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey
                    )
                ),
                const SizedBox(height: 12),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailTEController,
                  decoration: const InputDecoration(

                    hintText: "Email Address",
                  ),
                  validator: (String? value){
                    if(value?.trim().isEmpty??true){
                      return 'Enter your email address';
                    }
                    if(EmailValidator.validate(value!)==false){
                      return 'Enter your valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(

                  onPressed: (){
                   // if(_formKey.currentState!.validate()){}
                    Navigator.pushReplacementNamed(context, OtpVarificationScreen.name);
                  }, child: const Text('Next'),),
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}
