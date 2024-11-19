import 'package:bankingapp/core/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<AppState> {
  DashboardCubit() : super(InitialState()) {
    initialize();
  }

  Future initialize() async {
    return Future.value();
  }
}
