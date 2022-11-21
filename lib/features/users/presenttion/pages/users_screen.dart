import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loan_app/core/network/network_info.dart';
import 'package:loan_app/features/users/data/datasources/all_users_remote_data_source.dart';
import 'package:loan_app/features/users/data/repositories/all_users_repositoryImp.dart';
import 'package:loan_app/features/users/domain/usecases/get_all_users_usecase.dart';
import 'package:loan_app/features/users/presenttion/controller/all_users_controller.dart';
import 'package:loan_app/core/app_images/app_images.dart';
import 'package:loan_app/core/colors/app_colors.dart';
import '../../../../core/app_texts/app_texts.dart';
import '../../../../core/widgets/shared_widgets.dart';
import '../../../home/presenttion/controller/homeController.dart';
import '../../../home/models/home_model.dart';
import '../../../home/presenttion/widgets/home_widget.dart';
import '../../../loan/presenttion/pages/loan_screen.dart';
import '../../data/datasources/all_users_local_datasource.dart';

class UsersScreen extends StatelessWidget {
   UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllUsersController>(
        init: AllUsersController(getAllUsersUseCase: GetAllUsersUseCase(AllUsersRepositoryImp(
          usersLocalDataSource:UsersLocalDataSource() ,
          usersRemoteDataSource:UsersRemoteDataSource(dio: Dio()) ,
          networkInfo:NetworkInfoImp(InternetConnectionChecker())

        ))) ,
        builder: (usersController) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.primaryColor,
                elevation: 0.0,
                title: Text(AppTexts.users.tr),
                actions: [
              
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(AppImages.filterIcon)
                      )
                ],
              ),
              backgroundColor: AppColors.primaryColor,
 
              body:SafeArea(
          top: true,
          minimum: EdgeInsets.only(top: 30.h),
          child: Column(
            children: [
             
              Expanded(
                  child: Container(
             
                padding: EdgeInsets.all(20.h.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(55.r)),
                    color: Get.isDarkMode?AppColors.primaryTextColor:Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      SizedBox(
                      height: 40.h,
                    ),
                    DefaultTextForm(textEditingController: TextEditingController(), textInputType: TextInputType.text, validator: ((value) => ''),
                        label:AppTexts.search.tr,hasPrefixIcon: true,iconData: Icons.search),
                    SizedBox(
                      height: 30.h,
                    ),
              /*    Expanded(child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 15.h,),
                    itemBuilder: ((context, index) =>  InkWell(
                      onTap: (() => Get.to(LoanScreen())),
                      child: Container(
                        width: 335.w,
                        height: 97.5.h,
                        child: Card(

                          child: ListTile(
                            leading: Image.asset(
                             usersController.allUsersModel!.data[index].image,
                              width: 65.w,
                              height: 65.h,
                            ),
                            title: Text(usersController.allUsersModel!.data[index].first_name+" "+usersController.allUsersModel!.data[index].last_name,style: context.theme.textTheme.bodyText1,),
                            subtitle: Text(usersController.allUsersModel!.data[index].phone_number,style: context.theme.textTheme.headline2,),
                          ),
                        ),
                      ),
                    )
                   ),
                   itemCount: 6,
                   ),
                   )*/

                    MaterialButton(
                      child: Card(
                        child: Text(
                          'get users'
                        ),
                      ),
                      onPressed: (){
                      usersController.getUsers();
                    },

                    )

                  ],
                ),
              )),
            ],
          ),
        ),);
        });
  }
}
