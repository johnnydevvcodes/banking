import 'package:bankingapp/core/app_state.dart';
import 'package:bankingapp/data/account_repo.dart';
import 'package:bankingapp/data/transaction_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendMoneyCubit extends Cubit<AppState> {
  SendMoneyCubit(
    this.transactionRepo,
    this.accountRepo,
  ) : super(InitialState());

  final TransactionRepo transactionRepo;
  final AccountRepo accountRepo;

  Future sendMoney(num amount) async {
    emit(LoadingState());

    //check if money is sufficient
    final balance = await accountRepo.getAccount();
    final isSufficient = amount <= balance;
    if (!isSufficient) return emit(ErrorState(message: 'Insufficient Balance 💸'));

    final newTransaction = await transactionRepo.sendMoney(amount);
    emit(DataState(value: newTransaction != null));
  }
}
