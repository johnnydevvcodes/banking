import 'package:bankingapp/app/transactions/transactions_cubit.dart';
import 'package:bankingapp/core/app_state.dart';
import 'package:bankingapp/core/transaction_entity.dart';
import 'package:bankingapp/data/transaction_repo.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionRepo extends Mock implements TransactionRepo {}

void main() {
  const name = 'TransactionsCubit';
  late TransactionRepo transactionRepo;
  late TransactionsCubit cubit;

  setUp(() async {
    transactionRepo = MockTransactionRepo();
    cubit = TransactionsCubit(transactionRepo);
  });

  group('test $name', () {
    blocTest(
      'check $name, should emit DataState on getTransactions',
      setUp: () async {
        when(() => transactionRepo.getTransactions())
            .thenAnswer((invocation) async => await Future.value([
                  TransactionEntity(id: 1, amount: 999, created: 9999),
                  TransactionEntity(id: 1, amount: 999, created: 9999),
                ]));
      },
      build: () => cubit,
      act: (c) => c.getTransactions(),
      expect: () => [
        isA<LoadingState>(),
        isA<DataState<List<TransactionEntity>>>(),
      ],
    );
  });
}
