import 'package:freezed_annotation/freezed_annotation.dart';

part 'azkhar_state.freezed.dart';

@freezed
class AzkharState<T> with _$AzkharState<T> {
  const factory AzkharState.azkharInitial() = AzkharInitial<T>;

  const factory AzkharState.azkharLoading() = AzkharLoading<T>;

  const factory AzkharState.azkharAdding() = AzkharAdding<T>;

  const factory AzkharState.azkharGetSuccess({required T azkhar}) =
      AzkharGetSuccess<T>;

  factory AzkharState.error() = Error<T>;
}
