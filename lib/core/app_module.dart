import 'package:bankingapp/app/dashboard/bloc/dashboard_cubit.dart';
import 'package:bankingapp/app/send_money/bloc/send_money_cubit.dart';
import 'package:bankingapp/app/transactions/bloc/transactions_cubit.dart';
import 'package:bankingapp/core/app_db.dart';
import 'package:bankingapp/core/app_db_interface.dart';
import 'package:bankingapp/data/account_dao.dart';
import 'package:bankingapp/data/account_repo.dart';
import 'package:bankingapp/data/transaction_client.dart';
import 'package:bankingapp/data/transaction_dao.dart';
import 'package:bankingapp/data/transaction_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add<AppDatabaseApi>(AppDatabase.new);

    i.addInstance(Dio());
    i.add(DashboardCubit.new);
    i.add(SendMoneyCubit.new);
    i.add(TransactionsCubit.new);

    i.add<TransactionRepo>(TransactionRepoImpl.new);
    i.add<AccountRepo>(AccountRepoImpl.new);

    i.add(TransactionClient.new);
    i.add(TransactionDao.new);
    i.add(AccountDao.new);
  }
}
