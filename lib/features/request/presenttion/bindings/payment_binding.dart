import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loan_app/features/request/data/datasources/payment_remote_data_source.dart';
import 'package:loan_app/features/request/data/repositories/payment_repositoryImp.dart';
import 'package:loan_app/features/request/domain/usecases/pay_loan_usecase.dart';
import 'package:loan_app/features/request/presenttion/controller/request_controller.dart';
import 'package:loan_app/features/transactions/data/dataresoueces/transaction_remote_data_source.dart';
import 'package:loan_app/features/transactions/data/repositories/transaction_repositoryImp.dart';
import 'package:loan_app/features/transactions/domain/repositories/transactions_repository.dart';
import 'package:loan_app/features/transactions/domain/usecases/add_debt_usecase.dart';
import 'package:loan_app/features/transactions/presenttion/controllers/transaction_controller.dart';
import 'package:loan_app/features/users/presenttion/binding/all_users_binding.dart';

import '../../../../core/network/network_info.dart';

class PaymentBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkInfoImp(connectionChecker: Get.find()));
    Get.lazyPut(() => InternetConnectionChecker());
    Get.lazyPut<PaymentRemoteDataSource>(() => PaymentRemoteImp(dio: Get.find()));
    Get.lazyPut(()=>Dio());
    Get.lazyPut(()=>InternetConnectionChecker());
    Get.lazyPut(()=>NetworkInfoImp(connectionChecker: Get.find()));
    Get.lazyPut(()=>PaymentRepositoryImp( paymentRemoteDataSource: Get.find(), networkInfo: Get.find()));
    Get.lazyPut(() =>PayLoanUseCase(paymentRepository: Get.find()));
    Get.put(
      RequestController(
        payLoanUseCase: PayLoanUseCase(
          paymentRepository: PaymentRepositoryImp(
              paymentRemoteDataSource: PaymentRemoteImp(dio: Dio()),
              networkInfo: NetworkInfoImp(connectionChecker: Get.find())),
        ),

      ),
    );
  }

}
