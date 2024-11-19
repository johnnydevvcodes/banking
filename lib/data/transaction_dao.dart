import 'package:bankingapp/core/app_db_interface.dart';
import 'package:bankingapp/data/transaction_response.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sembast/sembast.dart';

class TransactionDao {
  final _transactionStore = intMapStoreFactory.store('transactions');

  Future<Database> get _db async =>
      await Modular.get<AppDatabaseApi>().database;

  Future saveTransaction(TransactionResponse transaction) async {
    return _transactionStore.add(await _db, transaction.toMap());
  }

  Future<List<TransactionResponse>> getTransactions() async {
    final finder = Finder(sortOrders: [SortOrder('id')]);

    final snapshots = await _transactionStore.find(
      await _db,
      finder: finder,
    );
    TransactionResponse toExercise(s) =>
        TransactionResponseMapper.fromMap(s.value);
    if (snapshots.isEmpty) return [];
    final transactions = snapshots.map(toExercise).toList();
    transactions.sort((a, b) => a.id.compareTo(b.id));
    return transactions;
  }

}
