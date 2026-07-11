// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Account {

 int get id; String get phone; String get fullName; Language get language; List<Role> get roles;
/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountCopyWith<Account> get copyWith => _$AccountCopyWithImpl<Account>(this as Account, _$identity);

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Account&&(identical(other.id, id) || other.id == id)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.language, language) || other.language == language)&&const DeepCollectionEquality().equals(other.roles, roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phone,fullName,language,const DeepCollectionEquality().hash(roles));

@override
String toString() {
  return 'Account(id: $id, phone: $phone, fullName: $fullName, language: $language, roles: $roles)';
}


}

/// @nodoc
abstract mixin class $AccountCopyWith<$Res>  {
  factory $AccountCopyWith(Account value, $Res Function(Account) _then) = _$AccountCopyWithImpl;
@useResult
$Res call({
 int id, String phone, String fullName, Language language, List<Role> roles
});




}
/// @nodoc
class _$AccountCopyWithImpl<$Res>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._self, this._then);

  final Account _self;
  final $Res Function(Account) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? phone = null,Object? fullName = null,Object? language = null,Object? roles = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as Language,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<Role>,
  ));
}

}


/// Adds pattern-matching-related methods to [Account].
extension AccountPatterns on Account {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Account value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Account value)  $default,){
final _that = this;
switch (_that) {
case _Account():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Account value)?  $default,){
final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String phone,  String fullName,  Language language,  List<Role> roles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that.id,_that.phone,_that.fullName,_that.language,_that.roles);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String phone,  String fullName,  Language language,  List<Role> roles)  $default,) {final _that = this;
switch (_that) {
case _Account():
return $default(_that.id,_that.phone,_that.fullName,_that.language,_that.roles);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String phone,  String fullName,  Language language,  List<Role> roles)?  $default,) {final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that.id,_that.phone,_that.fullName,_that.language,_that.roles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Account implements Account {
  const _Account({required this.id, required this.phone, required this.fullName, required this.language, required final  List<Role> roles}): _roles = roles;
  factory _Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

@override final  int id;
@override final  String phone;
@override final  String fullName;
@override final  Language language;
 final  List<Role> _roles;
@override List<Role> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}


/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountCopyWith<_Account> get copyWith => __$AccountCopyWithImpl<_Account>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Account&&(identical(other.id, id) || other.id == id)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.language, language) || other.language == language)&&const DeepCollectionEquality().equals(other._roles, _roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phone,fullName,language,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'Account(id: $id, phone: $phone, fullName: $fullName, language: $language, roles: $roles)';
}


}

/// @nodoc
abstract mixin class _$AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$AccountCopyWith(_Account value, $Res Function(_Account) _then) = __$AccountCopyWithImpl;
@override @useResult
$Res call({
 int id, String phone, String fullName, Language language, List<Role> roles
});




}
/// @nodoc
class __$AccountCopyWithImpl<$Res>
    implements _$AccountCopyWith<$Res> {
  __$AccountCopyWithImpl(this._self, this._then);

  final _Account _self;
  final $Res Function(_Account) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? phone = null,Object? fullName = null,Object? language = null,Object? roles = null,}) {
  return _then(_Account(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as Language,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<Role>,
  ));
}


}


/// @nodoc
mixin _$Session {

 String get token; Account get account;
/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionCopyWith<Session> get copyWith => _$SessionCopyWithImpl<Session>(this as Session, _$identity);

  /// Serializes this Session to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Session&&(identical(other.token, token) || other.token == token)&&(identical(other.account, account) || other.account == account));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,account);

@override
String toString() {
  return 'Session(token: $token, account: $account)';
}


}

/// @nodoc
abstract mixin class $SessionCopyWith<$Res>  {
  factory $SessionCopyWith(Session value, $Res Function(Session) _then) = _$SessionCopyWithImpl;
@useResult
$Res call({
 String token, Account account
});


$AccountCopyWith<$Res> get account;

}
/// @nodoc
class _$SessionCopyWithImpl<$Res>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._self, this._then);

  final Session _self;
  final $Res Function(Session) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? account = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Account,
  ));
}
/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountCopyWith<$Res> get account {
  
  return $AccountCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}


/// Adds pattern-matching-related methods to [Session].
extension SessionPatterns on Session {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Session value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Session value)  $default,){
final _that = this;
switch (_that) {
case _Session():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Session value)?  $default,){
final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  Account account)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that.token,_that.account);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  Account account)  $default,) {final _that = this;
switch (_that) {
case _Session():
return $default(_that.token,_that.account);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  Account account)?  $default,) {final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that.token,_that.account);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Session implements Session {
  const _Session({required this.token, required this.account});
  factory _Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

@override final  String token;
@override final  Account account;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionCopyWith<_Session> get copyWith => __$SessionCopyWithImpl<_Session>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Session&&(identical(other.token, token) || other.token == token)&&(identical(other.account, account) || other.account == account));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,account);

@override
String toString() {
  return 'Session(token: $token, account: $account)';
}


}

/// @nodoc
abstract mixin class _$SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$SessionCopyWith(_Session value, $Res Function(_Session) _then) = __$SessionCopyWithImpl;
@override @useResult
$Res call({
 String token, Account account
});


@override $AccountCopyWith<$Res> get account;

}
/// @nodoc
class __$SessionCopyWithImpl<$Res>
    implements _$SessionCopyWith<$Res> {
  __$SessionCopyWithImpl(this._self, this._then);

  final _Session _self;
  final $Res Function(_Session) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? account = null,}) {
  return _then(_Session(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Account,
  ));
}

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountCopyWith<$Res> get account {
  
  return $AccountCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}


/// @nodoc
mixin _$TgLoginStart {

 String get nonce; String get botUrl; String get deepLink; int get expiresIn;
/// Create a copy of TgLoginStart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TgLoginStartCopyWith<TgLoginStart> get copyWith => _$TgLoginStartCopyWithImpl<TgLoginStart>(this as TgLoginStart, _$identity);

  /// Serializes this TgLoginStart to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TgLoginStart&&(identical(other.nonce, nonce) || other.nonce == nonce)&&(identical(other.botUrl, botUrl) || other.botUrl == botUrl)&&(identical(other.deepLink, deepLink) || other.deepLink == deepLink)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nonce,botUrl,deepLink,expiresIn);

@override
String toString() {
  return 'TgLoginStart(nonce: $nonce, botUrl: $botUrl, deepLink: $deepLink, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class $TgLoginStartCopyWith<$Res>  {
  factory $TgLoginStartCopyWith(TgLoginStart value, $Res Function(TgLoginStart) _then) = _$TgLoginStartCopyWithImpl;
@useResult
$Res call({
 String nonce, String botUrl, String deepLink, int expiresIn
});




}
/// @nodoc
class _$TgLoginStartCopyWithImpl<$Res>
    implements $TgLoginStartCopyWith<$Res> {
  _$TgLoginStartCopyWithImpl(this._self, this._then);

  final TgLoginStart _self;
  final $Res Function(TgLoginStart) _then;

/// Create a copy of TgLoginStart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nonce = null,Object? botUrl = null,Object? deepLink = null,Object? expiresIn = null,}) {
  return _then(_self.copyWith(
nonce: null == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as String,botUrl: null == botUrl ? _self.botUrl : botUrl // ignore: cast_nullable_to_non_nullable
as String,deepLink: null == deepLink ? _self.deepLink : deepLink // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TgLoginStart].
extension TgLoginStartPatterns on TgLoginStart {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TgLoginStart value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TgLoginStart() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TgLoginStart value)  $default,){
final _that = this;
switch (_that) {
case _TgLoginStart():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TgLoginStart value)?  $default,){
final _that = this;
switch (_that) {
case _TgLoginStart() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nonce,  String botUrl,  String deepLink,  int expiresIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TgLoginStart() when $default != null:
return $default(_that.nonce,_that.botUrl,_that.deepLink,_that.expiresIn);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nonce,  String botUrl,  String deepLink,  int expiresIn)  $default,) {final _that = this;
switch (_that) {
case _TgLoginStart():
return $default(_that.nonce,_that.botUrl,_that.deepLink,_that.expiresIn);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nonce,  String botUrl,  String deepLink,  int expiresIn)?  $default,) {final _that = this;
switch (_that) {
case _TgLoginStart() when $default != null:
return $default(_that.nonce,_that.botUrl,_that.deepLink,_that.expiresIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TgLoginStart implements TgLoginStart {
  const _TgLoginStart({required this.nonce, required this.botUrl, required this.deepLink, required this.expiresIn});
  factory _TgLoginStart.fromJson(Map<String, dynamic> json) => _$TgLoginStartFromJson(json);

@override final  String nonce;
@override final  String botUrl;
@override final  String deepLink;
@override final  int expiresIn;

/// Create a copy of TgLoginStart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TgLoginStartCopyWith<_TgLoginStart> get copyWith => __$TgLoginStartCopyWithImpl<_TgLoginStart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TgLoginStartToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TgLoginStart&&(identical(other.nonce, nonce) || other.nonce == nonce)&&(identical(other.botUrl, botUrl) || other.botUrl == botUrl)&&(identical(other.deepLink, deepLink) || other.deepLink == deepLink)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nonce,botUrl,deepLink,expiresIn);

@override
String toString() {
  return 'TgLoginStart(nonce: $nonce, botUrl: $botUrl, deepLink: $deepLink, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class _$TgLoginStartCopyWith<$Res> implements $TgLoginStartCopyWith<$Res> {
  factory _$TgLoginStartCopyWith(_TgLoginStart value, $Res Function(_TgLoginStart) _then) = __$TgLoginStartCopyWithImpl;
@override @useResult
$Res call({
 String nonce, String botUrl, String deepLink, int expiresIn
});




}
/// @nodoc
class __$TgLoginStartCopyWithImpl<$Res>
    implements _$TgLoginStartCopyWith<$Res> {
  __$TgLoginStartCopyWithImpl(this._self, this._then);

  final _TgLoginStart _self;
  final $Res Function(_TgLoginStart) _then;

/// Create a copy of TgLoginStart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nonce = null,Object? botUrl = null,Object? deepLink = null,Object? expiresIn = null,}) {
  return _then(_TgLoginStart(
nonce: null == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as String,botUrl: null == botUrl ? _self.botUrl : botUrl // ignore: cast_nullable_to_non_nullable
as String,deepLink: null == deepLink ? _self.deepLink : deepLink // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

TgPollResult _$TgPollResultFromJson(
  Map<String, dynamic> json
) {
        switch (json['status']) {
                  case 'pending':
          return TgPollPending.fromJson(
            json
          );
                case 'expired':
          return TgPollExpired.fromJson(
            json
          );
                case 'done':
          return TgPollDone.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'status',
  'TgPollResult',
  'Invalid union type "${json['status']}"!'
);
        }
      
}

/// @nodoc
mixin _$TgPollResult {



  /// Serializes this TgPollResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TgPollResult);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TgPollResult()';
}


}

/// @nodoc
class $TgPollResultCopyWith<$Res>  {
$TgPollResultCopyWith(TgPollResult _, $Res Function(TgPollResult) __);
}


/// Adds pattern-matching-related methods to [TgPollResult].
extension TgPollResultPatterns on TgPollResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TgPollPending value)?  pending,TResult Function( TgPollExpired value)?  expired,TResult Function( TgPollDone value)?  done,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TgPollPending() when pending != null:
return pending(_that);case TgPollExpired() when expired != null:
return expired(_that);case TgPollDone() when done != null:
return done(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TgPollPending value)  pending,required TResult Function( TgPollExpired value)  expired,required TResult Function( TgPollDone value)  done,}){
final _that = this;
switch (_that) {
case TgPollPending():
return pending(_that);case TgPollExpired():
return expired(_that);case TgPollDone():
return done(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TgPollPending value)?  pending,TResult? Function( TgPollExpired value)?  expired,TResult? Function( TgPollDone value)?  done,}){
final _that = this;
switch (_that) {
case TgPollPending() when pending != null:
return pending(_that);case TgPollExpired() when expired != null:
return expired(_that);case TgPollDone() when done != null:
return done(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  pending,TResult Function()?  expired,TResult Function( String token,  Account account)?  done,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TgPollPending() when pending != null:
return pending();case TgPollExpired() when expired != null:
return expired();case TgPollDone() when done != null:
return done(_that.token,_that.account);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  pending,required TResult Function()  expired,required TResult Function( String token,  Account account)  done,}) {final _that = this;
switch (_that) {
case TgPollPending():
return pending();case TgPollExpired():
return expired();case TgPollDone():
return done(_that.token,_that.account);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  pending,TResult? Function()?  expired,TResult? Function( String token,  Account account)?  done,}) {final _that = this;
switch (_that) {
case TgPollPending() when pending != null:
return pending();case TgPollExpired() when expired != null:
return expired();case TgPollDone() when done != null:
return done(_that.token,_that.account);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class TgPollPending implements TgPollResult {
  const TgPollPending({final  String? $type}): $type = $type ?? 'pending';
  factory TgPollPending.fromJson(Map<String, dynamic> json) => _$TgPollPendingFromJson(json);



@JsonKey(name: 'status')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$TgPollPendingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TgPollPending);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TgPollResult.pending()';
}


}




/// @nodoc
@JsonSerializable()

class TgPollExpired implements TgPollResult {
  const TgPollExpired({final  String? $type}): $type = $type ?? 'expired';
  factory TgPollExpired.fromJson(Map<String, dynamic> json) => _$TgPollExpiredFromJson(json);



@JsonKey(name: 'status')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$TgPollExpiredToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TgPollExpired);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TgPollResult.expired()';
}


}




/// @nodoc
@JsonSerializable()

class TgPollDone implements TgPollResult {
  const TgPollDone({required this.token, required this.account, final  String? $type}): $type = $type ?? 'done';
  factory TgPollDone.fromJson(Map<String, dynamic> json) => _$TgPollDoneFromJson(json);

 final  String token;
 final  Account account;

@JsonKey(name: 'status')
final String $type;


/// Create a copy of TgPollResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TgPollDoneCopyWith<TgPollDone> get copyWith => _$TgPollDoneCopyWithImpl<TgPollDone>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TgPollDoneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TgPollDone&&(identical(other.token, token) || other.token == token)&&(identical(other.account, account) || other.account == account));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,account);

@override
String toString() {
  return 'TgPollResult.done(token: $token, account: $account)';
}


}

/// @nodoc
abstract mixin class $TgPollDoneCopyWith<$Res> implements $TgPollResultCopyWith<$Res> {
  factory $TgPollDoneCopyWith(TgPollDone value, $Res Function(TgPollDone) _then) = _$TgPollDoneCopyWithImpl;
@useResult
$Res call({
 String token, Account account
});


$AccountCopyWith<$Res> get account;

}
/// @nodoc
class _$TgPollDoneCopyWithImpl<$Res>
    implements $TgPollDoneCopyWith<$Res> {
  _$TgPollDoneCopyWithImpl(this._self, this._then);

  final TgPollDone _self;
  final $Res Function(TgPollDone) _then;

/// Create a copy of TgPollResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? token = null,Object? account = null,}) {
  return _then(TgPollDone(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Account,
  ));
}

/// Create a copy of TgPollResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountCopyWith<$Res> get account {
  
  return $AccountCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}

// dart format on
