import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:loan_app/controllers/homeController.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/shared/components/components.dart';
import 'package:loan_app/shared/components/styles/colors.dart';
import 'package:loan_app/shared/components/styles/texts.dart';
import 'package:loan_app/shared/constants.dart';
import 'package:loan_app/views/home/request_screen.dart';

import '../../models/loan_model.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (loancontroller)=>
      Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          title: Text('Loan'),
        ),
        body: SafeArea(
          top: true,
          minimum: EdgeInsets.only(top: 30),
          child: Column(
            children: [
             
              Expanded(
                  child: Container(
             
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(55)),
                    color: backgroundColor),
                    
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                          child: ListTile(
                            title: Text('John Doe',style: bigTextStyle.copyWith(color: primaryTextColor),),
                            subtitle: Text('1234567890'),
                            trailing: Image.asset('assets/images/profile.png',
                            width: 65,height: 65,
                            ),
                          ),
                        ),

                        Center(child: Text('2.000\$',style: bigTextStyle.copyWith(fontSize: 28,color: Colors.black),)),
                        SizedBox(height: 10,),
                                                Center(child: Text('12.Nov.2022',style: smallTextStyle.copyWith(fontSize: 16,color: Color(0xff767D88)),)),
                        SizedBox(height: 30,),
                       
                        Text('Transaction ',style: bigTextStyle.copyWith(color: primaryTextColor)),
                        SizedBox(height: 20,),

                        Expanded(child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                            thickness: 1,
                          ),
                          itemBuilder: ((context, index) =>
                        defaultLoanCard(LoanModel(
                          icon: loancontroller.loanIcons[index],
                          number: '1234567890',
                          date: 'December 28, 2021',
                          amount: '\$100.00'

                        ),
                        
                        )

                        

                         ),
                         itemCount: loancontroller.loanIcons.length,)),
                                                 SizedBox(height: 30,),

defaultButton( 'Pay your loan',context: context,screen: RoutesClass.getRequestRoute()),
                      ],
                    ),
                    ),
      ),
      ]),
      )
      ));
      
  }
}