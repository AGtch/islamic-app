// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_player_timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewPlayerTimerState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timerInitial,
    required TResult Function(T timer) timerRunInProgress,
    required TResult Function() timerRunComplete,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timerInitial,
    TResult? Function(T timer)? timerRunInProgress,
    TResult? Function()? timerRunComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timerInitial,
    TResult Function(T timer)? timerRunInProgress,
    TResult Function()? timerRunComplete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerInitial<T> value) timerInitial,
    required TResult Function(TimerRunInProgress<T> value) timerRunInProgress,
    required TResult Function(TimerRunComplete<T> value) timerRunComplete,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerInitial<T> value)? timerInitial,
    TResult? Function(TimerRunInProgress<T> value)? timerRunInProgress,
    TResult? Function(TimerRunComplete<T> value)? timerRunComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerInitial<T> value)? timerInitial,
    TResult Function(TimerRunInProgress<T> value)? timerRunInProgress,
    TResult Function(TimerRunComplete<T> value)? timerRunComplete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPlayerTimerStateCopyWith<T, $Res> {
  factory $NewPlayerTimerStateCopyWith(NewPlayerTimerState<T> value,
          $Res Function(NewPlayerTimerState<T>) then) =
      _$NewPlayerTimerStateCopyWithImpl<T, $Res, NewPlayerTimerState<T>>;
}

/// @nodoc
class _$NewPlayerTimerStateCopyWithImpl<T, $Res,
        $Val extends NewPlayerTimerState<T>>
    implements $NewPlayerTimerStateCopyWith<T, $Res> {
  _$NewPlayerTimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TimerInitialCopyWith<T, $Res> {
  factory _$$TimerInitialCopyWith(
          _$TimerInitial<T> value, $Res Function(_$TimerInitial<T>) then) =
      __$$TimerInitialCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$TimerInitialCopyWithImpl<T, $Res>
    extends _$NewPlayerTimerStateCopyWithImpl<T, $Res, _$TimerInitial<T>>
    implements _$$TimerInitialCopyWith<T, $Res> {
  __$$TimerInitialCopyWithImpl(
      _$TimerInitial<T> _value, $Res Function(_$TimerInitial<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TimerInitial<T> implements TimerInitial<T> {
  const _$TimerInitial();

  @override
  String toString() {
    return 'NewPlayerTimerState<$T>.timerInitial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerInitial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timerInitial,
    required TResult Function(T timer) timerRunInProgress,
    required TResult Function() timerRunComplete,
  }) {
    return timerInitial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timerInitial,
    TResult? Function(T timer)? timerRunInProgress,
    TResult? Function()? timerRunComplete,
  }) {
    return timerInitial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timerInitial,
    TResult Function(T timer)? timerRunInProgress,
    TResult Function()? timerRunComplete,
    required TResult orElse(),
  }) {
    if (timerInitial != null) {
      return timerInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerInitial<T> value) timerInitial,
    required TResult Function(TimerRunInProgress<T> value) timerRunInProgress,
    required TResult Function(TimerRunComplete<T> value) timerRunComplete,
  }) {
    return timerInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerInitial<T> value)? timerInitial,
    TResult? Function(TimerRunInProgress<T> value)? timerRunInProgress,
    TResult? Function(TimerRunComplete<T> value)? timerRunComplete,
  }) {
    return timerInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerInitial<T> value)? timerInitial,
    TResult Function(TimerRunInProgress<T> value)? timerRunInProgress,
    TResult Function(TimerRunComplete<T> value)? timerRunComplete,
    required TResult orElse(),
  }) {
    if (timerInitial != null) {
      return timerInitial(this);
    }
    return orElse();
  }
}

abstract class TimerInitial<T> implements NewPlayerTimerState<T> {
  const factory TimerInitial() = _$TimerInitial<T>;
}

/// @nodoc
abstract class _$$TimerRunInProgressCopyWith<T, $Res> {
  factory _$$TimerRunInProgressCopyWith(_$TimerRunInProgress<T> value,
          $Res Function(_$TimerRunInProgress<T>) then) =
      __$$TimerRunInProgressCopyWithImpl<T, $Res>;

  @useResult
  $Res call({T timer});
}

/// @nodoc
class __$$TimerRunInProgressCopyWithImpl<T, $Res>
    extends _$NewPlayerTimerStateCopyWithImpl<T, $Res, _$TimerRunInProgress<T>>
    implements _$$TimerRunInProgressCopyWith<T, $Res> {
  __$$TimerRunInProgressCopyWithImpl(_$TimerRunInProgress<T> _value,
      $Res Function(_$TimerRunInProgress<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timer = freezed,
  }) {
    return _then(_$TimerRunInProgress<T>(
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$TimerRunInProgress<T> implements TimerRunInProgress<T> {
  const _$TimerRunInProgress({required this.timer});

  @override
  final T timer;

  @override
  String toString() {
    return 'NewPlayerTimerState<$T>.timerRunInProgress(timer: $timer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerRunInProgress<T> &&
            const DeepCollectionEquality().equals(other.timer, timer));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(timer));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerRunInProgressCopyWith<T, _$TimerRunInProgress<T>> get copyWith =>
      __$$TimerRunInProgressCopyWithImpl<T, _$TimerRunInProgress<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timerInitial,
    required TResult Function(T timer) timerRunInProgress,
    required TResult Function() timerRunComplete,
  }) {
    return timerRunInProgress(timer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timerInitial,
    TResult? Function(T timer)? timerRunInProgress,
    TResult? Function()? timerRunComplete,
  }) {
    return timerRunInProgress?.call(timer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timerInitial,
    TResult Function(T timer)? timerRunInProgress,
    TResult Function()? timerRunComplete,
    required TResult orElse(),
  }) {
    if (timerRunInProgress != null) {
      return timerRunInProgress(timer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerInitial<T> value) timerInitial,
    required TResult Function(TimerRunInProgress<T> value) timerRunInProgress,
    required TResult Function(TimerRunComplete<T> value) timerRunComplete,
  }) {
    return timerRunInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerInitial<T> value)? timerInitial,
    TResult? Function(TimerRunInProgress<T> value)? timerRunInProgress,
    TResult? Function(TimerRunComplete<T> value)? timerRunComplete,
  }) {
    return timerRunInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerInitial<T> value)? timerInitial,
    TResult Function(TimerRunInProgress<T> value)? timerRunInProgress,
    TResult Function(TimerRunComplete<T> value)? timerRunComplete,
    required TResult orElse(),
  }) {
    if (timerRunInProgress != null) {
      return timerRunInProgress(this);
    }
    return orElse();
  }
}

abstract class TimerRunInProgress<T> implements NewPlayerTimerState<T> {
  const factory TimerRunInProgress({required final T timer}) =
      _$TimerRunInProgress<T>;

  T get timer;

  @JsonKey(ignore: true)
  _$$TimerRunInProgressCopyWith<T, _$TimerRunInProgress<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerRunCompleteCopyWith<T, $Res> {
  factory _$$TimerRunCompleteCopyWith(_$TimerRunComplete<T> value,
          $Res Function(_$TimerRunComplete<T>) then) =
      __$$TimerRunCompleteCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$TimerRunCompleteCopyWithImpl<T, $Res>
    extends _$NewPlayerTimerStateCopyWithImpl<T, $Res, _$TimerRunComplete<T>>
    implements _$$TimerRunCompleteCopyWith<T, $Res> {
  __$$TimerRunCompleteCopyWithImpl(
      _$TimerRunComplete<T> _value, $Res Function(_$TimerRunComplete<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TimerRunComplete<T> implements TimerRunComplete<T> {
  _$TimerRunComplete();

  @override
  String toString() {
    return 'NewPlayerTimerState<$T>.timerRunComplete()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerRunComplete<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timerInitial,
    required TResult Function(T timer) timerRunInProgress,
    required TResult Function() timerRunComplete,
  }) {
    return timerRunComplete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timerInitial,
    TResult? Function(T timer)? timerRunInProgress,
    TResult? Function()? timerRunComplete,
  }) {
    return timerRunComplete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timerInitial,
    TResult Function(T timer)? timerRunInProgress,
    TResult Function()? timerRunComplete,
    required TResult orElse(),
  }) {
    if (timerRunComplete != null) {
      return timerRunComplete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerInitial<T> value) timerInitial,
    required TResult Function(TimerRunInProgress<T> value) timerRunInProgress,
    required TResult Function(TimerRunComplete<T> value) timerRunComplete,
  }) {
    return timerRunComplete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerInitial<T> value)? timerInitial,
    TResult? Function(TimerRunInProgress<T> value)? timerRunInProgress,
    TResult? Function(TimerRunComplete<T> value)? timerRunComplete,
  }) {
    return timerRunComplete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerInitial<T> value)? timerInitial,
    TResult Function(TimerRunInProgress<T> value)? timerRunInProgress,
    TResult Function(TimerRunComplete<T> value)? timerRunComplete,
    required TResult orElse(),
  }) {
    if (timerRunComplete != null) {
      return timerRunComplete(this);
    }
    return orElse();
  }
}

abstract class TimerRunComplete<T> implements NewPlayerTimerState<T> {
  factory TimerRunComplete() = _$TimerRunComplete<T>;
}
