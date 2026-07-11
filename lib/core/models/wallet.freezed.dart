// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Wallet {

 int get balanceUzs; int get balanceIqc;
/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletCopyWith<Wallet> get copyWith => _$WalletCopyWithImpl<Wallet>(this as Wallet, _$identity);

  /// Serializes this Wallet to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Wallet&&(identical(other.balanceUzs, balanceUzs) || other.balanceUzs == balanceUzs)&&(identical(other.balanceIqc, balanceIqc) || other.balanceIqc == balanceIqc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,balanceUzs,balanceIqc);

@override
String toString() {
  return 'Wallet(balanceUzs: $balanceUzs, balanceIqc: $balanceIqc)';
}


}

/// @nodoc
abstract mixin class $WalletCopyWith<$Res>  {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) _then) = _$WalletCopyWithImpl;
@useResult
$Res call({
 int balanceUzs, int balanceIqc
});




}
/// @nodoc
class _$WalletCopyWithImpl<$Res>
    implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._self, this._then);

  final Wallet _self;
  final $Res Function(Wallet) _then;

/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? balanceUzs = null,Object? balanceIqc = null,}) {
  return _then(_self.copyWith(
balanceUzs: null == balanceUzs ? _self.balanceUzs : balanceUzs // ignore: cast_nullable_to_non_nullable
as int,balanceIqc: null == balanceIqc ? _self.balanceIqc : balanceIqc // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Wallet].
extension WalletPatterns on Wallet {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Wallet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Wallet() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Wallet value)  $default,){
final _that = this;
switch (_that) {
case _Wallet():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Wallet value)?  $default,){
final _that = this;
switch (_that) {
case _Wallet() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int balanceUzs,  int balanceIqc)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Wallet() when $default != null:
return $default(_that.balanceUzs,_that.balanceIqc);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int balanceUzs,  int balanceIqc)  $default,) {final _that = this;
switch (_that) {
case _Wallet():
return $default(_that.balanceUzs,_that.balanceIqc);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int balanceUzs,  int balanceIqc)?  $default,) {final _that = this;
switch (_that) {
case _Wallet() when $default != null:
return $default(_that.balanceUzs,_that.balanceIqc);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Wallet implements Wallet {
  const _Wallet({required this.balanceUzs, required this.balanceIqc});
  factory _Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

@override final  int balanceUzs;
@override final  int balanceIqc;

/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletCopyWith<_Wallet> get copyWith => __$WalletCopyWithImpl<_Wallet>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Wallet&&(identical(other.balanceUzs, balanceUzs) || other.balanceUzs == balanceUzs)&&(identical(other.balanceIqc, balanceIqc) || other.balanceIqc == balanceIqc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,balanceUzs,balanceIqc);

@override
String toString() {
  return 'Wallet(balanceUzs: $balanceUzs, balanceIqc: $balanceIqc)';
}


}

/// @nodoc
abstract mixin class _$WalletCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$WalletCopyWith(_Wallet value, $Res Function(_Wallet) _then) = __$WalletCopyWithImpl;
@override @useResult
$Res call({
 int balanceUzs, int balanceIqc
});




}
/// @nodoc
class __$WalletCopyWithImpl<$Res>
    implements _$WalletCopyWith<$Res> {
  __$WalletCopyWithImpl(this._self, this._then);

  final _Wallet _self;
  final $Res Function(_Wallet) _then;

/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? balanceUzs = null,Object? balanceIqc = null,}) {
  return _then(_Wallet(
balanceUzs: null == balanceUzs ? _self.balanceUzs : balanceUzs // ignore: cast_nullable_to_non_nullable
as int,balanceIqc: null == balanceIqc ? _self.balanceIqc : balanceIqc // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$WalletTxn {

 int get id; WalletTxnType get type; int get deltaUzs; String get refType; String get createdAt; String? get note;
/// Create a copy of WalletTxn
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletTxnCopyWith<WalletTxn> get copyWith => _$WalletTxnCopyWithImpl<WalletTxn>(this as WalletTxn, _$identity);

  /// Serializes this WalletTxn to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletTxn&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.deltaUzs, deltaUzs) || other.deltaUzs == deltaUzs)&&(identical(other.refType, refType) || other.refType == refType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,deltaUzs,refType,createdAt,note);

@override
String toString() {
  return 'WalletTxn(id: $id, type: $type, deltaUzs: $deltaUzs, refType: $refType, createdAt: $createdAt, note: $note)';
}


}

/// @nodoc
abstract mixin class $WalletTxnCopyWith<$Res>  {
  factory $WalletTxnCopyWith(WalletTxn value, $Res Function(WalletTxn) _then) = _$WalletTxnCopyWithImpl;
@useResult
$Res call({
 int id, WalletTxnType type, int deltaUzs, String refType, String createdAt, String? note
});




}
/// @nodoc
class _$WalletTxnCopyWithImpl<$Res>
    implements $WalletTxnCopyWith<$Res> {
  _$WalletTxnCopyWithImpl(this._self, this._then);

  final WalletTxn _self;
  final $Res Function(WalletTxn) _then;

/// Create a copy of WalletTxn
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? deltaUzs = null,Object? refType = null,Object? createdAt = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WalletTxnType,deltaUzs: null == deltaUzs ? _self.deltaUzs : deltaUzs // ignore: cast_nullable_to_non_nullable
as int,refType: null == refType ? _self.refType : refType // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletTxn].
extension WalletTxnPatterns on WalletTxn {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletTxn value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletTxn() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletTxn value)  $default,){
final _that = this;
switch (_that) {
case _WalletTxn():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletTxn value)?  $default,){
final _that = this;
switch (_that) {
case _WalletTxn() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  WalletTxnType type,  int deltaUzs,  String refType,  String createdAt,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletTxn() when $default != null:
return $default(_that.id,_that.type,_that.deltaUzs,_that.refType,_that.createdAt,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  WalletTxnType type,  int deltaUzs,  String refType,  String createdAt,  String? note)  $default,) {final _that = this;
switch (_that) {
case _WalletTxn():
return $default(_that.id,_that.type,_that.deltaUzs,_that.refType,_that.createdAt,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  WalletTxnType type,  int deltaUzs,  String refType,  String createdAt,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _WalletTxn() when $default != null:
return $default(_that.id,_that.type,_that.deltaUzs,_that.refType,_that.createdAt,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WalletTxn implements WalletTxn {
  const _WalletTxn({required this.id, required this.type, required this.deltaUzs, required this.refType, required this.createdAt, this.note});
  factory _WalletTxn.fromJson(Map<String, dynamic> json) => _$WalletTxnFromJson(json);

@override final  int id;
@override final  WalletTxnType type;
@override final  int deltaUzs;
@override final  String refType;
@override final  String createdAt;
@override final  String? note;

/// Create a copy of WalletTxn
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletTxnCopyWith<_WalletTxn> get copyWith => __$WalletTxnCopyWithImpl<_WalletTxn>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletTxnToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletTxn&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.deltaUzs, deltaUzs) || other.deltaUzs == deltaUzs)&&(identical(other.refType, refType) || other.refType == refType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,deltaUzs,refType,createdAt,note);

@override
String toString() {
  return 'WalletTxn(id: $id, type: $type, deltaUzs: $deltaUzs, refType: $refType, createdAt: $createdAt, note: $note)';
}


}

/// @nodoc
abstract mixin class _$WalletTxnCopyWith<$Res> implements $WalletTxnCopyWith<$Res> {
  factory _$WalletTxnCopyWith(_WalletTxn value, $Res Function(_WalletTxn) _then) = __$WalletTxnCopyWithImpl;
@override @useResult
$Res call({
 int id, WalletTxnType type, int deltaUzs, String refType, String createdAt, String? note
});




}
/// @nodoc
class __$WalletTxnCopyWithImpl<$Res>
    implements _$WalletTxnCopyWith<$Res> {
  __$WalletTxnCopyWithImpl(this._self, this._then);

  final _WalletTxn _self;
  final $Res Function(_WalletTxn) _then;

/// Create a copy of WalletTxn
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? deltaUzs = null,Object? refType = null,Object? createdAt = null,Object? note = freezed,}) {
  return _then(_WalletTxn(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WalletTxnType,deltaUzs: null == deltaUzs ? _self.deltaUzs : deltaUzs // ignore: cast_nullable_to_non_nullable
as int,refType: null == refType ? _self.refType : refType // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$VoucherDenomination {

 int get faceUzs; String get label; int get costIqc;
/// Create a copy of VoucherDenomination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoucherDenominationCopyWith<VoucherDenomination> get copyWith => _$VoucherDenominationCopyWithImpl<VoucherDenomination>(this as VoucherDenomination, _$identity);

  /// Serializes this VoucherDenomination to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoucherDenomination&&(identical(other.faceUzs, faceUzs) || other.faceUzs == faceUzs)&&(identical(other.label, label) || other.label == label)&&(identical(other.costIqc, costIqc) || other.costIqc == costIqc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,faceUzs,label,costIqc);

@override
String toString() {
  return 'VoucherDenomination(faceUzs: $faceUzs, label: $label, costIqc: $costIqc)';
}


}

/// @nodoc
abstract mixin class $VoucherDenominationCopyWith<$Res>  {
  factory $VoucherDenominationCopyWith(VoucherDenomination value, $Res Function(VoucherDenomination) _then) = _$VoucherDenominationCopyWithImpl;
@useResult
$Res call({
 int faceUzs, String label, int costIqc
});




}
/// @nodoc
class _$VoucherDenominationCopyWithImpl<$Res>
    implements $VoucherDenominationCopyWith<$Res> {
  _$VoucherDenominationCopyWithImpl(this._self, this._then);

  final VoucherDenomination _self;
  final $Res Function(VoucherDenomination) _then;

/// Create a copy of VoucherDenomination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? faceUzs = null,Object? label = null,Object? costIqc = null,}) {
  return _then(_self.copyWith(
faceUzs: null == faceUzs ? _self.faceUzs : faceUzs // ignore: cast_nullable_to_non_nullable
as int,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,costIqc: null == costIqc ? _self.costIqc : costIqc // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VoucherDenomination].
extension VoucherDenominationPatterns on VoucherDenomination {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoucherDenomination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoucherDenomination() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoucherDenomination value)  $default,){
final _that = this;
switch (_that) {
case _VoucherDenomination():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoucherDenomination value)?  $default,){
final _that = this;
switch (_that) {
case _VoucherDenomination() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int faceUzs,  String label,  int costIqc)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoucherDenomination() when $default != null:
return $default(_that.faceUzs,_that.label,_that.costIqc);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int faceUzs,  String label,  int costIqc)  $default,) {final _that = this;
switch (_that) {
case _VoucherDenomination():
return $default(_that.faceUzs,_that.label,_that.costIqc);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int faceUzs,  String label,  int costIqc)?  $default,) {final _that = this;
switch (_that) {
case _VoucherDenomination() when $default != null:
return $default(_that.faceUzs,_that.label,_that.costIqc);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VoucherDenomination implements VoucherDenomination {
  const _VoucherDenomination({required this.faceUzs, required this.label, required this.costIqc});
  factory _VoucherDenomination.fromJson(Map<String, dynamic> json) => _$VoucherDenominationFromJson(json);

@override final  int faceUzs;
@override final  String label;
@override final  int costIqc;

/// Create a copy of VoucherDenomination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoucherDenominationCopyWith<_VoucherDenomination> get copyWith => __$VoucherDenominationCopyWithImpl<_VoucherDenomination>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoucherDenominationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoucherDenomination&&(identical(other.faceUzs, faceUzs) || other.faceUzs == faceUzs)&&(identical(other.label, label) || other.label == label)&&(identical(other.costIqc, costIqc) || other.costIqc == costIqc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,faceUzs,label,costIqc);

@override
String toString() {
  return 'VoucherDenomination(faceUzs: $faceUzs, label: $label, costIqc: $costIqc)';
}


}

/// @nodoc
abstract mixin class _$VoucherDenominationCopyWith<$Res> implements $VoucherDenominationCopyWith<$Res> {
  factory _$VoucherDenominationCopyWith(_VoucherDenomination value, $Res Function(_VoucherDenomination) _then) = __$VoucherDenominationCopyWithImpl;
@override @useResult
$Res call({
 int faceUzs, String label, int costIqc
});




}
/// @nodoc
class __$VoucherDenominationCopyWithImpl<$Res>
    implements _$VoucherDenominationCopyWith<$Res> {
  __$VoucherDenominationCopyWithImpl(this._self, this._then);

  final _VoucherDenomination _self;
  final $Res Function(_VoucherDenomination) _then;

/// Create a copy of VoucherDenomination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? faceUzs = null,Object? label = null,Object? costIqc = null,}) {
  return _then(_VoucherDenomination(
faceUzs: null == faceUzs ? _self.faceUzs : faceUzs // ignore: cast_nullable_to_non_nullable
as int,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,costIqc: null == costIqc ? _self.costIqc : costIqc // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$IssuedVoucher {

 int get id; String get code; int get amountUzs; String get status;// 'issued' | 'used'
 String get issuedAt; String? get qr;
/// Create a copy of IssuedVoucher
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssuedVoucherCopyWith<IssuedVoucher> get copyWith => _$IssuedVoucherCopyWithImpl<IssuedVoucher>(this as IssuedVoucher, _$identity);

  /// Serializes this IssuedVoucher to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssuedVoucher&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.amountUzs, amountUzs) || other.amountUzs == amountUzs)&&(identical(other.status, status) || other.status == status)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.qr, qr) || other.qr == qr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,amountUzs,status,issuedAt,qr);

@override
String toString() {
  return 'IssuedVoucher(id: $id, code: $code, amountUzs: $amountUzs, status: $status, issuedAt: $issuedAt, qr: $qr)';
}


}

/// @nodoc
abstract mixin class $IssuedVoucherCopyWith<$Res>  {
  factory $IssuedVoucherCopyWith(IssuedVoucher value, $Res Function(IssuedVoucher) _then) = _$IssuedVoucherCopyWithImpl;
@useResult
$Res call({
 int id, String code, int amountUzs, String status, String issuedAt, String? qr
});




}
/// @nodoc
class _$IssuedVoucherCopyWithImpl<$Res>
    implements $IssuedVoucherCopyWith<$Res> {
  _$IssuedVoucherCopyWithImpl(this._self, this._then);

  final IssuedVoucher _self;
  final $Res Function(IssuedVoucher) _then;

/// Create a copy of IssuedVoucher
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? amountUzs = null,Object? status = null,Object? issuedAt = null,Object? qr = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,amountUzs: null == amountUzs ? _self.amountUzs : amountUzs // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,issuedAt: null == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as String,qr: freezed == qr ? _self.qr : qr // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IssuedVoucher].
extension IssuedVoucherPatterns on IssuedVoucher {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IssuedVoucher value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IssuedVoucher() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IssuedVoucher value)  $default,){
final _that = this;
switch (_that) {
case _IssuedVoucher():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IssuedVoucher value)?  $default,){
final _that = this;
switch (_that) {
case _IssuedVoucher() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code,  int amountUzs,  String status,  String issuedAt,  String? qr)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IssuedVoucher() when $default != null:
return $default(_that.id,_that.code,_that.amountUzs,_that.status,_that.issuedAt,_that.qr);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code,  int amountUzs,  String status,  String issuedAt,  String? qr)  $default,) {final _that = this;
switch (_that) {
case _IssuedVoucher():
return $default(_that.id,_that.code,_that.amountUzs,_that.status,_that.issuedAt,_that.qr);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code,  int amountUzs,  String status,  String issuedAt,  String? qr)?  $default,) {final _that = this;
switch (_that) {
case _IssuedVoucher() when $default != null:
return $default(_that.id,_that.code,_that.amountUzs,_that.status,_that.issuedAt,_that.qr);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IssuedVoucher implements IssuedVoucher {
  const _IssuedVoucher({required this.id, required this.code, required this.amountUzs, required this.status, required this.issuedAt, this.qr});
  factory _IssuedVoucher.fromJson(Map<String, dynamic> json) => _$IssuedVoucherFromJson(json);

@override final  int id;
@override final  String code;
@override final  int amountUzs;
@override final  String status;
// 'issued' | 'used'
@override final  String issuedAt;
@override final  String? qr;

/// Create a copy of IssuedVoucher
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssuedVoucherCopyWith<_IssuedVoucher> get copyWith => __$IssuedVoucherCopyWithImpl<_IssuedVoucher>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IssuedVoucherToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssuedVoucher&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.amountUzs, amountUzs) || other.amountUzs == amountUzs)&&(identical(other.status, status) || other.status == status)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.qr, qr) || other.qr == qr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,amountUzs,status,issuedAt,qr);

@override
String toString() {
  return 'IssuedVoucher(id: $id, code: $code, amountUzs: $amountUzs, status: $status, issuedAt: $issuedAt, qr: $qr)';
}


}

/// @nodoc
abstract mixin class _$IssuedVoucherCopyWith<$Res> implements $IssuedVoucherCopyWith<$Res> {
  factory _$IssuedVoucherCopyWith(_IssuedVoucher value, $Res Function(_IssuedVoucher) _then) = __$IssuedVoucherCopyWithImpl;
@override @useResult
$Res call({
 int id, String code, int amountUzs, String status, String issuedAt, String? qr
});




}
/// @nodoc
class __$IssuedVoucherCopyWithImpl<$Res>
    implements _$IssuedVoucherCopyWith<$Res> {
  __$IssuedVoucherCopyWithImpl(this._self, this._then);

  final _IssuedVoucher _self;
  final $Res Function(_IssuedVoucher) _then;

/// Create a copy of IssuedVoucher
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? amountUzs = null,Object? status = null,Object? issuedAt = null,Object? qr = freezed,}) {
  return _then(_IssuedVoucher(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,amountUzs: null == amountUzs ? _self.amountUzs : amountUzs // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,issuedAt: null == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as String,qr: freezed == qr ? _self.qr : qr // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PendingAccrual {

 int get id; String get questName; int get count; String get requestedAt;
/// Create a copy of PendingAccrual
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingAccrualCopyWith<PendingAccrual> get copyWith => _$PendingAccrualCopyWithImpl<PendingAccrual>(this as PendingAccrual, _$identity);

  /// Serializes this PendingAccrual to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingAccrual&&(identical(other.id, id) || other.id == id)&&(identical(other.questName, questName) || other.questName == questName)&&(identical(other.count, count) || other.count == count)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,questName,count,requestedAt);

@override
String toString() {
  return 'PendingAccrual(id: $id, questName: $questName, count: $count, requestedAt: $requestedAt)';
}


}

/// @nodoc
abstract mixin class $PendingAccrualCopyWith<$Res>  {
  factory $PendingAccrualCopyWith(PendingAccrual value, $Res Function(PendingAccrual) _then) = _$PendingAccrualCopyWithImpl;
@useResult
$Res call({
 int id, String questName, int count, String requestedAt
});




}
/// @nodoc
class _$PendingAccrualCopyWithImpl<$Res>
    implements $PendingAccrualCopyWith<$Res> {
  _$PendingAccrualCopyWithImpl(this._self, this._then);

  final PendingAccrual _self;
  final $Res Function(PendingAccrual) _then;

/// Create a copy of PendingAccrual
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? questName = null,Object? count = null,Object? requestedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,questName: null == questName ? _self.questName : questName // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PendingAccrual].
extension PendingAccrualPatterns on PendingAccrual {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PendingAccrual value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PendingAccrual() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PendingAccrual value)  $default,){
final _that = this;
switch (_that) {
case _PendingAccrual():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PendingAccrual value)?  $default,){
final _that = this;
switch (_that) {
case _PendingAccrual() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String questName,  int count,  String requestedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PendingAccrual() when $default != null:
return $default(_that.id,_that.questName,_that.count,_that.requestedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String questName,  int count,  String requestedAt)  $default,) {final _that = this;
switch (_that) {
case _PendingAccrual():
return $default(_that.id,_that.questName,_that.count,_that.requestedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String questName,  int count,  String requestedAt)?  $default,) {final _that = this;
switch (_that) {
case _PendingAccrual() when $default != null:
return $default(_that.id,_that.questName,_that.count,_that.requestedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PendingAccrual implements PendingAccrual {
  const _PendingAccrual({required this.id, required this.questName, required this.count, required this.requestedAt});
  factory _PendingAccrual.fromJson(Map<String, dynamic> json) => _$PendingAccrualFromJson(json);

@override final  int id;
@override final  String questName;
@override final  int count;
@override final  String requestedAt;

/// Create a copy of PendingAccrual
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PendingAccrualCopyWith<_PendingAccrual> get copyWith => __$PendingAccrualCopyWithImpl<_PendingAccrual>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PendingAccrualToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PendingAccrual&&(identical(other.id, id) || other.id == id)&&(identical(other.questName, questName) || other.questName == questName)&&(identical(other.count, count) || other.count == count)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,questName,count,requestedAt);

@override
String toString() {
  return 'PendingAccrual(id: $id, questName: $questName, count: $count, requestedAt: $requestedAt)';
}


}

/// @nodoc
abstract mixin class _$PendingAccrualCopyWith<$Res> implements $PendingAccrualCopyWith<$Res> {
  factory _$PendingAccrualCopyWith(_PendingAccrual value, $Res Function(_PendingAccrual) _then) = __$PendingAccrualCopyWithImpl;
@override @useResult
$Res call({
 int id, String questName, int count, String requestedAt
});




}
/// @nodoc
class __$PendingAccrualCopyWithImpl<$Res>
    implements _$PendingAccrualCopyWith<$Res> {
  __$PendingAccrualCopyWithImpl(this._self, this._then);

  final _PendingAccrual _self;
  final $Res Function(_PendingAccrual) _then;

/// Create a copy of PendingAccrual
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? questName = null,Object? count = null,Object? requestedAt = null,}) {
  return _then(_PendingAccrual(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,questName: null == questName ? _self.questName : questName // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
