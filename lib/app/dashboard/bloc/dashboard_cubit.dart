import 'package:bankingapp/core/app_state.dart';
import 'package:bankingapp/data/account_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<AppState> {
  DashboardCubit(this.accountRepo) : super(InitialState());

  final AccountRepo accountRepo;

  Future initialize() async {
    emit(LoadingState());
    var balance = await accountRepo.getAccount();

    if (balance <= 0) {
      await accountRepo.initializeAccount();
      balance = await accountRepo.getAccount();
    }

    emit(DataState(value: balance));
  }
}
