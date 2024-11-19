import 'package:bankingapp/data/account_dao.dart';

abstract class AccountRepo {
  Future<num> getAccount();
  Future<void> initializeAccount();
}

class AccountRepoImpl extends AccountRepo {
  final AccountDao accountDao;

  AccountRepoImpl(this.accountDao);

  @override
  Future<num> getAccount() {
    return accountDao.getAccount();
  }
  @override
  Future<void> initializeAccount() {
    return accountDao.initializeAccount();
  }
}
