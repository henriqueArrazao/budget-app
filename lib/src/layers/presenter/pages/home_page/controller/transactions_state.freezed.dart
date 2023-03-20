// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<TransactionModel> transactionsList, double spentAmount)
        loaded,
    required TResult Function(String? message) error,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<TransactionModel> transactionsList, double spentAmount)?
        loaded,
    TResult? Function(String? message)? error,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<TransactionModel> transactionsList, double spentAmount)?
        loaded,
    TResult Function(String? message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadedTransactionsState value) loaded,
    required TResult Function(ErrorTransactionsState value) error,
    required TResult Function(LoadingTransactionsState value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadedTransactionsState value)? loaded,
    TResult? Function(ErrorTransactionsState value)? error,
    TResult? Function(LoadingTransactionsState value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadedTransactionsState value)? loaded,
    TResult Function(ErrorTransactionsState value)? error,
    TResult Function(LoadingTransactionsState value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsStateCopyWith<$Res> {
  factory $TransactionsStateCopyWith(
          TransactionsState value, $Res Function(TransactionsState) then) =
      _$TransactionsStateCopyWithImpl<$Res, TransactionsState>;
}

/// @nodoc
class _$TransactionsStateCopyWithImpl<$Res, $Val extends TransactionsState>
    implements $TransactionsStateCopyWith<$Res> {
  _$TransactionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadedTransactionsStateCopyWith<$Res> {
  factory _$$LoadedTransactionsStateCopyWith(_$LoadedTransactionsState value,
          $Res Function(_$LoadedTransactionsState) then) =
      __$$LoadedTransactionsStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TransactionModel> transactionsList, double spentAmount});
}

/// @nodoc
class __$$LoadedTransactionsStateCopyWithImpl<$Res>
    extends _$TransactionsStateCopyWithImpl<$Res, _$LoadedTransactionsState>
    implements _$$LoadedTransactionsStateCopyWith<$Res> {
  __$$LoadedTransactionsStateCopyWithImpl(_$LoadedTransactionsState _value,
      $Res Function(_$LoadedTransactionsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionsList = null,
    Object? spentAmount = null,
  }) {
    return _then(_$LoadedTransactionsState(
      transactionsList: null == transactionsList
          ? _value._transactionsList
          : transactionsList // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      spentAmount: null == spentAmount
          ? _value.spentAmount
          : spentAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$LoadedTransactionsState extends LoadedTransactionsState {
  const _$LoadedTransactionsState(
      {required final List<TransactionModel> transactionsList,
      required this.spentAmount})
      : _transactionsList = transactionsList,
        super._();

  final List<TransactionModel> _transactionsList;
  @override
  List<TransactionModel> get transactionsList {
    if (_transactionsList is EqualUnmodifiableListView)
      return _transactionsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionsList);
  }

  @override
  final double spentAmount;

  @override
  String toString() {
    return 'TransactionsState.loaded(transactionsList: $transactionsList, spentAmount: $spentAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedTransactionsState &&
            const DeepCollectionEquality()
                .equals(other._transactionsList, _transactionsList) &&
            (identical(other.spentAmount, spentAmount) ||
                other.spentAmount == spentAmount));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_transactionsList), spentAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedTransactionsStateCopyWith<_$LoadedTransactionsState> get copyWith =>
      __$$LoadedTransactionsStateCopyWithImpl<_$LoadedTransactionsState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<TransactionModel> transactionsList, double spentAmount)
        loaded,
    required TResult Function(String? message) error,
    required TResult Function() loading,
  }) {
    return loaded(transactionsList, spentAmount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<TransactionModel> transactionsList, double spentAmount)?
        loaded,
    TResult? Function(String? message)? error,
    TResult? Function()? loading,
  }) {
    return loaded?.call(transactionsList, spentAmount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<TransactionModel> transactionsList, double spentAmount)?
        loaded,
    TResult Function(String? message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(transactionsList, spentAmount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadedTransactionsState value) loaded,
    required TResult Function(ErrorTransactionsState value) error,
    required TResult Function(LoadingTransactionsState value) loading,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadedTransactionsState value)? loaded,
    TResult? Function(ErrorTransactionsState value)? error,
    TResult? Function(LoadingTransactionsState value)? loading,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadedTransactionsState value)? loaded,
    TResult Function(ErrorTransactionsState value)? error,
    TResult Function(LoadingTransactionsState value)? loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedTransactionsState extends TransactionsState {
  const factory LoadedTransactionsState(
      {required final List<TransactionModel> transactionsList,
      required final double spentAmount}) = _$LoadedTransactionsState;
  const LoadedTransactionsState._() : super._();

  List<TransactionModel> get transactionsList;
  double get spentAmount;
  @JsonKey(ignore: true)
  _$$LoadedTransactionsStateCopyWith<_$LoadedTransactionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorTransactionsStateCopyWith<$Res> {
  factory _$$ErrorTransactionsStateCopyWith(_$ErrorTransactionsState value,
          $Res Function(_$ErrorTransactionsState) then) =
      __$$ErrorTransactionsStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ErrorTransactionsStateCopyWithImpl<$Res>
    extends _$TransactionsStateCopyWithImpl<$Res, _$ErrorTransactionsState>
    implements _$$ErrorTransactionsStateCopyWith<$Res> {
  __$$ErrorTransactionsStateCopyWithImpl(_$ErrorTransactionsState _value,
      $Res Function(_$ErrorTransactionsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ErrorTransactionsState(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ErrorTransactionsState extends ErrorTransactionsState {
  const _$ErrorTransactionsState({required this.message}) : super._();

  @override
  final String? message;

  @override
  String toString() {
    return 'TransactionsState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorTransactionsState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorTransactionsStateCopyWith<_$ErrorTransactionsState> get copyWith =>
      __$$ErrorTransactionsStateCopyWithImpl<_$ErrorTransactionsState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<TransactionModel> transactionsList, double spentAmount)
        loaded,
    required TResult Function(String? message) error,
    required TResult Function() loading,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<TransactionModel> transactionsList, double spentAmount)?
        loaded,
    TResult? Function(String? message)? error,
    TResult? Function()? loading,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<TransactionModel> transactionsList, double spentAmount)?
        loaded,
    TResult Function(String? message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadedTransactionsState value) loaded,
    required TResult Function(ErrorTransactionsState value) error,
    required TResult Function(LoadingTransactionsState value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadedTransactionsState value)? loaded,
    TResult? Function(ErrorTransactionsState value)? error,
    TResult? Function(LoadingTransactionsState value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadedTransactionsState value)? loaded,
    TResult Function(ErrorTransactionsState value)? error,
    TResult Function(LoadingTransactionsState value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorTransactionsState extends TransactionsState {
  const factory ErrorTransactionsState({required final String? message}) =
      _$ErrorTransactionsState;
  const ErrorTransactionsState._() : super._();

  String? get message;
  @JsonKey(ignore: true)
  _$$ErrorTransactionsStateCopyWith<_$ErrorTransactionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingTransactionsStateCopyWith<$Res> {
  factory _$$LoadingTransactionsStateCopyWith(_$LoadingTransactionsState value,
          $Res Function(_$LoadingTransactionsState) then) =
      __$$LoadingTransactionsStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingTransactionsStateCopyWithImpl<$Res>
    extends _$TransactionsStateCopyWithImpl<$Res, _$LoadingTransactionsState>
    implements _$$LoadingTransactionsStateCopyWith<$Res> {
  __$$LoadingTransactionsStateCopyWithImpl(_$LoadingTransactionsState _value,
      $Res Function(_$LoadingTransactionsState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingTransactionsState extends LoadingTransactionsState {
  const _$LoadingTransactionsState() : super._();

  @override
  String toString() {
    return 'TransactionsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingTransactionsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<TransactionModel> transactionsList, double spentAmount)
        loaded,
    required TResult Function(String? message) error,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<TransactionModel> transactionsList, double spentAmount)?
        loaded,
    TResult? Function(String? message)? error,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<TransactionModel> transactionsList, double spentAmount)?
        loaded,
    TResult Function(String? message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadedTransactionsState value) loaded,
    required TResult Function(ErrorTransactionsState value) error,
    required TResult Function(LoadingTransactionsState value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadedTransactionsState value)? loaded,
    TResult? Function(ErrorTransactionsState value)? error,
    TResult? Function(LoadingTransactionsState value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadedTransactionsState value)? loaded,
    TResult Function(ErrorTransactionsState value)? error,
    TResult Function(LoadingTransactionsState value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingTransactionsState extends TransactionsState {
  const factory LoadingTransactionsState() = _$LoadingTransactionsState;
  const LoadingTransactionsState._() : super._();
}
