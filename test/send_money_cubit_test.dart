import 'package:bankingapp/app/send_money/bloc/send_money_cubit.dart';
import 'package:bankingapp/core/app_state.dart';
import 'package:bankingapp/core/transaction_entity.dart';
import 'package:bankingapp/data/account_repo.dart';
import 'package:bankingapp/data/transaction_repo.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAccountRepo extends Mock implements AccountRepo {}

class MockTransactionRepo extends Mock implements TransactionRepo {}

void main() {
  const name = 'SendMoneyCubit';
  late AccountRepo accountRepo;
  late SendMoneyCubit cubit;
  late TransactionRepo transactionRepo;

  setUp(() async {
    accountRepo = MockAccountRepo();
    transactionRepo = MockTransactionRepo();
    cubit = SendMoneyCubit(transactionRepo, accountRepo);
  });

  group('test $name', () {
    blocTest(
      'check $name, should emit DataState on sendMoney',
      setUp: () async {
        when(() => accountRepo.getAccount())
            .thenAnswer((invocation) async => await Future.value(5000));
        when(() => transactionRepo.sendMoney(any()))
            .thenAnswer((invocation) async => await Future.value(
                  TransactionEntity(amount: 12, id: 1, created: 23),
                ));
      },
      build: () => cubit,
      act: (c) => c.sendMoney(100),
      expect: () => [
        isA<LoadingState>(),
        isA<DataState<bool>>(),
      ],
    );
    blocTest(
      'check $name, should emit ErrorState (Insufficient Balance) on sendMoney',
      setUp: () async {
        when(() => accountRepo.getAccount())
            .thenAnswer((invocation) async => await Future.value(100));
        when(() => transactionRepo.sendMoney(any()))
            .thenAnswer((invocation) async => await Future.value(
                  TransactionEntity(amount: 200, id: 1, created: 23),
                ));
      },
      build: () => cubit,
      act: (c) => c.sendMoney(200),
      expect: () => [
        isA<LoadingState>(),
        isA<ErrorState<String>>(),
      ],
    );
  });
}
