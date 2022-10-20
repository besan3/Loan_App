import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/shared/components/components.dart';
import 'package:loan_app/shared/components/styles/colors.dart';
import 'package:loan_app/views/login/verifecation_code_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:36),
                  child: Image.asset('assets/images/logo.png',
                  height: 158,
                  width: 158,
                  ),
                ),
              ),
              SizedBox(height: 36,),
              Center(
                child: Text('Sign in',
                style: TextStyle(
                  color: primaryTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
                ),
              ),
              SizedBox(height: 29,),

                Text('Enter your phone number',
              style: TextStyle(
                color: primaryTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w400
              ),
              ),
SizedBox(height: 15,),
              IntlPhoneField(
    decoration: InputDecoration(
 
        labelText: 'Enter your  Number',
        labelStyle: TextStyle(
          color: Color(0xffA5A5A5),
          fontSize: 16,
          fontWeight: FontWeight.w400
 
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xffCBD4EB),
            width: 1,),
        ),
    ),
    initialCountryCode: 'IN',dropdownIconPosition: IconPosition.trailing,flagsButtonPadding: EdgeInsets.symmetric(horizontal: 20),
    onChanged: (phone) {
        print(phone.completeNumber);
    },
),
SizedBox(height: 30,),
defaultButton('Continue',
context: context,screen: RoutesClass.getVerificationRoute()

)
            ],
          ),
        ),
      ),
    );
  }
}