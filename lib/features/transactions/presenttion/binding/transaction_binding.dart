import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loan_app/features/transactions/data/dataresoueces/transaction_remote_data_source.dart';
import 'package:loan_app/features/transactions/data/repositories/transaction_repositoryImp.dart';
import 'package:loan_app/features/transactions/domain/repositories/transactions_repository.dart';
import 'package:loan_app/features/transactions/domain/usecases/add_debt_usecase.dart';
import 'package:loan_app/features/transactions/presenttion/controllers/transaction_controller.dart';
import 'package:loan_app/features/users/presenttion/binding/all_users_binding.dart';

import '../../../../core/network/network_info.dart';

class TransactionBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkInfoImp(connectionChecker: Get.find()));
    Get.lazyPut(() => InternetConnectionChecker());
    Get.put<TransactionRemoteDataSource>(TransactionRemoteImp(dio: Get.find()));
    Get.put<Dio>(Dio());
    Get.put<InternetConnectionChecker>(InternetConnectionChecker());
    Get.put<NetworkInfo>(NetworkInfoImp(connectionChecker: Get.find()));
    Get.put<TransactionsRepository>(TransactionRepositoryImp( transactionRemoteDataSource: Get.find(), networkInfo: Get.find()));
    Get.put<TransactionUseCase>(TransactionUseCase(transactionsRepository: Get.find()));
    Get.put(
      TransactionController(
        transactionUseCase: TransactionUseCase(
          transactionsRepository: TransactionRepositoryImp(
              transactionRemoteDataSource: TransactionRemoteImp(dio: Dio()),
              networkInfo: NetworkInfoImp(connectionChecker: Get.find())),
        ),

      ),
    );
  }

}
