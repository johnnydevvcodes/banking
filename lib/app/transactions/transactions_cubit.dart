import 'package:bankingapp/core/app_state.dart';
import 'package:bankingapp/data/transaction_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsCubit extends Cubit<AppState> {
  final TransactionRepo transactionRepo;
  TransactionsCubit(this.transactionRepo) : super(InitialState());
  
  Future getTransactions() async {
    emit(LoadingState());
    final transactions = await transactionRepo.getTransactions();
    emit(DataState(value: transactions));
  }
}
