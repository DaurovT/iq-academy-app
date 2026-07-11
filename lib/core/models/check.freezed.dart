// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckDrug {

 String get name; int get packs;
/// Create a copy of CheckDrug
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckDrugCopyWith<CheckDrug> get copyWith => _$CheckDrugCopyWithImpl<CheckDrug>(this as CheckDrug, _$identity);

  /// Serializes this CheckDrug to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckDrug&&(identical(other.name, name) || other.name == name)&&(identical(other.packs, packs) || other.packs == packs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,packs);

@override
String toString() {
  return 'CheckDrug(name: $name, packs: $packs)';
}


}

/// @nodoc
abstract mixin class $CheckDrugCopyWith<$Res>  {
  factory $CheckDrugCopyWith(CheckDrug value, $Res Function(CheckDrug) _then) = _$CheckDrugCopyWithImpl;
@useResult
$Res call({
 String name, int packs
});




}
/// @nodoc
class _$CheckDrugCopyWithImpl<$Res>
    implements $CheckDrugCopyWith<$Res> {
  _$CheckDrugCopyWithImpl(this._self, this._then);

  final CheckDrug _self;
  final $Res Function(CheckDrug) _then;

/// Create a copy of CheckDrug
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? packs = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,packs: null == packs ? _self.packs : packs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckDrug].
extension CheckDrugPatterns on CheckDrug {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckDrug value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckDrug() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckDrug value)  $default,){
final _that = this;
switch (_that) {
case _CheckDrug():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckDrug value)?  $default,){
final _that = this;
switch (_that) {
case _CheckDrug() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int packs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckDrug() when $default != null:
return $default(_that.name,_that.packs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int packs)  $default,) {final _that = this;
switch (_that) {
case _CheckDrug():
return $default(_that.name,_that.packs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int packs)?  $default,) {final _that = this;
switch (_that) {
case _CheckDrug() when $default != null:
return $default(_that.name,_that.packs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckDrug implements CheckDrug {
  const _CheckDrug({required this.name, required this.packs});
  factory _CheckDrug.fromJson(Map<String, dynamic> json) => _$CheckDrugFromJson(json);

@override final  String name;
@override final  int packs;

/// Create a copy of CheckDrug
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckDrugCopyWith<_CheckDrug> get copyWith => __$CheckDrugCopyWithImpl<_CheckDrug>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckDrugToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckDrug&&(identical(other.name, name) || other.name == name)&&(identical(other.packs, packs) || other.packs == packs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,packs);

@override
String toString() {
  return 'CheckDrug(name: $name, packs: $packs)';
}


}

/// @nodoc
abstract mixin class _$CheckDrugCopyWith<$Res> implements $CheckDrugCopyWith<$Res> {
  factory _$CheckDrugCopyWith(_CheckDrug value, $Res Function(_CheckDrug) _then) = __$CheckDrugCopyWithImpl;
@override @useResult
$Res call({
 String name, int packs
});




}
/// @nodoc
class __$CheckDrugCopyWithImpl<$Res>
    implements _$CheckDrugCopyWith<$Res> {
  __$CheckDrugCopyWithImpl(this._self, this._then);

  final _CheckDrug _self;
  final $Res Function(_CheckDrug) _then;

/// Create a copy of CheckDrug
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? packs = null,}) {
  return _then(_CheckDrug(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,packs: null == packs ? _self.packs : packs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Photo {

 int get id; String get url;
/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoCopyWith<Photo> get copyWith => _$PhotoCopyWithImpl<Photo>(this as Photo, _$identity);

  /// Serializes this Photo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Photo&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url);

@override
String toString() {
  return 'Photo(id: $id, url: $url)';
}


}

/// @nodoc
abstract mixin class $PhotoCopyWith<$Res>  {
  factory $PhotoCopyWith(Photo value, $Res Function(Photo) _then) = _$PhotoCopyWithImpl;
@useResult
$Res call({
 int id, String url
});




}
/// @nodoc
class _$PhotoCopyWithImpl<$Res>
    implements $PhotoCopyWith<$Res> {
  _$PhotoCopyWithImpl(this._self, this._then);

  final Photo _self;
  final $Res Function(Photo) _then;

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Photo].
extension PhotoPatterns on Photo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Photo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Photo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Photo value)  $default,){
final _that = this;
switch (_that) {
case _Photo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Photo value)?  $default,){
final _that = this;
switch (_that) {
case _Photo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Photo() when $default != null:
return $default(_that.id,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String url)  $default,) {final _that = this;
switch (_that) {
case _Photo():
return $default(_that.id,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String url)?  $default,) {final _that = this;
switch (_that) {
case _Photo() when $default != null:
return $default(_that.id,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Photo implements Photo {
  const _Photo({required this.id, required this.url});
  factory _Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

@override final  int id;
@override final  String url;

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoCopyWith<_Photo> get copyWith => __$PhotoCopyWithImpl<_Photo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Photo&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url);

@override
String toString() {
  return 'Photo(id: $id, url: $url)';
}


}

/// @nodoc
abstract mixin class _$PhotoCopyWith<$Res> implements $PhotoCopyWith<$Res> {
  factory _$PhotoCopyWith(_Photo value, $Res Function(_Photo) _then) = __$PhotoCopyWithImpl;
@override @useResult
$Res call({
 int id, String url
});




}
/// @nodoc
class __$PhotoCopyWithImpl<$Res>
    implements _$PhotoCopyWith<$Res> {
  __$PhotoCopyWithImpl(this._self, this._then);

  final _Photo _self;
  final $Res Function(_Photo) _then;

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,}) {
  return _then(_Photo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Check {

 int get id; CheckStatus get status; String get createdAt; int get photoCount; List<CheckDrug> get drugs; String? get rejectReason;
/// Create a copy of Check
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckCopyWith<Check> get copyWith => _$CheckCopyWithImpl<Check>(this as Check, _$identity);

  /// Serializes this Check to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Check&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.photoCount, photoCount) || other.photoCount == photoCount)&&const DeepCollectionEquality().equals(other.drugs, drugs)&&(identical(other.rejectReason, rejectReason) || other.rejectReason == rejectReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,createdAt,photoCount,const DeepCollectionEquality().hash(drugs),rejectReason);

@override
String toString() {
  return 'Check(id: $id, status: $status, createdAt: $createdAt, photoCount: $photoCount, drugs: $drugs, rejectReason: $rejectReason)';
}


}

/// @nodoc
abstract mixin class $CheckCopyWith<$Res>  {
  factory $CheckCopyWith(Check value, $Res Function(Check) _then) = _$CheckCopyWithImpl;
@useResult
$Res call({
 int id, CheckStatus status, String createdAt, int photoCount, List<CheckDrug> drugs, String? rejectReason
});




}
/// @nodoc
class _$CheckCopyWithImpl<$Res>
    implements $CheckCopyWith<$Res> {
  _$CheckCopyWithImpl(this._self, this._then);

  final Check _self;
  final $Res Function(Check) _then;

/// Create a copy of Check
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? createdAt = null,Object? photoCount = null,Object? drugs = null,Object? rejectReason = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CheckStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,photoCount: null == photoCount ? _self.photoCount : photoCount // ignore: cast_nullable_to_non_nullable
as int,drugs: null == drugs ? _self.drugs : drugs // ignore: cast_nullable_to_non_nullable
as List<CheckDrug>,rejectReason: freezed == rejectReason ? _self.rejectReason : rejectReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Check].
extension CheckPatterns on Check {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Check value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Check() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Check value)  $default,){
final _that = this;
switch (_that) {
case _Check():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Check value)?  $default,){
final _that = this;
switch (_that) {
case _Check() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  CheckStatus status,  String createdAt,  int photoCount,  List<CheckDrug> drugs,  String? rejectReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Check() when $default != null:
return $default(_that.id,_that.status,_that.createdAt,_that.photoCount,_that.drugs,_that.rejectReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  CheckStatus status,  String createdAt,  int photoCount,  List<CheckDrug> drugs,  String? rejectReason)  $default,) {final _that = this;
switch (_that) {
case _Check():
return $default(_that.id,_that.status,_that.createdAt,_that.photoCount,_that.drugs,_that.rejectReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  CheckStatus status,  String createdAt,  int photoCount,  List<CheckDrug> drugs,  String? rejectReason)?  $default,) {final _that = this;
switch (_that) {
case _Check() when $default != null:
return $default(_that.id,_that.status,_that.createdAt,_that.photoCount,_that.drugs,_that.rejectReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Check implements Check {
  const _Check({required this.id, required this.status, required this.createdAt, required this.photoCount, required final  List<CheckDrug> drugs, this.rejectReason}): _drugs = drugs;
  factory _Check.fromJson(Map<String, dynamic> json) => _$CheckFromJson(json);

@override final  int id;
@override final  CheckStatus status;
@override final  String createdAt;
@override final  int photoCount;
 final  List<CheckDrug> _drugs;
@override List<CheckDrug> get drugs {
  if (_drugs is EqualUnmodifiableListView) return _drugs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_drugs);
}

@override final  String? rejectReason;

/// Create a copy of Check
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckCopyWith<_Check> get copyWith => __$CheckCopyWithImpl<_Check>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Check&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.photoCount, photoCount) || other.photoCount == photoCount)&&const DeepCollectionEquality().equals(other._drugs, _drugs)&&(identical(other.rejectReason, rejectReason) || other.rejectReason == rejectReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,createdAt,photoCount,const DeepCollectionEquality().hash(_drugs),rejectReason);

@override
String toString() {
  return 'Check(id: $id, status: $status, createdAt: $createdAt, photoCount: $photoCount, drugs: $drugs, rejectReason: $rejectReason)';
}


}

/// @nodoc
abstract mixin class _$CheckCopyWith<$Res> implements $CheckCopyWith<$Res> {
  factory _$CheckCopyWith(_Check value, $Res Function(_Check) _then) = __$CheckCopyWithImpl;
@override @useResult
$Res call({
 int id, CheckStatus status, String createdAt, int photoCount, List<CheckDrug> drugs, String? rejectReason
});




}
/// @nodoc
class __$CheckCopyWithImpl<$Res>
    implements _$CheckCopyWith<$Res> {
  __$CheckCopyWithImpl(this._self, this._then);

  final _Check _self;
  final $Res Function(_Check) _then;

/// Create a copy of Check
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? createdAt = null,Object? photoCount = null,Object? drugs = null,Object? rejectReason = freezed,}) {
  return _then(_Check(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CheckStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,photoCount: null == photoCount ? _self.photoCount : photoCount // ignore: cast_nullable_to_non_nullable
as int,drugs: null == drugs ? _self._drugs : drugs // ignore: cast_nullable_to_non_nullable
as List<CheckDrug>,rejectReason: freezed == rejectReason ? _self.rejectReason : rejectReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CheckAllocation {

 int get questId; String get questName; int get packs;
/// Create a copy of CheckAllocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckAllocationCopyWith<CheckAllocation> get copyWith => _$CheckAllocationCopyWithImpl<CheckAllocation>(this as CheckAllocation, _$identity);

  /// Serializes this CheckAllocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckAllocation&&(identical(other.questId, questId) || other.questId == questId)&&(identical(other.questName, questName) || other.questName == questName)&&(identical(other.packs, packs) || other.packs == packs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questId,questName,packs);

@override
String toString() {
  return 'CheckAllocation(questId: $questId, questName: $questName, packs: $packs)';
}


}

/// @nodoc
abstract mixin class $CheckAllocationCopyWith<$Res>  {
  factory $CheckAllocationCopyWith(CheckAllocation value, $Res Function(CheckAllocation) _then) = _$CheckAllocationCopyWithImpl;
@useResult
$Res call({
 int questId, String questName, int packs
});




}
/// @nodoc
class _$CheckAllocationCopyWithImpl<$Res>
    implements $CheckAllocationCopyWith<$Res> {
  _$CheckAllocationCopyWithImpl(this._self, this._then);

  final CheckAllocation _self;
  final $Res Function(CheckAllocation) _then;

/// Create a copy of CheckAllocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questId = null,Object? questName = null,Object? packs = null,}) {
  return _then(_self.copyWith(
questId: null == questId ? _self.questId : questId // ignore: cast_nullable_to_non_nullable
as int,questName: null == questName ? _self.questName : questName // ignore: cast_nullable_to_non_nullable
as String,packs: null == packs ? _self.packs : packs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckAllocation].
extension CheckAllocationPatterns on CheckAllocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckAllocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckAllocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckAllocation value)  $default,){
final _that = this;
switch (_that) {
case _CheckAllocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckAllocation value)?  $default,){
final _that = this;
switch (_that) {
case _CheckAllocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int questId,  String questName,  int packs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckAllocation() when $default != null:
return $default(_that.questId,_that.questName,_that.packs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int questId,  String questName,  int packs)  $default,) {final _that = this;
switch (_that) {
case _CheckAllocation():
return $default(_that.questId,_that.questName,_that.packs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int questId,  String questName,  int packs)?  $default,) {final _that = this;
switch (_that) {
case _CheckAllocation() when $default != null:
return $default(_that.questId,_that.questName,_that.packs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckAllocation implements CheckAllocation {
  const _CheckAllocation({required this.questId, required this.questName, required this.packs});
  factory _CheckAllocation.fromJson(Map<String, dynamic> json) => _$CheckAllocationFromJson(json);

@override final  int questId;
@override final  String questName;
@override final  int packs;

/// Create a copy of CheckAllocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckAllocationCopyWith<_CheckAllocation> get copyWith => __$CheckAllocationCopyWithImpl<_CheckAllocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckAllocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckAllocation&&(identical(other.questId, questId) || other.questId == questId)&&(identical(other.questName, questName) || other.questName == questName)&&(identical(other.packs, packs) || other.packs == packs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questId,questName,packs);

@override
String toString() {
  return 'CheckAllocation(questId: $questId, questName: $questName, packs: $packs)';
}


}

/// @nodoc
abstract mixin class _$CheckAllocationCopyWith<$Res> implements $CheckAllocationCopyWith<$Res> {
  factory _$CheckAllocationCopyWith(_CheckAllocation value, $Res Function(_CheckAllocation) _then) = __$CheckAllocationCopyWithImpl;
@override @useResult
$Res call({
 int questId, String questName, int packs
});




}
/// @nodoc
class __$CheckAllocationCopyWithImpl<$Res>
    implements _$CheckAllocationCopyWith<$Res> {
  __$CheckAllocationCopyWithImpl(this._self, this._then);

  final _CheckAllocation _self;
  final $Res Function(_CheckAllocation) _then;

/// Create a copy of CheckAllocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questId = null,Object? questName = null,Object? packs = null,}) {
  return _then(_CheckAllocation(
questId: null == questId ? _self.questId : questId // ignore: cast_nullable_to_non_nullable
as int,questName: null == questName ? _self.questName : questName // ignore: cast_nullable_to_non_nullable
as String,packs: null == packs ? _self.packs : packs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CheckDetail {

 int get id; CheckStatus get status; String get createdAt; int get photoCount; List<CheckDrug> get drugs; String? get rejectReason; List<Photo> get photos; String? get aiText; List<CheckAllocation> get allocations;
/// Create a copy of CheckDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckDetailCopyWith<CheckDetail> get copyWith => _$CheckDetailCopyWithImpl<CheckDetail>(this as CheckDetail, _$identity);

  /// Serializes this CheckDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.photoCount, photoCount) || other.photoCount == photoCount)&&const DeepCollectionEquality().equals(other.drugs, drugs)&&(identical(other.rejectReason, rejectReason) || other.rejectReason == rejectReason)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.aiText, aiText) || other.aiText == aiText)&&const DeepCollectionEquality().equals(other.allocations, allocations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,createdAt,photoCount,const DeepCollectionEquality().hash(drugs),rejectReason,const DeepCollectionEquality().hash(photos),aiText,const DeepCollectionEquality().hash(allocations));

@override
String toString() {
  return 'CheckDetail(id: $id, status: $status, createdAt: $createdAt, photoCount: $photoCount, drugs: $drugs, rejectReason: $rejectReason, photos: $photos, aiText: $aiText, allocations: $allocations)';
}


}

/// @nodoc
abstract mixin class $CheckDetailCopyWith<$Res>  {
  factory $CheckDetailCopyWith(CheckDetail value, $Res Function(CheckDetail) _then) = _$CheckDetailCopyWithImpl;
@useResult
$Res call({
 int id, CheckStatus status, String createdAt, int photoCount, List<CheckDrug> drugs, String? rejectReason, List<Photo> photos, String? aiText, List<CheckAllocation> allocations
});




}
/// @nodoc
class _$CheckDetailCopyWithImpl<$Res>
    implements $CheckDetailCopyWith<$Res> {
  _$CheckDetailCopyWithImpl(this._self, this._then);

  final CheckDetail _self;
  final $Res Function(CheckDetail) _then;

/// Create a copy of CheckDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? createdAt = null,Object? photoCount = null,Object? drugs = null,Object? rejectReason = freezed,Object? photos = null,Object? aiText = freezed,Object? allocations = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CheckStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,photoCount: null == photoCount ? _self.photoCount : photoCount // ignore: cast_nullable_to_non_nullable
as int,drugs: null == drugs ? _self.drugs : drugs // ignore: cast_nullable_to_non_nullable
as List<CheckDrug>,rejectReason: freezed == rejectReason ? _self.rejectReason : rejectReason // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<Photo>,aiText: freezed == aiText ? _self.aiText : aiText // ignore: cast_nullable_to_non_nullable
as String?,allocations: null == allocations ? _self.allocations : allocations // ignore: cast_nullable_to_non_nullable
as List<CheckAllocation>,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckDetail].
extension CheckDetailPatterns on CheckDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckDetail value)  $default,){
final _that = this;
switch (_that) {
case _CheckDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckDetail value)?  $default,){
final _that = this;
switch (_that) {
case _CheckDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  CheckStatus status,  String createdAt,  int photoCount,  List<CheckDrug> drugs,  String? rejectReason,  List<Photo> photos,  String? aiText,  List<CheckAllocation> allocations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckDetail() when $default != null:
return $default(_that.id,_that.status,_that.createdAt,_that.photoCount,_that.drugs,_that.rejectReason,_that.photos,_that.aiText,_that.allocations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  CheckStatus status,  String createdAt,  int photoCount,  List<CheckDrug> drugs,  String? rejectReason,  List<Photo> photos,  String? aiText,  List<CheckAllocation> allocations)  $default,) {final _that = this;
switch (_that) {
case _CheckDetail():
return $default(_that.id,_that.status,_that.createdAt,_that.photoCount,_that.drugs,_that.rejectReason,_that.photos,_that.aiText,_that.allocations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  CheckStatus status,  String createdAt,  int photoCount,  List<CheckDrug> drugs,  String? rejectReason,  List<Photo> photos,  String? aiText,  List<CheckAllocation> allocations)?  $default,) {final _that = this;
switch (_that) {
case _CheckDetail() when $default != null:
return $default(_that.id,_that.status,_that.createdAt,_that.photoCount,_that.drugs,_that.rejectReason,_that.photos,_that.aiText,_that.allocations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckDetail implements CheckDetail {
  const _CheckDetail({required this.id, required this.status, required this.createdAt, required this.photoCount, required final  List<CheckDrug> drugs, this.rejectReason, required final  List<Photo> photos, this.aiText, required final  List<CheckAllocation> allocations}): _drugs = drugs,_photos = photos,_allocations = allocations;
  factory _CheckDetail.fromJson(Map<String, dynamic> json) => _$CheckDetailFromJson(json);

@override final  int id;
@override final  CheckStatus status;
@override final  String createdAt;
@override final  int photoCount;
 final  List<CheckDrug> _drugs;
@override List<CheckDrug> get drugs {
  if (_drugs is EqualUnmodifiableListView) return _drugs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_drugs);
}

@override final  String? rejectReason;
 final  List<Photo> _photos;
@override List<Photo> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override final  String? aiText;
 final  List<CheckAllocation> _allocations;
@override List<CheckAllocation> get allocations {
  if (_allocations is EqualUnmodifiableListView) return _allocations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allocations);
}


/// Create a copy of CheckDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckDetailCopyWith<_CheckDetail> get copyWith => __$CheckDetailCopyWithImpl<_CheckDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.photoCount, photoCount) || other.photoCount == photoCount)&&const DeepCollectionEquality().equals(other._drugs, _drugs)&&(identical(other.rejectReason, rejectReason) || other.rejectReason == rejectReason)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.aiText, aiText) || other.aiText == aiText)&&const DeepCollectionEquality().equals(other._allocations, _allocations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,createdAt,photoCount,const DeepCollectionEquality().hash(_drugs),rejectReason,const DeepCollectionEquality().hash(_photos),aiText,const DeepCollectionEquality().hash(_allocations));

@override
String toString() {
  return 'CheckDetail(id: $id, status: $status, createdAt: $createdAt, photoCount: $photoCount, drugs: $drugs, rejectReason: $rejectReason, photos: $photos, aiText: $aiText, allocations: $allocations)';
}


}

/// @nodoc
abstract mixin class _$CheckDetailCopyWith<$Res> implements $CheckDetailCopyWith<$Res> {
  factory _$CheckDetailCopyWith(_CheckDetail value, $Res Function(_CheckDetail) _then) = __$CheckDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, CheckStatus status, String createdAt, int photoCount, List<CheckDrug> drugs, String? rejectReason, List<Photo> photos, String? aiText, List<CheckAllocation> allocations
});




}
/// @nodoc
class __$CheckDetailCopyWithImpl<$Res>
    implements _$CheckDetailCopyWith<$Res> {
  __$CheckDetailCopyWithImpl(this._self, this._then);

  final _CheckDetail _self;
  final $Res Function(_CheckDetail) _then;

/// Create a copy of CheckDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? createdAt = null,Object? photoCount = null,Object? drugs = null,Object? rejectReason = freezed,Object? photos = null,Object? aiText = freezed,Object? allocations = null,}) {
  return _then(_CheckDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CheckStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,photoCount: null == photoCount ? _self.photoCount : photoCount // ignore: cast_nullable_to_non_nullable
as int,drugs: null == drugs ? _self._drugs : drugs // ignore: cast_nullable_to_non_nullable
as List<CheckDrug>,rejectReason: freezed == rejectReason ? _self.rejectReason : rejectReason // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<Photo>,aiText: freezed == aiText ? _self.aiText : aiText // ignore: cast_nullable_to_non_nullable
as String?,allocations: null == allocations ? _self._allocations : allocations // ignore: cast_nullable_to_non_nullable
as List<CheckAllocation>,
  ));
}


}


/// @nodoc
mixin _$RecipeDrug {

 String get name; int get qty;
/// Create a copy of RecipeDrug
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeDrugCopyWith<RecipeDrug> get copyWith => _$RecipeDrugCopyWithImpl<RecipeDrug>(this as RecipeDrug, _$identity);

  /// Serializes this RecipeDrug to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeDrug&&(identical(other.name, name) || other.name == name)&&(identical(other.qty, qty) || other.qty == qty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,qty);

@override
String toString() {
  return 'RecipeDrug(name: $name, qty: $qty)';
}


}

/// @nodoc
abstract mixin class $RecipeDrugCopyWith<$Res>  {
  factory $RecipeDrugCopyWith(RecipeDrug value, $Res Function(RecipeDrug) _then) = _$RecipeDrugCopyWithImpl;
@useResult
$Res call({
 String name, int qty
});




}
/// @nodoc
class _$RecipeDrugCopyWithImpl<$Res>
    implements $RecipeDrugCopyWith<$Res> {
  _$RecipeDrugCopyWithImpl(this._self, this._then);

  final RecipeDrug _self;
  final $Res Function(RecipeDrug) _then;

/// Create a copy of RecipeDrug
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? qty = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeDrug].
extension RecipeDrugPatterns on RecipeDrug {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeDrug value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeDrug() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeDrug value)  $default,){
final _that = this;
switch (_that) {
case _RecipeDrug():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeDrug value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeDrug() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int qty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeDrug() when $default != null:
return $default(_that.name,_that.qty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int qty)  $default,) {final _that = this;
switch (_that) {
case _RecipeDrug():
return $default(_that.name,_that.qty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int qty)?  $default,) {final _that = this;
switch (_that) {
case _RecipeDrug() when $default != null:
return $default(_that.name,_that.qty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeDrug implements RecipeDrug {
  const _RecipeDrug({required this.name, required this.qty});
  factory _RecipeDrug.fromJson(Map<String, dynamic> json) => _$RecipeDrugFromJson(json);

@override final  String name;
@override final  int qty;

/// Create a copy of RecipeDrug
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeDrugCopyWith<_RecipeDrug> get copyWith => __$RecipeDrugCopyWithImpl<_RecipeDrug>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeDrugToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeDrug&&(identical(other.name, name) || other.name == name)&&(identical(other.qty, qty) || other.qty == qty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,qty);

@override
String toString() {
  return 'RecipeDrug(name: $name, qty: $qty)';
}


}

/// @nodoc
abstract mixin class _$RecipeDrugCopyWith<$Res> implements $RecipeDrugCopyWith<$Res> {
  factory _$RecipeDrugCopyWith(_RecipeDrug value, $Res Function(_RecipeDrug) _then) = __$RecipeDrugCopyWithImpl;
@override @useResult
$Res call({
 String name, int qty
});




}
/// @nodoc
class __$RecipeDrugCopyWithImpl<$Res>
    implements _$RecipeDrugCopyWith<$Res> {
  __$RecipeDrugCopyWithImpl(this._self, this._then);

  final _RecipeDrug _self;
  final $Res Function(_RecipeDrug) _then;

/// Create a copy of RecipeDrug
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? qty = null,}) {
  return _then(_RecipeDrug(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Recipe {

 int get id; CheckStatus get status; String get createdAt; int get photoCount; List<RecipeDrug> get drugs; String? get rejectReason;
/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeCopyWith<Recipe> get copyWith => _$RecipeCopyWithImpl<Recipe>(this as Recipe, _$identity);

  /// Serializes this Recipe to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recipe&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.photoCount, photoCount) || other.photoCount == photoCount)&&const DeepCollectionEquality().equals(other.drugs, drugs)&&(identical(other.rejectReason, rejectReason) || other.rejectReason == rejectReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,createdAt,photoCount,const DeepCollectionEquality().hash(drugs),rejectReason);

@override
String toString() {
  return 'Recipe(id: $id, status: $status, createdAt: $createdAt, photoCount: $photoCount, drugs: $drugs, rejectReason: $rejectReason)';
}


}

/// @nodoc
abstract mixin class $RecipeCopyWith<$Res>  {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) _then) = _$RecipeCopyWithImpl;
@useResult
$Res call({
 int id, CheckStatus status, String createdAt, int photoCount, List<RecipeDrug> drugs, String? rejectReason
});




}
/// @nodoc
class _$RecipeCopyWithImpl<$Res>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._self, this._then);

  final Recipe _self;
  final $Res Function(Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? createdAt = null,Object? photoCount = null,Object? drugs = null,Object? rejectReason = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CheckStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,photoCount: null == photoCount ? _self.photoCount : photoCount // ignore: cast_nullable_to_non_nullable
as int,drugs: null == drugs ? _self.drugs : drugs // ignore: cast_nullable_to_non_nullable
as List<RecipeDrug>,rejectReason: freezed == rejectReason ? _self.rejectReason : rejectReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Recipe].
extension RecipePatterns on Recipe {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Recipe value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Recipe() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Recipe value)  $default,){
final _that = this;
switch (_that) {
case _Recipe():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Recipe value)?  $default,){
final _that = this;
switch (_that) {
case _Recipe() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  CheckStatus status,  String createdAt,  int photoCount,  List<RecipeDrug> drugs,  String? rejectReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Recipe() when $default != null:
return $default(_that.id,_that.status,_that.createdAt,_that.photoCount,_that.drugs,_that.rejectReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  CheckStatus status,  String createdAt,  int photoCount,  List<RecipeDrug> drugs,  String? rejectReason)  $default,) {final _that = this;
switch (_that) {
case _Recipe():
return $default(_that.id,_that.status,_that.createdAt,_that.photoCount,_that.drugs,_that.rejectReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  CheckStatus status,  String createdAt,  int photoCount,  List<RecipeDrug> drugs,  String? rejectReason)?  $default,) {final _that = this;
switch (_that) {
case _Recipe() when $default != null:
return $default(_that.id,_that.status,_that.createdAt,_that.photoCount,_that.drugs,_that.rejectReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Recipe implements Recipe {
  const _Recipe({required this.id, required this.status, required this.createdAt, required this.photoCount, required final  List<RecipeDrug> drugs, this.rejectReason}): _drugs = drugs;
  factory _Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

@override final  int id;
@override final  CheckStatus status;
@override final  String createdAt;
@override final  int photoCount;
 final  List<RecipeDrug> _drugs;
@override List<RecipeDrug> get drugs {
  if (_drugs is EqualUnmodifiableListView) return _drugs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_drugs);
}

@override final  String? rejectReason;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeCopyWith<_Recipe> get copyWith => __$RecipeCopyWithImpl<_Recipe>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recipe&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.photoCount, photoCount) || other.photoCount == photoCount)&&const DeepCollectionEquality().equals(other._drugs, _drugs)&&(identical(other.rejectReason, rejectReason) || other.rejectReason == rejectReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,createdAt,photoCount,const DeepCollectionEquality().hash(_drugs),rejectReason);

@override
String toString() {
  return 'Recipe(id: $id, status: $status, createdAt: $createdAt, photoCount: $photoCount, drugs: $drugs, rejectReason: $rejectReason)';
}


}

/// @nodoc
abstract mixin class _$RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$RecipeCopyWith(_Recipe value, $Res Function(_Recipe) _then) = __$RecipeCopyWithImpl;
@override @useResult
$Res call({
 int id, CheckStatus status, String createdAt, int photoCount, List<RecipeDrug> drugs, String? rejectReason
});




}
/// @nodoc
class __$RecipeCopyWithImpl<$Res>
    implements _$RecipeCopyWith<$Res> {
  __$RecipeCopyWithImpl(this._self, this._then);

  final _Recipe _self;
  final $Res Function(_Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? createdAt = null,Object? photoCount = null,Object? drugs = null,Object? rejectReason = freezed,}) {
  return _then(_Recipe(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CheckStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,photoCount: null == photoCount ? _self.photoCount : photoCount // ignore: cast_nullable_to_non_nullable
as int,drugs: null == drugs ? _self._drugs : drugs // ignore: cast_nullable_to_non_nullable
as List<RecipeDrug>,rejectReason: freezed == rejectReason ? _self.rejectReason : rejectReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RecipeDetail {

 int get id; CheckStatus get status; String get createdAt; int get photoCount; List<RecipeDrug> get drugs; String? get rejectReason; List<Photo> get photos; String? get aiText;
/// Create a copy of RecipeDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeDetailCopyWith<RecipeDetail> get copyWith => _$RecipeDetailCopyWithImpl<RecipeDetail>(this as RecipeDetail, _$identity);

  /// Serializes this RecipeDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.photoCount, photoCount) || other.photoCount == photoCount)&&const DeepCollectionEquality().equals(other.drugs, drugs)&&(identical(other.rejectReason, rejectReason) || other.rejectReason == rejectReason)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.aiText, aiText) || other.aiText == aiText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,createdAt,photoCount,const DeepCollectionEquality().hash(drugs),rejectReason,const DeepCollectionEquality().hash(photos),aiText);

@override
String toString() {
  return 'RecipeDetail(id: $id, status: $status, createdAt: $createdAt, photoCount: $photoCount, drugs: $drugs, rejectReason: $rejectReason, photos: $photos, aiText: $aiText)';
}


}

/// @nodoc
abstract mixin class $RecipeDetailCopyWith<$Res>  {
  factory $RecipeDetailCopyWith(RecipeDetail value, $Res Function(RecipeDetail) _then) = _$RecipeDetailCopyWithImpl;
@useResult
$Res call({
 int id, CheckStatus status, String createdAt, int photoCount, List<RecipeDrug> drugs, String? rejectReason, List<Photo> photos, String? aiText
});




}
/// @nodoc
class _$RecipeDetailCopyWithImpl<$Res>
    implements $RecipeDetailCopyWith<$Res> {
  _$RecipeDetailCopyWithImpl(this._self, this._then);

  final RecipeDetail _self;
  final $Res Function(RecipeDetail) _then;

/// Create a copy of RecipeDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? createdAt = null,Object? photoCount = null,Object? drugs = null,Object? rejectReason = freezed,Object? photos = null,Object? aiText = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CheckStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,photoCount: null == photoCount ? _self.photoCount : photoCount // ignore: cast_nullable_to_non_nullable
as int,drugs: null == drugs ? _self.drugs : drugs // ignore: cast_nullable_to_non_nullable
as List<RecipeDrug>,rejectReason: freezed == rejectReason ? _self.rejectReason : rejectReason // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<Photo>,aiText: freezed == aiText ? _self.aiText : aiText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeDetail].
extension RecipeDetailPatterns on RecipeDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeDetail value)  $default,){
final _that = this;
switch (_that) {
case _RecipeDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeDetail value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  CheckStatus status,  String createdAt,  int photoCount,  List<RecipeDrug> drugs,  String? rejectReason,  List<Photo> photos,  String? aiText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeDetail() when $default != null:
return $default(_that.id,_that.status,_that.createdAt,_that.photoCount,_that.drugs,_that.rejectReason,_that.photos,_that.aiText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  CheckStatus status,  String createdAt,  int photoCount,  List<RecipeDrug> drugs,  String? rejectReason,  List<Photo> photos,  String? aiText)  $default,) {final _that = this;
switch (_that) {
case _RecipeDetail():
return $default(_that.id,_that.status,_that.createdAt,_that.photoCount,_that.drugs,_that.rejectReason,_that.photos,_that.aiText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  CheckStatus status,  String createdAt,  int photoCount,  List<RecipeDrug> drugs,  String? rejectReason,  List<Photo> photos,  String? aiText)?  $default,) {final _that = this;
switch (_that) {
case _RecipeDetail() when $default != null:
return $default(_that.id,_that.status,_that.createdAt,_that.photoCount,_that.drugs,_that.rejectReason,_that.photos,_that.aiText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeDetail implements RecipeDetail {
  const _RecipeDetail({required this.id, required this.status, required this.createdAt, required this.photoCount, required final  List<RecipeDrug> drugs, this.rejectReason, required final  List<Photo> photos, this.aiText}): _drugs = drugs,_photos = photos;
  factory _RecipeDetail.fromJson(Map<String, dynamic> json) => _$RecipeDetailFromJson(json);

@override final  int id;
@override final  CheckStatus status;
@override final  String createdAt;
@override final  int photoCount;
 final  List<RecipeDrug> _drugs;
@override List<RecipeDrug> get drugs {
  if (_drugs is EqualUnmodifiableListView) return _drugs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_drugs);
}

@override final  String? rejectReason;
 final  List<Photo> _photos;
@override List<Photo> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override final  String? aiText;

/// Create a copy of RecipeDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeDetailCopyWith<_RecipeDetail> get copyWith => __$RecipeDetailCopyWithImpl<_RecipeDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.photoCount, photoCount) || other.photoCount == photoCount)&&const DeepCollectionEquality().equals(other._drugs, _drugs)&&(identical(other.rejectReason, rejectReason) || other.rejectReason == rejectReason)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.aiText, aiText) || other.aiText == aiText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,createdAt,photoCount,const DeepCollectionEquality().hash(_drugs),rejectReason,const DeepCollectionEquality().hash(_photos),aiText);

@override
String toString() {
  return 'RecipeDetail(id: $id, status: $status, createdAt: $createdAt, photoCount: $photoCount, drugs: $drugs, rejectReason: $rejectReason, photos: $photos, aiText: $aiText)';
}


}

/// @nodoc
abstract mixin class _$RecipeDetailCopyWith<$Res> implements $RecipeDetailCopyWith<$Res> {
  factory _$RecipeDetailCopyWith(_RecipeDetail value, $Res Function(_RecipeDetail) _then) = __$RecipeDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, CheckStatus status, String createdAt, int photoCount, List<RecipeDrug> drugs, String? rejectReason, List<Photo> photos, String? aiText
});




}
/// @nodoc
class __$RecipeDetailCopyWithImpl<$Res>
    implements _$RecipeDetailCopyWith<$Res> {
  __$RecipeDetailCopyWithImpl(this._self, this._then);

  final _RecipeDetail _self;
  final $Res Function(_RecipeDetail) _then;

/// Create a copy of RecipeDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? createdAt = null,Object? photoCount = null,Object? drugs = null,Object? rejectReason = freezed,Object? photos = null,Object? aiText = freezed,}) {
  return _then(_RecipeDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CheckStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,photoCount: null == photoCount ? _self.photoCount : photoCount // ignore: cast_nullable_to_non_nullable
as int,drugs: null == drugs ? _self._drugs : drugs // ignore: cast_nullable_to_non_nullable
as List<RecipeDrug>,rejectReason: freezed == rejectReason ? _self.rejectReason : rejectReason // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<Photo>,aiText: freezed == aiText ? _self.aiText : aiText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
