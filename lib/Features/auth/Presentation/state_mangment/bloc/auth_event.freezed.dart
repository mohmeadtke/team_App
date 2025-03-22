// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String email, String password)
        createAccountEvent,
    required TResult Function(String email, String password) signInEvent,
    required TResult Function() signInWithGoogleEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String email, String password)?
        createAccountEvent,
    TResult? Function(String email, String password)? signInEvent,
    TResult? Function()? signInWithGoogleEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String email, String password)?
        createAccountEvent,
    TResult Function(String email, String password)? signInEvent,
    TResult Function()? signInWithGoogleEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateAccountEvent value) createAccountEvent,
    required TResult Function(SignInEvent value) signInEvent,
    required TResult Function(SignInWithGoogleEvent value)
        signInWithGoogleEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateAccountEvent value)? createAccountEvent,
    TResult? Function(SignInEvent value)? signInEvent,
    TResult? Function(SignInWithGoogleEvent value)? signInWithGoogleEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateAccountEvent value)? createAccountEvent,
    TResult Function(SignInEvent value)? signInEvent,
    TResult Function(SignInWithGoogleEvent value)? signInWithGoogleEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CreateAccountEventImplCopyWith<$Res> {
  factory _$$CreateAccountEventImplCopyWith(_$CreateAccountEventImpl value,
          $Res Function(_$CreateAccountEventImpl) then) =
      __$$CreateAccountEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String email, String password});
}

/// @nodoc
class __$$CreateAccountEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CreateAccountEventImpl>
    implements _$$CreateAccountEventImplCopyWith<$Res> {
  __$$CreateAccountEventImplCopyWithImpl(_$CreateAccountEventImpl _value,
      $Res Function(_$CreateAccountEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$CreateAccountEventImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateAccountEventImpl implements CreateAccountEvent {
  const _$CreateAccountEventImpl(
      {required this.name, required this.email, required this.password});

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.createAccountEvent(name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAccountEventImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAccountEventImplCopyWith<_$CreateAccountEventImpl> get copyWith =>
      __$$CreateAccountEventImplCopyWithImpl<_$CreateAccountEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String email, String password)
        createAccountEvent,
    required TResult Function(String email, String password) signInEvent,
    required TResult Function() signInWithGoogleEvent,
  }) {
    return createAccountEvent(name, email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String email, String password)?
        createAccountEvent,
    TResult? Function(String email, String password)? signInEvent,
    TResult? Function()? signInWithGoogleEvent,
  }) {
    return createAccountEvent?.call(name, email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String email, String password)?
        createAccountEvent,
    TResult Function(String email, String password)? signInEvent,
    TResult Function()? signInWithGoogleEvent,
    required TResult orElse(),
  }) {
    if (createAccountEvent != null) {
      return createAccountEvent(name, email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateAccountEvent value) createAccountEvent,
    required TResult Function(SignInEvent value) signInEvent,
    required TResult Function(SignInWithGoogleEvent value)
        signInWithGoogleEvent,
  }) {
    return createAccountEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateAccountEvent value)? createAccountEvent,
    TResult? Function(SignInEvent value)? signInEvent,
    TResult? Function(SignInWithGoogleEvent value)? signInWithGoogleEvent,
  }) {
    return createAccountEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateAccountEvent value)? createAccountEvent,
    TResult Function(SignInEvent value)? signInEvent,
    TResult Function(SignInWithGoogleEvent value)? signInWithGoogleEvent,
    required TResult orElse(),
  }) {
    if (createAccountEvent != null) {
      return createAccountEvent(this);
    }
    return orElse();
  }
}

abstract class CreateAccountEvent implements AuthEvent {
  const factory CreateAccountEvent(
      {required final String name,
      required final String email,
      required final String password}) = _$CreateAccountEventImpl;

  String get name;
  String get email;
  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateAccountEventImplCopyWith<_$CreateAccountEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInEventImplCopyWith<$Res> {
  factory _$$SignInEventImplCopyWith(
          _$SignInEventImpl value, $Res Function(_$SignInEventImpl) then) =
      __$$SignInEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignInEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignInEventImpl>
    implements _$$SignInEventImplCopyWith<$Res> {
  __$$SignInEventImplCopyWithImpl(
      _$SignInEventImpl _value, $Res Function(_$SignInEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignInEventImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInEventImpl implements SignInEvent {
  const _$SignInEventImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.signInEvent(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInEventImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInEventImplCopyWith<_$SignInEventImpl> get copyWith =>
      __$$SignInEventImplCopyWithImpl<_$SignInEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String email, String password)
        createAccountEvent,
    required TResult Function(String email, String password) signInEvent,
    required TResult Function() signInWithGoogleEvent,
  }) {
    return signInEvent(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String email, String password)?
        createAccountEvent,
    TResult? Function(String email, String password)? signInEvent,
    TResult? Function()? signInWithGoogleEvent,
  }) {
    return signInEvent?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String email, String password)?
        createAccountEvent,
    TResult Function(String email, String password)? signInEvent,
    TResult Function()? signInWithGoogleEvent,
    required TResult orElse(),
  }) {
    if (signInEvent != null) {
      return signInEvent(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateAccountEvent value) createAccountEvent,
    required TResult Function(SignInEvent value) signInEvent,
    required TResult Function(SignInWithGoogleEvent value)
        signInWithGoogleEvent,
  }) {
    return signInEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateAccountEvent value)? createAccountEvent,
    TResult? Function(SignInEvent value)? signInEvent,
    TResult? Function(SignInWithGoogleEvent value)? signInWithGoogleEvent,
  }) {
    return signInEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateAccountEvent value)? createAccountEvent,
    TResult Function(SignInEvent value)? signInEvent,
    TResult Function(SignInWithGoogleEvent value)? signInWithGoogleEvent,
    required TResult orElse(),
  }) {
    if (signInEvent != null) {
      return signInEvent(this);
    }
    return orElse();
  }
}

abstract class SignInEvent implements AuthEvent {
  const factory SignInEvent(
      {required final String email,
      required final String password}) = _$SignInEventImpl;

  String get email;
  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInEventImplCopyWith<_$SignInEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInWithGoogleEventImplCopyWith<$Res> {
  factory _$$SignInWithGoogleEventImplCopyWith(
          _$SignInWithGoogleEventImpl value,
          $Res Function(_$SignInWithGoogleEventImpl) then) =
      __$$SignInWithGoogleEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInWithGoogleEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignInWithGoogleEventImpl>
    implements _$$SignInWithGoogleEventImplCopyWith<$Res> {
  __$$SignInWithGoogleEventImplCopyWithImpl(_$SignInWithGoogleEventImpl _value,
      $Res Function(_$SignInWithGoogleEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignInWithGoogleEventImpl implements SignInWithGoogleEvent {
  const _$SignInWithGoogleEventImpl();

  @override
  String toString() {
    return 'AuthEvent.signInWithGoogleEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInWithGoogleEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String email, String password)
        createAccountEvent,
    required TResult Function(String email, String password) signInEvent,
    required TResult Function() signInWithGoogleEvent,
  }) {
    return signInWithGoogleEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String email, String password)?
        createAccountEvent,
    TResult? Function(String email, String password)? signInEvent,
    TResult? Function()? signInWithGoogleEvent,
  }) {
    return signInWithGoogleEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String email, String password)?
        createAccountEvent,
    TResult Function(String email, String password)? signInEvent,
    TResult Function()? signInWithGoogleEvent,
    required TResult orElse(),
  }) {
    if (signInWithGoogleEvent != null) {
      return signInWithGoogleEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateAccountEvent value) createAccountEvent,
    required TResult Function(SignInEvent value) signInEvent,
    required TResult Function(SignInWithGoogleEvent value)
        signInWithGoogleEvent,
  }) {
    return signInWithGoogleEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateAccountEvent value)? createAccountEvent,
    TResult? Function(SignInEvent value)? signInEvent,
    TResult? Function(SignInWithGoogleEvent value)? signInWithGoogleEvent,
  }) {
    return signInWithGoogleEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateAccountEvent value)? createAccountEvent,
    TResult Function(SignInEvent value)? signInEvent,
    TResult Function(SignInWithGoogleEvent value)? signInWithGoogleEvent,
    required TResult orElse(),
  }) {
    if (signInWithGoogleEvent != null) {
      return signInWithGoogleEvent(this);
    }
    return orElse();
  }
}

abstract class SignInWithGoogleEvent implements AuthEvent {
  const factory SignInWithGoogleEvent() = _$SignInWithGoogleEventImpl;
}
