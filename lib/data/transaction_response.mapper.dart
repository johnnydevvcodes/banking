// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'transaction_response.dart';

class TransactionResponseMapper extends ClassMapperBase<TransactionResponse> {
  TransactionResponseMapper._();

  static TransactionResponseMapper? _instance;
  static TransactionResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TransactionResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TransactionResponse';

  static int _$id(TransactionResponse v) => v.id;
  static const Field<TransactionResponse, int> _f$id = Field('id', _$id);
  static num _$amount(TransactionResponse v) => v.amount;
  static const Field<TransactionResponse, num> _f$amount =
      Field('amount', _$amount);
  static int _$created(TransactionResponse v) => v.created;
  static const Field<TransactionResponse, int> _f$created =
      Field('created', _$created);

  @override
  final MappableFields<TransactionResponse> fields = const {
    #id: _f$id,
    #amount: _f$amount,
    #created: _f$created,
  };

  static TransactionResponse _instantiate(DecodingData data) {
    return TransactionResponse(
        id: data.dec(_f$id),
        amount: data.dec(_f$amount),
        created: data.dec(_f$created));
  }

  @override
  final Function instantiate = _instantiate;

  static TransactionResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TransactionResponse>(map);
  }

  static TransactionResponse fromJson(String json) {
    return ensureInitialized().decodeJson<TransactionResponse>(json);
  }
}

mixin TransactionResponseMappable {
  String toJson() {
    return TransactionResponseMapper.ensureInitialized()
        .encodeJson<TransactionResponse>(this as TransactionResponse);
  }

  Map<String, dynamic> toMap() {
    return TransactionResponseMapper.ensureInitialized()
        .encodeMap<TransactionResponse>(this as TransactionResponse);
  }

  TransactionResponseCopyWith<TransactionResponse, TransactionResponse,
          TransactionResponse>
      get copyWith => _TransactionResponseCopyWithImpl(
          this as TransactionResponse, $identity, $identity);
  @override
  String toString() {
    return TransactionResponseMapper.ensureInitialized()
        .stringifyValue(this as TransactionResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TransactionResponseMapper.ensureInitialized()
                .isValueEqual(this as TransactionResponse, other));
  }

  @override
  int get hashCode {
    return TransactionResponseMapper.ensureInitialized()
        .hashValue(this as TransactionResponse);
  }
}

extension TransactionResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TransactionResponse, $Out> {
  TransactionResponseCopyWith<$R, TransactionResponse, $Out>
      get $asTransactionResponse =>
          $base.as((v, t, t2) => _TransactionResponseCopyWithImpl(v, t, t2));
}

abstract class TransactionResponseCopyWith<$R, $In extends TransactionResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, num? amount, int? created});
  TransactionResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TransactionResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TransactionResponse, $Out>
    implements TransactionResponseCopyWith<$R, TransactionResponse, $Out> {
  _TransactionResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TransactionResponse> $mapper =
      TransactionResponseMapper.ensureInitialized();
  @override
  $R call({int? id, num? amount, int? created}) => $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (amount != null) #amount: amount,
        if (created != null) #created: created
      }));
  @override
  TransactionResponse $make(CopyWithData data) => TransactionResponse(
      id: data.get(#id, or: $value.id),
      amount: data.get(#amount, or: $value.amount),
      created: data.get(#created, or: $value.created));

  @override
  TransactionResponseCopyWith<$R2, TransactionResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TransactionResponseCopyWithImpl($value, $cast, t);
}
