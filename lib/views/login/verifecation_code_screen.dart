import 'package:flutter/material.dart';
import 'package:loan_app/shared/components/components.dart';
import 'package:loan_app/shared/components/styles/colors.dart';
import 'package:loan_app/views/login/setup_account_screen.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        toolbarHeight: 60,
        title: Text('Verification Code'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(55)),
                    color: backgroundColor
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 36),
                      child: Text(
                        'We sent OTP code to verify your number',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Expanded(
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          child: GridView.count(
                              crossAxisCount: 4,
                              crossAxisSpacing: 20,
                              children: List.generate(
                                  4,
                                  (index) => defaultButton(width:64, '6',
                                      height: 64, radius: 15))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 34,
                    ),
                    defaultButton( 'Continue',
                        context: context, screen: SetupAccountScreen()),
                    SizedBox(
                      height: 29,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Not received code? ',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                             color: primaryTextColor
                              )),
                      TextSpan(
                          text: 'Resend',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: primaryColor))
                    ]))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
