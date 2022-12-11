import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loan_app/features/transactions/data/dataresoueces/transaction_remote_data_source.dart';
import 'package:loan_app/features/transactions/data/repositories/transaction_repositoryImp.dart';
import 'package:loan_app/features/transactions/domain/repositories/transactions_repository.dart';
import 'package:loan_app/features/transactions/domain/usecases/add_cred_usecase.dart';
import 'package:loan_app/features/transactions/domain/usecases/add_debt_usecase.dart';
import 'package:loan_app/features/transactions/presenttion/controllers/transaction_controller.dart';
import 'package:loan_app/features/users/presenttion/binding/all_users_binding.dart';

import '../../../../core/network/network_info.dart';

class TransactionBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TransactionRemoteDataSource>(() => TransactionRemoteImp(dio: Get.find()));
    Get.lazyPut<TransactionsRepository>(()=>TransactionRepositoryImp( transactionRemoteDataSource: Get.find(), networkInfo: Get.find()));
    Get.lazyPut<TransactionDrUseCase>(() =>TransactionDrUseCase(transactionsRepository: Get.find()));
    Get.lazyPut<TransactionCrUseCase>(() =>TransactionCrUseCase(transactionsRepository: Get.find()));
    Get.put(
      TransactionController(
        transactionUseCase: Get.find(), transactionCrUseCase: Get.find()

      ),
    );
  }

}
