import 'package:dio/dio.dart';
import 'package:bankingapp/app/dashboard/dashboard_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addInstance(Dio());
    i.add(DashboardCubit.new);
  }
}
