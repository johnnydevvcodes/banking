import 'package:bankingapp/app/dashboard/dashboard_cubit.dart';
import 'package:bankingapp/core/app_state.dart';
import 'package:bankingapp/data/account_repo.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAccountRepo extends Mock implements AccountRepo {}

void main() {
  const name = 'DashboardCubit';
  late AccountRepo accountRepo;
  late DashboardCubit cubit;

  setUp(() async {
    accountRepo = MockAccountRepo();
    cubit = DashboardCubit(accountRepo);
  });

  group('test $name', () {
    blocTest(
      'check $name, should emit DataState on initialize',
      setUp: () async {
        when(() => accountRepo.getAccount())
            .thenAnswer((invocation) async => await Future.value(5000));
      },
      build: () => cubit,
      act: (c) => c.initialize(),
      expect: () => [
        isA<LoadingState>(),
        isA<DataState<num>>(),
      ],
    );
  });
}
