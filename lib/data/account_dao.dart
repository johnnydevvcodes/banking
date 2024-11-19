import 'package:bankingapp/core/app_db_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sembast/sembast.dart';

class AccountDao {
  final _accountStore = intMapStoreFactory.store('accounts');

  Future<Database> get _db async =>
      await Modular.get<AppDatabaseApi>().database;

  Future initializeAccount() async {
    return _accountStore.add(await _db, {'id': '1', 'balance': 50000});
  }

  Future updateAccount(num newBalance) async {
    final finder = Finder(filter: Filter.equals('id', '1'));
    await _accountStore.update(
      await _db,
      {'id': '1', 'balance': newBalance},
      finder: finder,
    );
  }

  Future<num> getAccount() async {
    final finder = Finder(sortOrders: [SortOrder('id')]);

    final snapshots = await _accountStore.find(
      await _db,
      finder: finder,
    );
    try {
      return snapshots.firstOrNull?.value['balance'] as num;
    } catch (e) {
      return 0;
    }
  }
}
