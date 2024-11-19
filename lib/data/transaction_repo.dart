import 'package:bankingapp/core/transaction_entity.dart';
import 'package:bankingapp/data/account_dao.dart';
import 'package:bankingapp/data/transaction_client.dart';
import 'package:bankingapp/data/transaction_dao.dart';
import 'package:bankingapp/data/transaction_response.dart';
import 'package:dio/dio.dart';

abstract class TransactionRepo {
  Future<TransactionEntity?> sendMoney(num amount);
  Future<List<TransactionEntity>> getTransactions();
}

class TransactionRepoImpl extends TransactionRepo {
  TransactionRepoImpl(
    this.transactionClient,
    this.transactionDao,
    this.accountDao,
  );

  final TransactionClient transactionClient;
  final TransactionDao transactionDao;
  final AccountDao accountDao;

  @override
  Future<List<TransactionEntity>> getTransactions() async {
    try {
      List response = await transactionClient.getTransactions(userId: 1);
      if (response.isEmpty) return [];

      // Faker API doesn't allow updating the server,
      // hence get saved transactions on 200 OK response
      return transactionDao.getTransactions();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<TransactionEntity?> sendMoney(num amount) async {
    try {
      final response = await transactionClient.postTransaction(
        data: FormData.fromMap({
          'title': '1',
          'body': amount.toString(),
          'userId': 1,
        }),
      );

      if (response == null || response.isEmpty) return null;

      // Less the amount from account if 200 OK
      final balance = await accountDao.getAccount();
      final newBalance = balance - amount;
      await accountDao.updateAccount(newBalance);

      // Faker API doesn't allow updating the server,
      // hence, save the transaction on 200 OK response
      final transaction = TransactionResponse(
        id: DateTime.now().millisecondsSinceEpoch,
        created: DateTime.now().millisecondsSinceEpoch,
        amount: amount,
      );
      await transactionDao.saveTransaction(transaction);
      return transaction;
    } catch (e) {
      return null;
    }
  }
}
