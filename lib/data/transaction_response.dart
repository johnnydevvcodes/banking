import 'package:bankingapp/core/transaction_entity.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'transaction_response.mapper.dart';

@MappableClass()
class TransactionResponse extends TransactionEntity
    with TransactionResponseMappable {
  TransactionResponse({
    required super.id,
    required super.amount,
    required super.created,
  });
}
