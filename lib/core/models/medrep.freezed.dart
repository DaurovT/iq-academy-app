// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medrep.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MedrepMetrics {

 AttributionMode get mode; int get pharmCount; int get checksCount; int get approvedPacksSum; int get questsDone;
/// Create a copy of MedrepMetrics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedrepMetricsCopyWith<MedrepMetrics> get copyWith => _$MedrepMetricsCopyWithImpl<MedrepMetrics>(this as MedrepMetrics, _$identity);

  /// Serializes this MedrepMetrics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedrepMetrics&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.pharmCount, pharmCount) || other.pharmCount == pharmCount)&&(identical(other.checksCount, checksCount) || other.checksCount == checksCount)&&(identical(other.approvedPacksSum, approvedPacksSum) || other.approvedPacksSum == approvedPacksSum)&&(identical(other.questsDone, questsDone) || other.questsDone == questsDone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode,pharmCount,checksCount,approvedPacksSum,questsDone);

@override
String toString() {
  return 'MedrepMetrics(mode: $mode, pharmCount: $pharmCount, checksCount: $checksCount, approvedPacksSum: $approvedPacksSum, questsDone: $questsDone)';
}


}

/// @nodoc
abstract mixin class $MedrepMetricsCopyWith<$Res>  {
  factory $MedrepMetricsCopyWith(MedrepMetrics value, $Res Function(MedrepMetrics) _then) = _$MedrepMetricsCopyWithImpl;
@useResult
$Res call({
 AttributionMode mode, int pharmCount, int checksCount, int approvedPacksSum, int questsDone
});




}
/// @nodoc
class _$MedrepMetricsCopyWithImpl<$Res>
    implements $MedrepMetricsCopyWith<$Res> {
  _$MedrepMetricsCopyWithImpl(this._self, this._then);

  final MedrepMetrics _self;
  final $Res Function(MedrepMetrics) _then;

/// Create a copy of MedrepMetrics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? pharmCount = null,Object? checksCount = null,Object? approvedPacksSum = null,Object? questsDone = null,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AttributionMode,pharmCount: null == pharmCount ? _self.pharmCount : pharmCount // ignore: cast_nullable_to_non_nullable
as int,checksCount: null == checksCount ? _self.checksCount : checksCount // ignore: cast_nullable_to_non_nullable
as int,approvedPacksSum: null == approvedPacksSum ? _self.approvedPacksSum : approvedPacksSum // ignore: cast_nullable_to_non_nullable
as int,questsDone: null == questsDone ? _self.questsDone : questsDone // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MedrepMetrics].
extension MedrepMetricsPatterns on MedrepMetrics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedrepMetrics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedrepMetrics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedrepMetrics value)  $default,){
final _that = this;
switch (_that) {
case _MedrepMetrics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedrepMetrics value)?  $default,){
final _that = this;
switch (_that) {
case _MedrepMetrics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AttributionMode mode,  int pharmCount,  int checksCount,  int approvedPacksSum,  int questsDone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedrepMetrics() when $default != null:
return $default(_that.mode,_that.pharmCount,_that.checksCount,_that.approvedPacksSum,_that.questsDone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AttributionMode mode,  int pharmCount,  int checksCount,  int approvedPacksSum,  int questsDone)  $default,) {final _that = this;
switch (_that) {
case _MedrepMetrics():
return $default(_that.mode,_that.pharmCount,_that.checksCount,_that.approvedPacksSum,_that.questsDone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AttributionMode mode,  int pharmCount,  int checksCount,  int approvedPacksSum,  int questsDone)?  $default,) {final _that = this;
switch (_that) {
case _MedrepMetrics() when $default != null:
return $default(_that.mode,_that.pharmCount,_that.checksCount,_that.approvedPacksSum,_that.questsDone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedrepMetrics implements MedrepMetrics {
  const _MedrepMetrics({required this.mode, required this.pharmCount, required this.checksCount, required this.approvedPacksSum, required this.questsDone});
  factory _MedrepMetrics.fromJson(Map<String, dynamic> json) => _$MedrepMetricsFromJson(json);

@override final  AttributionMode mode;
@override final  int pharmCount;
@override final  int checksCount;
@override final  int approvedPacksSum;
@override final  int questsDone;

/// Create a copy of MedrepMetrics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedrepMetricsCopyWith<_MedrepMetrics> get copyWith => __$MedrepMetricsCopyWithImpl<_MedrepMetrics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedrepMetricsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedrepMetrics&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.pharmCount, pharmCount) || other.pharmCount == pharmCount)&&(identical(other.checksCount, checksCount) || other.checksCount == checksCount)&&(identical(other.approvedPacksSum, approvedPacksSum) || other.approvedPacksSum == approvedPacksSum)&&(identical(other.questsDone, questsDone) || other.questsDone == questsDone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode,pharmCount,checksCount,approvedPacksSum,questsDone);

@override
String toString() {
  return 'MedrepMetrics(mode: $mode, pharmCount: $pharmCount, checksCount: $checksCount, approvedPacksSum: $approvedPacksSum, questsDone: $questsDone)';
}


}

/// @nodoc
abstract mixin class _$MedrepMetricsCopyWith<$Res> implements $MedrepMetricsCopyWith<$Res> {
  factory _$MedrepMetricsCopyWith(_MedrepMetrics value, $Res Function(_MedrepMetrics) _then) = __$MedrepMetricsCopyWithImpl;
@override @useResult
$Res call({
 AttributionMode mode, int pharmCount, int checksCount, int approvedPacksSum, int questsDone
});




}
/// @nodoc
class __$MedrepMetricsCopyWithImpl<$Res>
    implements _$MedrepMetricsCopyWith<$Res> {
  __$MedrepMetricsCopyWithImpl(this._self, this._then);

  final _MedrepMetrics _self;
  final $Res Function(_MedrepMetrics) _then;

/// Create a copy of MedrepMetrics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? pharmCount = null,Object? checksCount = null,Object? approvedPacksSum = null,Object? questsDone = null,}) {
  return _then(_MedrepMetrics(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AttributionMode,pharmCount: null == pharmCount ? _self.pharmCount : pharmCount // ignore: cast_nullable_to_non_nullable
as int,checksCount: null == checksCount ? _self.checksCount : checksCount // ignore: cast_nullable_to_non_nullable
as int,approvedPacksSum: null == approvedPacksSum ? _self.approvedPacksSum : approvedPacksSum // ignore: cast_nullable_to_non_nullable
as int,questsDone: null == questsDone ? _self.questsDone : questsDone // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MedrepQuestDrug {

 String get drug; int get need; int? get got;
/// Create a copy of MedrepQuestDrug
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedrepQuestDrugCopyWith<MedrepQuestDrug> get copyWith => _$MedrepQuestDrugCopyWithImpl<MedrepQuestDrug>(this as MedrepQuestDrug, _$identity);

  /// Serializes this MedrepQuestDrug to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedrepQuestDrug&&(identical(other.drug, drug) || other.drug == drug)&&(identical(other.need, need) || other.need == need)&&(identical(other.got, got) || other.got == got));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,drug,need,got);

@override
String toString() {
  return 'MedrepQuestDrug(drug: $drug, need: $need, got: $got)';
}


}

/// @nodoc
abstract mixin class $MedrepQuestDrugCopyWith<$Res>  {
  factory $MedrepQuestDrugCopyWith(MedrepQuestDrug value, $Res Function(MedrepQuestDrug) _then) = _$MedrepQuestDrugCopyWithImpl;
@useResult
$Res call({
 String drug, int need, int? got
});




}
/// @nodoc
class _$MedrepQuestDrugCopyWithImpl<$Res>
    implements $MedrepQuestDrugCopyWith<$Res> {
  _$MedrepQuestDrugCopyWithImpl(this._self, this._then);

  final MedrepQuestDrug _self;
  final $Res Function(MedrepQuestDrug) _then;

/// Create a copy of MedrepQuestDrug
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? drug = null,Object? need = null,Object? got = freezed,}) {
  return _then(_self.copyWith(
drug: null == drug ? _self.drug : drug // ignore: cast_nullable_to_non_nullable
as String,need: null == need ? _self.need : need // ignore: cast_nullable_to_non_nullable
as int,got: freezed == got ? _self.got : got // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MedrepQuestDrug].
extension MedrepQuestDrugPatterns on MedrepQuestDrug {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedrepQuestDrug value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedrepQuestDrug() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedrepQuestDrug value)  $default,){
final _that = this;
switch (_that) {
case _MedrepQuestDrug():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedrepQuestDrug value)?  $default,){
final _that = this;
switch (_that) {
case _MedrepQuestDrug() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String drug,  int need,  int? got)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedrepQuestDrug() when $default != null:
return $default(_that.drug,_that.need,_that.got);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String drug,  int need,  int? got)  $default,) {final _that = this;
switch (_that) {
case _MedrepQuestDrug():
return $default(_that.drug,_that.need,_that.got);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String drug,  int need,  int? got)?  $default,) {final _that = this;
switch (_that) {
case _MedrepQuestDrug() when $default != null:
return $default(_that.drug,_that.need,_that.got);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedrepQuestDrug implements MedrepQuestDrug {
  const _MedrepQuestDrug({required this.drug, required this.need, this.got});
  factory _MedrepQuestDrug.fromJson(Map<String, dynamic> json) => _$MedrepQuestDrugFromJson(json);

@override final  String drug;
@override final  int need;
@override final  int? got;

/// Create a copy of MedrepQuestDrug
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedrepQuestDrugCopyWith<_MedrepQuestDrug> get copyWith => __$MedrepQuestDrugCopyWithImpl<_MedrepQuestDrug>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedrepQuestDrugToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedrepQuestDrug&&(identical(other.drug, drug) || other.drug == drug)&&(identical(other.need, need) || other.need == need)&&(identical(other.got, got) || other.got == got));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,drug,need,got);

@override
String toString() {
  return 'MedrepQuestDrug(drug: $drug, need: $need, got: $got)';
}


}

/// @nodoc
abstract mixin class _$MedrepQuestDrugCopyWith<$Res> implements $MedrepQuestDrugCopyWith<$Res> {
  factory _$MedrepQuestDrugCopyWith(_MedrepQuestDrug value, $Res Function(_MedrepQuestDrug) _then) = __$MedrepQuestDrugCopyWithImpl;
@override @useResult
$Res call({
 String drug, int need, int? got
});




}
/// @nodoc
class __$MedrepQuestDrugCopyWithImpl<$Res>
    implements _$MedrepQuestDrugCopyWith<$Res> {
  __$MedrepQuestDrugCopyWithImpl(this._self, this._then);

  final _MedrepQuestDrug _self;
  final $Res Function(_MedrepQuestDrug) _then;

/// Create a copy of MedrepQuestDrug
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? drug = null,Object? need = null,Object? got = freezed,}) {
  return _then(_MedrepQuestDrug(
drug: null == drug ? _self.drug : drug // ignore: cast_nullable_to_non_nullable
as String,need: null == need ? _self.need : need // ignore: cast_nullable_to_non_nullable
as int,got: freezed == got ? _self.got : got // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$MedrepQuestParticipantDrug {

 String get drug; int get got; int get need;
/// Create a copy of MedrepQuestParticipantDrug
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedrepQuestParticipantDrugCopyWith<MedrepQuestParticipantDrug> get copyWith => _$MedrepQuestParticipantDrugCopyWithImpl<MedrepQuestParticipantDrug>(this as MedrepQuestParticipantDrug, _$identity);

  /// Serializes this MedrepQuestParticipantDrug to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedrepQuestParticipantDrug&&(identical(other.drug, drug) || other.drug == drug)&&(identical(other.got, got) || other.got == got)&&(identical(other.need, need) || other.need == need));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,drug,got,need);

@override
String toString() {
  return 'MedrepQuestParticipantDrug(drug: $drug, got: $got, need: $need)';
}


}

/// @nodoc
abstract mixin class $MedrepQuestParticipantDrugCopyWith<$Res>  {
  factory $MedrepQuestParticipantDrugCopyWith(MedrepQuestParticipantDrug value, $Res Function(MedrepQuestParticipantDrug) _then) = _$MedrepQuestParticipantDrugCopyWithImpl;
@useResult
$Res call({
 String drug, int got, int need
});




}
/// @nodoc
class _$MedrepQuestParticipantDrugCopyWithImpl<$Res>
    implements $MedrepQuestParticipantDrugCopyWith<$Res> {
  _$MedrepQuestParticipantDrugCopyWithImpl(this._self, this._then);

  final MedrepQuestParticipantDrug _self;
  final $Res Function(MedrepQuestParticipantDrug) _then;

/// Create a copy of MedrepQuestParticipantDrug
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? drug = null,Object? got = null,Object? need = null,}) {
  return _then(_self.copyWith(
drug: null == drug ? _self.drug : drug // ignore: cast_nullable_to_non_nullable
as String,got: null == got ? _self.got : got // ignore: cast_nullable_to_non_nullable
as int,need: null == need ? _self.need : need // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MedrepQuestParticipantDrug].
extension MedrepQuestParticipantDrugPatterns on MedrepQuestParticipantDrug {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedrepQuestParticipantDrug value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedrepQuestParticipantDrug() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedrepQuestParticipantDrug value)  $default,){
final _that = this;
switch (_that) {
case _MedrepQuestParticipantDrug():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedrepQuestParticipantDrug value)?  $default,){
final _that = this;
switch (_that) {
case _MedrepQuestParticipantDrug() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String drug,  int got,  int need)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedrepQuestParticipantDrug() when $default != null:
return $default(_that.drug,_that.got,_that.need);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String drug,  int got,  int need)  $default,) {final _that = this;
switch (_that) {
case _MedrepQuestParticipantDrug():
return $default(_that.drug,_that.got,_that.need);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String drug,  int got,  int need)?  $default,) {final _that = this;
switch (_that) {
case _MedrepQuestParticipantDrug() when $default != null:
return $default(_that.drug,_that.got,_that.need);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedrepQuestParticipantDrug implements MedrepQuestParticipantDrug {
  const _MedrepQuestParticipantDrug({required this.drug, required this.got, required this.need});
  factory _MedrepQuestParticipantDrug.fromJson(Map<String, dynamic> json) => _$MedrepQuestParticipantDrugFromJson(json);

@override final  String drug;
@override final  int got;
@override final  int need;

/// Create a copy of MedrepQuestParticipantDrug
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedrepQuestParticipantDrugCopyWith<_MedrepQuestParticipantDrug> get copyWith => __$MedrepQuestParticipantDrugCopyWithImpl<_MedrepQuestParticipantDrug>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedrepQuestParticipantDrugToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedrepQuestParticipantDrug&&(identical(other.drug, drug) || other.drug == drug)&&(identical(other.got, got) || other.got == got)&&(identical(other.need, need) || other.need == need));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,drug,got,need);

@override
String toString() {
  return 'MedrepQuestParticipantDrug(drug: $drug, got: $got, need: $need)';
}


}

/// @nodoc
abstract mixin class _$MedrepQuestParticipantDrugCopyWith<$Res> implements $MedrepQuestParticipantDrugCopyWith<$Res> {
  factory _$MedrepQuestParticipantDrugCopyWith(_MedrepQuestParticipantDrug value, $Res Function(_MedrepQuestParticipantDrug) _then) = __$MedrepQuestParticipantDrugCopyWithImpl;
@override @useResult
$Res call({
 String drug, int got, int need
});




}
/// @nodoc
class __$MedrepQuestParticipantDrugCopyWithImpl<$Res>
    implements _$MedrepQuestParticipantDrugCopyWith<$Res> {
  __$MedrepQuestParticipantDrugCopyWithImpl(this._self, this._then);

  final _MedrepQuestParticipantDrug _self;
  final $Res Function(_MedrepQuestParticipantDrug) _then;

/// Create a copy of MedrepQuestParticipantDrug
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? drug = null,Object? got = null,Object? need = null,}) {
  return _then(_MedrepQuestParticipantDrug(
drug: null == drug ? _self.drug : drug // ignore: cast_nullable_to_non_nullable
as String,got: null == got ? _self.got : got // ignore: cast_nullable_to_non_nullable
as int,need: null == need ? _self.need : need // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MedrepQuestParticipant {

 int get telegramId; String get name; String get phone; String get shop; int get done; int get collected; int get goal; double get progress; List<MedrepQuestParticipantDrug> get perDrug;
/// Create a copy of MedrepQuestParticipant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedrepQuestParticipantCopyWith<MedrepQuestParticipant> get copyWith => _$MedrepQuestParticipantCopyWithImpl<MedrepQuestParticipant>(this as MedrepQuestParticipant, _$identity);

  /// Serializes this MedrepQuestParticipant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedrepQuestParticipant&&(identical(other.telegramId, telegramId) || other.telegramId == telegramId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.shop, shop) || other.shop == shop)&&(identical(other.done, done) || other.done == done)&&(identical(other.collected, collected) || other.collected == collected)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.progress, progress) || other.progress == progress)&&const DeepCollectionEquality().equals(other.perDrug, perDrug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,telegramId,name,phone,shop,done,collected,goal,progress,const DeepCollectionEquality().hash(perDrug));

@override
String toString() {
  return 'MedrepQuestParticipant(telegramId: $telegramId, name: $name, phone: $phone, shop: $shop, done: $done, collected: $collected, goal: $goal, progress: $progress, perDrug: $perDrug)';
}


}

/// @nodoc
abstract mixin class $MedrepQuestParticipantCopyWith<$Res>  {
  factory $MedrepQuestParticipantCopyWith(MedrepQuestParticipant value, $Res Function(MedrepQuestParticipant) _then) = _$MedrepQuestParticipantCopyWithImpl;
@useResult
$Res call({
 int telegramId, String name, String phone, String shop, int done, int collected, int goal, double progress, List<MedrepQuestParticipantDrug> perDrug
});




}
/// @nodoc
class _$MedrepQuestParticipantCopyWithImpl<$Res>
    implements $MedrepQuestParticipantCopyWith<$Res> {
  _$MedrepQuestParticipantCopyWithImpl(this._self, this._then);

  final MedrepQuestParticipant _self;
  final $Res Function(MedrepQuestParticipant) _then;

/// Create a copy of MedrepQuestParticipant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? telegramId = null,Object? name = null,Object? phone = null,Object? shop = null,Object? done = null,Object? collected = null,Object? goal = null,Object? progress = null,Object? perDrug = null,}) {
  return _then(_self.copyWith(
telegramId: null == telegramId ? _self.telegramId : telegramId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,shop: null == shop ? _self.shop : shop // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as int,collected: null == collected ? _self.collected : collected // ignore: cast_nullable_to_non_nullable
as int,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,perDrug: null == perDrug ? _self.perDrug : perDrug // ignore: cast_nullable_to_non_nullable
as List<MedrepQuestParticipantDrug>,
  ));
}

}


/// Adds pattern-matching-related methods to [MedrepQuestParticipant].
extension MedrepQuestParticipantPatterns on MedrepQuestParticipant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedrepQuestParticipant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedrepQuestParticipant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedrepQuestParticipant value)  $default,){
final _that = this;
switch (_that) {
case _MedrepQuestParticipant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedrepQuestParticipant value)?  $default,){
final _that = this;
switch (_that) {
case _MedrepQuestParticipant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int telegramId,  String name,  String phone,  String shop,  int done,  int collected,  int goal,  double progress,  List<MedrepQuestParticipantDrug> perDrug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedrepQuestParticipant() when $default != null:
return $default(_that.telegramId,_that.name,_that.phone,_that.shop,_that.done,_that.collected,_that.goal,_that.progress,_that.perDrug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int telegramId,  String name,  String phone,  String shop,  int done,  int collected,  int goal,  double progress,  List<MedrepQuestParticipantDrug> perDrug)  $default,) {final _that = this;
switch (_that) {
case _MedrepQuestParticipant():
return $default(_that.telegramId,_that.name,_that.phone,_that.shop,_that.done,_that.collected,_that.goal,_that.progress,_that.perDrug);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int telegramId,  String name,  String phone,  String shop,  int done,  int collected,  int goal,  double progress,  List<MedrepQuestParticipantDrug> perDrug)?  $default,) {final _that = this;
switch (_that) {
case _MedrepQuestParticipant() when $default != null:
return $default(_that.telegramId,_that.name,_that.phone,_that.shop,_that.done,_that.collected,_that.goal,_that.progress,_that.perDrug);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedrepQuestParticipant implements MedrepQuestParticipant {
  const _MedrepQuestParticipant({required this.telegramId, required this.name, required this.phone, required this.shop, required this.done, required this.collected, required this.goal, required this.progress, required final  List<MedrepQuestParticipantDrug> perDrug}): _perDrug = perDrug;
  factory _MedrepQuestParticipant.fromJson(Map<String, dynamic> json) => _$MedrepQuestParticipantFromJson(json);

@override final  int telegramId;
@override final  String name;
@override final  String phone;
@override final  String shop;
@override final  int done;
@override final  int collected;
@override final  int goal;
@override final  double progress;
 final  List<MedrepQuestParticipantDrug> _perDrug;
@override List<MedrepQuestParticipantDrug> get perDrug {
  if (_perDrug is EqualUnmodifiableListView) return _perDrug;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_perDrug);
}


/// Create a copy of MedrepQuestParticipant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedrepQuestParticipantCopyWith<_MedrepQuestParticipant> get copyWith => __$MedrepQuestParticipantCopyWithImpl<_MedrepQuestParticipant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedrepQuestParticipantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedrepQuestParticipant&&(identical(other.telegramId, telegramId) || other.telegramId == telegramId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.shop, shop) || other.shop == shop)&&(identical(other.done, done) || other.done == done)&&(identical(other.collected, collected) || other.collected == collected)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.progress, progress) || other.progress == progress)&&const DeepCollectionEquality().equals(other._perDrug, _perDrug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,telegramId,name,phone,shop,done,collected,goal,progress,const DeepCollectionEquality().hash(_perDrug));

@override
String toString() {
  return 'MedrepQuestParticipant(telegramId: $telegramId, name: $name, phone: $phone, shop: $shop, done: $done, collected: $collected, goal: $goal, progress: $progress, perDrug: $perDrug)';
}


}

/// @nodoc
abstract mixin class _$MedrepQuestParticipantCopyWith<$Res> implements $MedrepQuestParticipantCopyWith<$Res> {
  factory _$MedrepQuestParticipantCopyWith(_MedrepQuestParticipant value, $Res Function(_MedrepQuestParticipant) _then) = __$MedrepQuestParticipantCopyWithImpl;
@override @useResult
$Res call({
 int telegramId, String name, String phone, String shop, int done, int collected, int goal, double progress, List<MedrepQuestParticipantDrug> perDrug
});




}
/// @nodoc
class __$MedrepQuestParticipantCopyWithImpl<$Res>
    implements _$MedrepQuestParticipantCopyWith<$Res> {
  __$MedrepQuestParticipantCopyWithImpl(this._self, this._then);

  final _MedrepQuestParticipant _self;
  final $Res Function(_MedrepQuestParticipant) _then;

/// Create a copy of MedrepQuestParticipant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? telegramId = null,Object? name = null,Object? phone = null,Object? shop = null,Object? done = null,Object? collected = null,Object? goal = null,Object? progress = null,Object? perDrug = null,}) {
  return _then(_MedrepQuestParticipant(
telegramId: null == telegramId ? _self.telegramId : telegramId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,shop: null == shop ? _self.shop : shop // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as int,collected: null == collected ? _self.collected : collected // ignore: cast_nullable_to_non_nullable
as int,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,perDrug: null == perDrug ? _self._perDrug : perDrug // ignore: cast_nullable_to_non_nullable
as List<MedrepQuestParticipantDrug>,
  ));
}


}


/// @nodoc
mixin _$MedrepQuest {

 int get id; String get name; int get goal; String? get startDate; String? get endDate; List<MedrepQuestDrug> get drugs; List<MedrepQuestParticipant> get participants; bool get empty;
/// Create a copy of MedrepQuest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedrepQuestCopyWith<MedrepQuest> get copyWith => _$MedrepQuestCopyWithImpl<MedrepQuest>(this as MedrepQuest, _$identity);

  /// Serializes this MedrepQuest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedrepQuest&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.drugs, drugs)&&const DeepCollectionEquality().equals(other.participants, participants)&&(identical(other.empty, empty) || other.empty == empty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,goal,startDate,endDate,const DeepCollectionEquality().hash(drugs),const DeepCollectionEquality().hash(participants),empty);

@override
String toString() {
  return 'MedrepQuest(id: $id, name: $name, goal: $goal, startDate: $startDate, endDate: $endDate, drugs: $drugs, participants: $participants, empty: $empty)';
}


}

/// @nodoc
abstract mixin class $MedrepQuestCopyWith<$Res>  {
  factory $MedrepQuestCopyWith(MedrepQuest value, $Res Function(MedrepQuest) _then) = _$MedrepQuestCopyWithImpl;
@useResult
$Res call({
 int id, String name, int goal, String? startDate, String? endDate, List<MedrepQuestDrug> drugs, List<MedrepQuestParticipant> participants, bool empty
});




}
/// @nodoc
class _$MedrepQuestCopyWithImpl<$Res>
    implements $MedrepQuestCopyWith<$Res> {
  _$MedrepQuestCopyWithImpl(this._self, this._then);

  final MedrepQuest _self;
  final $Res Function(MedrepQuest) _then;

/// Create a copy of MedrepQuest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? goal = null,Object? startDate = freezed,Object? endDate = freezed,Object? drugs = null,Object? participants = null,Object? empty = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,drugs: null == drugs ? _self.drugs : drugs // ignore: cast_nullable_to_non_nullable
as List<MedrepQuestDrug>,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<MedrepQuestParticipant>,empty: null == empty ? _self.empty : empty // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MedrepQuest].
extension MedrepQuestPatterns on MedrepQuest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedrepQuest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedrepQuest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedrepQuest value)  $default,){
final _that = this;
switch (_that) {
case _MedrepQuest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedrepQuest value)?  $default,){
final _that = this;
switch (_that) {
case _MedrepQuest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int goal,  String? startDate,  String? endDate,  List<MedrepQuestDrug> drugs,  List<MedrepQuestParticipant> participants,  bool empty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedrepQuest() when $default != null:
return $default(_that.id,_that.name,_that.goal,_that.startDate,_that.endDate,_that.drugs,_that.participants,_that.empty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int goal,  String? startDate,  String? endDate,  List<MedrepQuestDrug> drugs,  List<MedrepQuestParticipant> participants,  bool empty)  $default,) {final _that = this;
switch (_that) {
case _MedrepQuest():
return $default(_that.id,_that.name,_that.goal,_that.startDate,_that.endDate,_that.drugs,_that.participants,_that.empty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int goal,  String? startDate,  String? endDate,  List<MedrepQuestDrug> drugs,  List<MedrepQuestParticipant> participants,  bool empty)?  $default,) {final _that = this;
switch (_that) {
case _MedrepQuest() when $default != null:
return $default(_that.id,_that.name,_that.goal,_that.startDate,_that.endDate,_that.drugs,_that.participants,_that.empty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedrepQuest implements MedrepQuest {
  const _MedrepQuest({required this.id, required this.name, required this.goal, this.startDate, this.endDate, required final  List<MedrepQuestDrug> drugs, required final  List<MedrepQuestParticipant> participants, required this.empty}): _drugs = drugs,_participants = participants;
  factory _MedrepQuest.fromJson(Map<String, dynamic> json) => _$MedrepQuestFromJson(json);

@override final  int id;
@override final  String name;
@override final  int goal;
@override final  String? startDate;
@override final  String? endDate;
 final  List<MedrepQuestDrug> _drugs;
@override List<MedrepQuestDrug> get drugs {
  if (_drugs is EqualUnmodifiableListView) return _drugs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_drugs);
}

 final  List<MedrepQuestParticipant> _participants;
@override List<MedrepQuestParticipant> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

@override final  bool empty;

/// Create a copy of MedrepQuest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedrepQuestCopyWith<_MedrepQuest> get copyWith => __$MedrepQuestCopyWithImpl<_MedrepQuest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedrepQuestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedrepQuest&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._drugs, _drugs)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.empty, empty) || other.empty == empty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,goal,startDate,endDate,const DeepCollectionEquality().hash(_drugs),const DeepCollectionEquality().hash(_participants),empty);

@override
String toString() {
  return 'MedrepQuest(id: $id, name: $name, goal: $goal, startDate: $startDate, endDate: $endDate, drugs: $drugs, participants: $participants, empty: $empty)';
}


}

/// @nodoc
abstract mixin class _$MedrepQuestCopyWith<$Res> implements $MedrepQuestCopyWith<$Res> {
  factory _$MedrepQuestCopyWith(_MedrepQuest value, $Res Function(_MedrepQuest) _then) = __$MedrepQuestCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int goal, String? startDate, String? endDate, List<MedrepQuestDrug> drugs, List<MedrepQuestParticipant> participants, bool empty
});




}
/// @nodoc
class __$MedrepQuestCopyWithImpl<$Res>
    implements _$MedrepQuestCopyWith<$Res> {
  __$MedrepQuestCopyWithImpl(this._self, this._then);

  final _MedrepQuest _self;
  final $Res Function(_MedrepQuest) _then;

/// Create a copy of MedrepQuest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? goal = null,Object? startDate = freezed,Object? endDate = freezed,Object? drugs = null,Object? participants = null,Object? empty = null,}) {
  return _then(_MedrepQuest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,drugs: null == drugs ? _self._drugs : drugs // ignore: cast_nullable_to_non_nullable
as List<MedrepQuestDrug>,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<MedrepQuestParticipant>,empty: null == empty ? _self.empty : empty // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PortfolioPharmacist {

 int get telegramId; String get name; String get shop; String get city; int get checks; int get quests;
/// Create a copy of PortfolioPharmacist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioPharmacistCopyWith<PortfolioPharmacist> get copyWith => _$PortfolioPharmacistCopyWithImpl<PortfolioPharmacist>(this as PortfolioPharmacist, _$identity);

  /// Serializes this PortfolioPharmacist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioPharmacist&&(identical(other.telegramId, telegramId) || other.telegramId == telegramId)&&(identical(other.name, name) || other.name == name)&&(identical(other.shop, shop) || other.shop == shop)&&(identical(other.city, city) || other.city == city)&&(identical(other.checks, checks) || other.checks == checks)&&(identical(other.quests, quests) || other.quests == quests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,telegramId,name,shop,city,checks,quests);

@override
String toString() {
  return 'PortfolioPharmacist(telegramId: $telegramId, name: $name, shop: $shop, city: $city, checks: $checks, quests: $quests)';
}


}

/// @nodoc
abstract mixin class $PortfolioPharmacistCopyWith<$Res>  {
  factory $PortfolioPharmacistCopyWith(PortfolioPharmacist value, $Res Function(PortfolioPharmacist) _then) = _$PortfolioPharmacistCopyWithImpl;
@useResult
$Res call({
 int telegramId, String name, String shop, String city, int checks, int quests
});




}
/// @nodoc
class _$PortfolioPharmacistCopyWithImpl<$Res>
    implements $PortfolioPharmacistCopyWith<$Res> {
  _$PortfolioPharmacistCopyWithImpl(this._self, this._then);

  final PortfolioPharmacist _self;
  final $Res Function(PortfolioPharmacist) _then;

/// Create a copy of PortfolioPharmacist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? telegramId = null,Object? name = null,Object? shop = null,Object? city = null,Object? checks = null,Object? quests = null,}) {
  return _then(_self.copyWith(
telegramId: null == telegramId ? _self.telegramId : telegramId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shop: null == shop ? _self.shop : shop // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,checks: null == checks ? _self.checks : checks // ignore: cast_nullable_to_non_nullable
as int,quests: null == quests ? _self.quests : quests // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PortfolioPharmacist].
extension PortfolioPharmacistPatterns on PortfolioPharmacist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioPharmacist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioPharmacist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioPharmacist value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioPharmacist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioPharmacist value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioPharmacist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int telegramId,  String name,  String shop,  String city,  int checks,  int quests)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioPharmacist() when $default != null:
return $default(_that.telegramId,_that.name,_that.shop,_that.city,_that.checks,_that.quests);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int telegramId,  String name,  String shop,  String city,  int checks,  int quests)  $default,) {final _that = this;
switch (_that) {
case _PortfolioPharmacist():
return $default(_that.telegramId,_that.name,_that.shop,_that.city,_that.checks,_that.quests);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int telegramId,  String name,  String shop,  String city,  int checks,  int quests)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioPharmacist() when $default != null:
return $default(_that.telegramId,_that.name,_that.shop,_that.city,_that.checks,_that.quests);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PortfolioPharmacist implements PortfolioPharmacist {
  const _PortfolioPharmacist({required this.telegramId, required this.name, required this.shop, required this.city, required this.checks, required this.quests});
  factory _PortfolioPharmacist.fromJson(Map<String, dynamic> json) => _$PortfolioPharmacistFromJson(json);

@override final  int telegramId;
@override final  String name;
@override final  String shop;
@override final  String city;
@override final  int checks;
@override final  int quests;

/// Create a copy of PortfolioPharmacist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioPharmacistCopyWith<_PortfolioPharmacist> get copyWith => __$PortfolioPharmacistCopyWithImpl<_PortfolioPharmacist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PortfolioPharmacistToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioPharmacist&&(identical(other.telegramId, telegramId) || other.telegramId == telegramId)&&(identical(other.name, name) || other.name == name)&&(identical(other.shop, shop) || other.shop == shop)&&(identical(other.city, city) || other.city == city)&&(identical(other.checks, checks) || other.checks == checks)&&(identical(other.quests, quests) || other.quests == quests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,telegramId,name,shop,city,checks,quests);

@override
String toString() {
  return 'PortfolioPharmacist(telegramId: $telegramId, name: $name, shop: $shop, city: $city, checks: $checks, quests: $quests)';
}


}

/// @nodoc
abstract mixin class _$PortfolioPharmacistCopyWith<$Res> implements $PortfolioPharmacistCopyWith<$Res> {
  factory _$PortfolioPharmacistCopyWith(_PortfolioPharmacist value, $Res Function(_PortfolioPharmacist) _then) = __$PortfolioPharmacistCopyWithImpl;
@override @useResult
$Res call({
 int telegramId, String name, String shop, String city, int checks, int quests
});




}
/// @nodoc
class __$PortfolioPharmacistCopyWithImpl<$Res>
    implements _$PortfolioPharmacistCopyWith<$Res> {
  __$PortfolioPharmacistCopyWithImpl(this._self, this._then);

  final _PortfolioPharmacist _self;
  final $Res Function(_PortfolioPharmacist) _then;

/// Create a copy of PortfolioPharmacist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? telegramId = null,Object? name = null,Object? shop = null,Object? city = null,Object? checks = null,Object? quests = null,}) {
  return _then(_PortfolioPharmacist(
telegramId: null == telegramId ? _self.telegramId : telegramId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shop: null == shop ? _self.shop : shop // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,checks: null == checks ? _self.checks : checks // ignore: cast_nullable_to_non_nullable
as int,quests: null == quests ? _self.quests : quests // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$LeaderRow {

 int get rank; String get name; int get value; bool? get isMe;
/// Create a copy of LeaderRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaderRowCopyWith<LeaderRow> get copyWith => _$LeaderRowCopyWithImpl<LeaderRow>(this as LeaderRow, _$identity);

  /// Serializes this LeaderRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaderRow&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value)&&(identical(other.isMe, isMe) || other.isMe == isMe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rank,name,value,isMe);

@override
String toString() {
  return 'LeaderRow(rank: $rank, name: $name, value: $value, isMe: $isMe)';
}


}

/// @nodoc
abstract mixin class $LeaderRowCopyWith<$Res>  {
  factory $LeaderRowCopyWith(LeaderRow value, $Res Function(LeaderRow) _then) = _$LeaderRowCopyWithImpl;
@useResult
$Res call({
 int rank, String name, int value, bool? isMe
});




}
/// @nodoc
class _$LeaderRowCopyWithImpl<$Res>
    implements $LeaderRowCopyWith<$Res> {
  _$LeaderRowCopyWithImpl(this._self, this._then);

  final LeaderRow _self;
  final $Res Function(LeaderRow) _then;

/// Create a copy of LeaderRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rank = null,Object? name = null,Object? value = null,Object? isMe = freezed,}) {
  return _then(_self.copyWith(
rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,isMe: freezed == isMe ? _self.isMe : isMe // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaderRow].
extension LeaderRowPatterns on LeaderRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaderRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaderRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaderRow value)  $default,){
final _that = this;
switch (_that) {
case _LeaderRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaderRow value)?  $default,){
final _that = this;
switch (_that) {
case _LeaderRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int rank,  String name,  int value,  bool? isMe)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaderRow() when $default != null:
return $default(_that.rank,_that.name,_that.value,_that.isMe);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int rank,  String name,  int value,  bool? isMe)  $default,) {final _that = this;
switch (_that) {
case _LeaderRow():
return $default(_that.rank,_that.name,_that.value,_that.isMe);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int rank,  String name,  int value,  bool? isMe)?  $default,) {final _that = this;
switch (_that) {
case _LeaderRow() when $default != null:
return $default(_that.rank,_that.name,_that.value,_that.isMe);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaderRow implements LeaderRow {
  const _LeaderRow({required this.rank, required this.name, required this.value, this.isMe});
  factory _LeaderRow.fromJson(Map<String, dynamic> json) => _$LeaderRowFromJson(json);

@override final  int rank;
@override final  String name;
@override final  int value;
@override final  bool? isMe;

/// Create a copy of LeaderRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaderRowCopyWith<_LeaderRow> get copyWith => __$LeaderRowCopyWithImpl<_LeaderRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaderRowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaderRow&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value)&&(identical(other.isMe, isMe) || other.isMe == isMe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rank,name,value,isMe);

@override
String toString() {
  return 'LeaderRow(rank: $rank, name: $name, value: $value, isMe: $isMe)';
}


}

/// @nodoc
abstract mixin class _$LeaderRowCopyWith<$Res> implements $LeaderRowCopyWith<$Res> {
  factory _$LeaderRowCopyWith(_LeaderRow value, $Res Function(_LeaderRow) _then) = __$LeaderRowCopyWithImpl;
@override @useResult
$Res call({
 int rank, String name, int value, bool? isMe
});




}
/// @nodoc
class __$LeaderRowCopyWithImpl<$Res>
    implements _$LeaderRowCopyWith<$Res> {
  __$LeaderRowCopyWithImpl(this._self, this._then);

  final _LeaderRow _self;
  final $Res Function(_LeaderRow) _then;

/// Create a copy of LeaderRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rank = null,Object? name = null,Object? value = null,Object? isMe = freezed,}) {
  return _then(_LeaderRow(
rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,isMe: freezed == isMe ? _self.isMe : isMe // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$Leaderboard {

 AttributionMode get mode; String get metric;// 'checks' | 'pharm' | 'quests'
 List<LeaderRow> get items; int get myRank; String? get company;
/// Create a copy of Leaderboard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaderboardCopyWith<Leaderboard> get copyWith => _$LeaderboardCopyWithImpl<Leaderboard>(this as Leaderboard, _$identity);

  /// Serializes this Leaderboard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Leaderboard&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.metric, metric) || other.metric == metric)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.myRank, myRank) || other.myRank == myRank)&&(identical(other.company, company) || other.company == company));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode,metric,const DeepCollectionEquality().hash(items),myRank,company);

@override
String toString() {
  return 'Leaderboard(mode: $mode, metric: $metric, items: $items, myRank: $myRank, company: $company)';
}


}

/// @nodoc
abstract mixin class $LeaderboardCopyWith<$Res>  {
  factory $LeaderboardCopyWith(Leaderboard value, $Res Function(Leaderboard) _then) = _$LeaderboardCopyWithImpl;
@useResult
$Res call({
 AttributionMode mode, String metric, List<LeaderRow> items, int myRank, String? company
});




}
/// @nodoc
class _$LeaderboardCopyWithImpl<$Res>
    implements $LeaderboardCopyWith<$Res> {
  _$LeaderboardCopyWithImpl(this._self, this._then);

  final Leaderboard _self;
  final $Res Function(Leaderboard) _then;

/// Create a copy of Leaderboard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? metric = null,Object? items = null,Object? myRank = null,Object? company = freezed,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AttributionMode,metric: null == metric ? _self.metric : metric // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<LeaderRow>,myRank: null == myRank ? _self.myRank : myRank // ignore: cast_nullable_to_non_nullable
as int,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Leaderboard].
extension LeaderboardPatterns on Leaderboard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Leaderboard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Leaderboard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Leaderboard value)  $default,){
final _that = this;
switch (_that) {
case _Leaderboard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Leaderboard value)?  $default,){
final _that = this;
switch (_that) {
case _Leaderboard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AttributionMode mode,  String metric,  List<LeaderRow> items,  int myRank,  String? company)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Leaderboard() when $default != null:
return $default(_that.mode,_that.metric,_that.items,_that.myRank,_that.company);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AttributionMode mode,  String metric,  List<LeaderRow> items,  int myRank,  String? company)  $default,) {final _that = this;
switch (_that) {
case _Leaderboard():
return $default(_that.mode,_that.metric,_that.items,_that.myRank,_that.company);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AttributionMode mode,  String metric,  List<LeaderRow> items,  int myRank,  String? company)?  $default,) {final _that = this;
switch (_that) {
case _Leaderboard() when $default != null:
return $default(_that.mode,_that.metric,_that.items,_that.myRank,_that.company);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Leaderboard implements Leaderboard {
  const _Leaderboard({required this.mode, required this.metric, required final  List<LeaderRow> items, required this.myRank, this.company}): _items = items;
  factory _Leaderboard.fromJson(Map<String, dynamic> json) => _$LeaderboardFromJson(json);

@override final  AttributionMode mode;
@override final  String metric;
// 'checks' | 'pharm' | 'quests'
 final  List<LeaderRow> _items;
// 'checks' | 'pharm' | 'quests'
@override List<LeaderRow> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int myRank;
@override final  String? company;

/// Create a copy of Leaderboard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaderboardCopyWith<_Leaderboard> get copyWith => __$LeaderboardCopyWithImpl<_Leaderboard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaderboardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Leaderboard&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.metric, metric) || other.metric == metric)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.myRank, myRank) || other.myRank == myRank)&&(identical(other.company, company) || other.company == company));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode,metric,const DeepCollectionEquality().hash(_items),myRank,company);

@override
String toString() {
  return 'Leaderboard(mode: $mode, metric: $metric, items: $items, myRank: $myRank, company: $company)';
}


}

/// @nodoc
abstract mixin class _$LeaderboardCopyWith<$Res> implements $LeaderboardCopyWith<$Res> {
  factory _$LeaderboardCopyWith(_Leaderboard value, $Res Function(_Leaderboard) _then) = __$LeaderboardCopyWithImpl;
@override @useResult
$Res call({
 AttributionMode mode, String metric, List<LeaderRow> items, int myRank, String? company
});




}
/// @nodoc
class __$LeaderboardCopyWithImpl<$Res>
    implements _$LeaderboardCopyWith<$Res> {
  __$LeaderboardCopyWithImpl(this._self, this._then);

  final _Leaderboard _self;
  final $Res Function(_Leaderboard) _then;

/// Create a copy of Leaderboard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? metric = null,Object? items = null,Object? myRank = null,Object? company = freezed,}) {
  return _then(_Leaderboard(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AttributionMode,metric: null == metric ? _self.metric : metric // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<LeaderRow>,myRank: null == myRank ? _self.myRank : myRank // ignore: cast_nullable_to_non_nullable
as int,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Company {

 int get id; String get name; String get labelCode;
/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyCopyWith<Company> get copyWith => _$CompanyCopyWithImpl<Company>(this as Company, _$identity);

  /// Serializes this Company to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Company&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.labelCode, labelCode) || other.labelCode == labelCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,labelCode);

@override
String toString() {
  return 'Company(id: $id, name: $name, labelCode: $labelCode)';
}


}

/// @nodoc
abstract mixin class $CompanyCopyWith<$Res>  {
  factory $CompanyCopyWith(Company value, $Res Function(Company) _then) = _$CompanyCopyWithImpl;
@useResult
$Res call({
 int id, String name, String labelCode
});




}
/// @nodoc
class _$CompanyCopyWithImpl<$Res>
    implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._self, this._then);

  final Company _self;
  final $Res Function(Company) _then;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? labelCode = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,labelCode: null == labelCode ? _self.labelCode : labelCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Company].
extension CompanyPatterns on Company {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Company value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Company() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Company value)  $default,){
final _that = this;
switch (_that) {
case _Company():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Company value)?  $default,){
final _that = this;
switch (_that) {
case _Company() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String labelCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Company() when $default != null:
return $default(_that.id,_that.name,_that.labelCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String labelCode)  $default,) {final _that = this;
switch (_that) {
case _Company():
return $default(_that.id,_that.name,_that.labelCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String labelCode)?  $default,) {final _that = this;
switch (_that) {
case _Company() when $default != null:
return $default(_that.id,_that.name,_that.labelCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Company implements Company {
  const _Company({required this.id, required this.name, required this.labelCode});
  factory _Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

@override final  int id;
@override final  String name;
@override final  String labelCode;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyCopyWith<_Company> get copyWith => __$CompanyCopyWithImpl<_Company>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Company&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.labelCode, labelCode) || other.labelCode == labelCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,labelCode);

@override
String toString() {
  return 'Company(id: $id, name: $name, labelCode: $labelCode)';
}


}

/// @nodoc
abstract mixin class _$CompanyCopyWith<$Res> implements $CompanyCopyWith<$Res> {
  factory _$CompanyCopyWith(_Company value, $Res Function(_Company) _then) = __$CompanyCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String labelCode
});




}
/// @nodoc
class __$CompanyCopyWithImpl<$Res>
    implements _$CompanyCopyWith<$Res> {
  __$CompanyCopyWithImpl(this._self, this._then);

  final _Company _self;
  final $Res Function(_Company) _then;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? labelCode = null,}) {
  return _then(_Company(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,labelCode: null == labelCode ? _self.labelCode : labelCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PendingReferral {

 int get id; String get name; String get phone; String? get shop; String get requestedAt;/// Откуда заявка: 'app' — из приложения (по кодовому слову), 'bot' — из бота.
 String get kind;/// 'code' — ввёл кодовое слово, 'link' — перешёл по ссылке.
 String? get source;
/// Create a copy of PendingReferral
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingReferralCopyWith<PendingReferral> get copyWith => _$PendingReferralCopyWithImpl<PendingReferral>(this as PendingReferral, _$identity);

  /// Serializes this PendingReferral to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingReferral&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.shop, shop) || other.shop == shop)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,shop,requestedAt,kind,source);

@override
String toString() {
  return 'PendingReferral(id: $id, name: $name, phone: $phone, shop: $shop, requestedAt: $requestedAt, kind: $kind, source: $source)';
}


}

/// @nodoc
abstract mixin class $PendingReferralCopyWith<$Res>  {
  factory $PendingReferralCopyWith(PendingReferral value, $Res Function(PendingReferral) _then) = _$PendingReferralCopyWithImpl;
@useResult
$Res call({
 int id, String name, String phone, String? shop, String requestedAt, String kind, String? source
});




}
/// @nodoc
class _$PendingReferralCopyWithImpl<$Res>
    implements $PendingReferralCopyWith<$Res> {
  _$PendingReferralCopyWithImpl(this._self, this._then);

  final PendingReferral _self;
  final $Res Function(PendingReferral) _then;

/// Create a copy of PendingReferral
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? shop = freezed,Object? requestedAt = null,Object? kind = null,Object? source = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,shop: freezed == shop ? _self.shop : shop // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PendingReferral].
extension PendingReferralPatterns on PendingReferral {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PendingReferral value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PendingReferral() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PendingReferral value)  $default,){
final _that = this;
switch (_that) {
case _PendingReferral():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PendingReferral value)?  $default,){
final _that = this;
switch (_that) {
case _PendingReferral() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String phone,  String? shop,  String requestedAt,  String kind,  String? source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PendingReferral() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.shop,_that.requestedAt,_that.kind,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String phone,  String? shop,  String requestedAt,  String kind,  String? source)  $default,) {final _that = this;
switch (_that) {
case _PendingReferral():
return $default(_that.id,_that.name,_that.phone,_that.shop,_that.requestedAt,_that.kind,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String phone,  String? shop,  String requestedAt,  String kind,  String? source)?  $default,) {final _that = this;
switch (_that) {
case _PendingReferral() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.shop,_that.requestedAt,_that.kind,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PendingReferral implements PendingReferral {
  const _PendingReferral({required this.id, required this.name, required this.phone, this.shop, required this.requestedAt, this.kind = 'bot', this.source});
  factory _PendingReferral.fromJson(Map<String, dynamic> json) => _$PendingReferralFromJson(json);

@override final  int id;
@override final  String name;
@override final  String phone;
@override final  String? shop;
@override final  String requestedAt;
/// Откуда заявка: 'app' — из приложения (по кодовому слову), 'bot' — из бота.
@override@JsonKey() final  String kind;
/// 'code' — ввёл кодовое слово, 'link' — перешёл по ссылке.
@override final  String? source;

/// Create a copy of PendingReferral
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PendingReferralCopyWith<_PendingReferral> get copyWith => __$PendingReferralCopyWithImpl<_PendingReferral>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PendingReferralToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PendingReferral&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.shop, shop) || other.shop == shop)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,shop,requestedAt,kind,source);

@override
String toString() {
  return 'PendingReferral(id: $id, name: $name, phone: $phone, shop: $shop, requestedAt: $requestedAt, kind: $kind, source: $source)';
}


}

/// @nodoc
abstract mixin class _$PendingReferralCopyWith<$Res> implements $PendingReferralCopyWith<$Res> {
  factory _$PendingReferralCopyWith(_PendingReferral value, $Res Function(_PendingReferral) _then) = __$PendingReferralCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String phone, String? shop, String requestedAt, String kind, String? source
});




}
/// @nodoc
class __$PendingReferralCopyWithImpl<$Res>
    implements _$PendingReferralCopyWith<$Res> {
  __$PendingReferralCopyWithImpl(this._self, this._then);

  final _PendingReferral _self;
  final $Res Function(_PendingReferral) _then;

/// Create a copy of PendingReferral
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? shop = freezed,Object? requestedAt = null,Object? kind = null,Object? source = freezed,}) {
  return _then(_PendingReferral(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,shop: freezed == shop ? _self.shop : shop // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RecentCheck {

 int get id; String get createdAt;@JsonKey(unknownEnumValue: CheckStatus.pending) CheckStatus get status; int get packs;
/// Create a copy of RecentCheck
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecentCheckCopyWith<RecentCheck> get copyWith => _$RecentCheckCopyWithImpl<RecentCheck>(this as RecentCheck, _$identity);

  /// Serializes this RecentCheck to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecentCheck&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.packs, packs) || other.packs == packs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,status,packs);

@override
String toString() {
  return 'RecentCheck(id: $id, createdAt: $createdAt, status: $status, packs: $packs)';
}


}

/// @nodoc
abstract mixin class $RecentCheckCopyWith<$Res>  {
  factory $RecentCheckCopyWith(RecentCheck value, $Res Function(RecentCheck) _then) = _$RecentCheckCopyWithImpl;
@useResult
$Res call({
 int id, String createdAt,@JsonKey(unknownEnumValue: CheckStatus.pending) CheckStatus status, int packs
});




}
/// @nodoc
class _$RecentCheckCopyWithImpl<$Res>
    implements $RecentCheckCopyWith<$Res> {
  _$RecentCheckCopyWithImpl(this._self, this._then);

  final RecentCheck _self;
  final $Res Function(RecentCheck) _then;

/// Create a copy of RecentCheck
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? status = null,Object? packs = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CheckStatus,packs: null == packs ? _self.packs : packs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RecentCheck].
extension RecentCheckPatterns on RecentCheck {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecentCheck value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecentCheck() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecentCheck value)  $default,){
final _that = this;
switch (_that) {
case _RecentCheck():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecentCheck value)?  $default,){
final _that = this;
switch (_that) {
case _RecentCheck() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String createdAt, @JsonKey(unknownEnumValue: CheckStatus.pending)  CheckStatus status,  int packs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecentCheck() when $default != null:
return $default(_that.id,_that.createdAt,_that.status,_that.packs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String createdAt, @JsonKey(unknownEnumValue: CheckStatus.pending)  CheckStatus status,  int packs)  $default,) {final _that = this;
switch (_that) {
case _RecentCheck():
return $default(_that.id,_that.createdAt,_that.status,_that.packs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String createdAt, @JsonKey(unknownEnumValue: CheckStatus.pending)  CheckStatus status,  int packs)?  $default,) {final _that = this;
switch (_that) {
case _RecentCheck() when $default != null:
return $default(_that.id,_that.createdAt,_that.status,_that.packs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecentCheck implements RecentCheck {
  const _RecentCheck({required this.id, required this.createdAt, @JsonKey(unknownEnumValue: CheckStatus.pending) required this.status, required this.packs});
  factory _RecentCheck.fromJson(Map<String, dynamic> json) => _$RecentCheckFromJson(json);

@override final  int id;
@override final  String createdAt;
@override@JsonKey(unknownEnumValue: CheckStatus.pending) final  CheckStatus status;
@override final  int packs;

/// Create a copy of RecentCheck
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecentCheckCopyWith<_RecentCheck> get copyWith => __$RecentCheckCopyWithImpl<_RecentCheck>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecentCheckToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecentCheck&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.packs, packs) || other.packs == packs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,status,packs);

@override
String toString() {
  return 'RecentCheck(id: $id, createdAt: $createdAt, status: $status, packs: $packs)';
}


}

/// @nodoc
abstract mixin class _$RecentCheckCopyWith<$Res> implements $RecentCheckCopyWith<$Res> {
  factory _$RecentCheckCopyWith(_RecentCheck value, $Res Function(_RecentCheck) _then) = __$RecentCheckCopyWithImpl;
@override @useResult
$Res call({
 int id, String createdAt,@JsonKey(unknownEnumValue: CheckStatus.pending) CheckStatus status, int packs
});




}
/// @nodoc
class __$RecentCheckCopyWithImpl<$Res>
    implements _$RecentCheckCopyWith<$Res> {
  __$RecentCheckCopyWithImpl(this._self, this._then);

  final _RecentCheck _self;
  final $Res Function(_RecentCheck) _then;

/// Create a copy of RecentCheck
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? status = null,Object? packs = null,}) {
  return _then(_RecentCheck(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CheckStatus,packs: null == packs ? _self.packs : packs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PharmacistDetail {

 int get telegramId; String get name; String get shop; String get city; int get checks; int get quests; int get approvedPacks; String get lastActivity; List<RecentCheck> get recentChecks;
/// Create a copy of PharmacistDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PharmacistDetailCopyWith<PharmacistDetail> get copyWith => _$PharmacistDetailCopyWithImpl<PharmacistDetail>(this as PharmacistDetail, _$identity);

  /// Serializes this PharmacistDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PharmacistDetail&&(identical(other.telegramId, telegramId) || other.telegramId == telegramId)&&(identical(other.name, name) || other.name == name)&&(identical(other.shop, shop) || other.shop == shop)&&(identical(other.city, city) || other.city == city)&&(identical(other.checks, checks) || other.checks == checks)&&(identical(other.quests, quests) || other.quests == quests)&&(identical(other.approvedPacks, approvedPacks) || other.approvedPacks == approvedPacks)&&(identical(other.lastActivity, lastActivity) || other.lastActivity == lastActivity)&&const DeepCollectionEquality().equals(other.recentChecks, recentChecks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,telegramId,name,shop,city,checks,quests,approvedPacks,lastActivity,const DeepCollectionEquality().hash(recentChecks));

@override
String toString() {
  return 'PharmacistDetail(telegramId: $telegramId, name: $name, shop: $shop, city: $city, checks: $checks, quests: $quests, approvedPacks: $approvedPacks, lastActivity: $lastActivity, recentChecks: $recentChecks)';
}


}

/// @nodoc
abstract mixin class $PharmacistDetailCopyWith<$Res>  {
  factory $PharmacistDetailCopyWith(PharmacistDetail value, $Res Function(PharmacistDetail) _then) = _$PharmacistDetailCopyWithImpl;
@useResult
$Res call({
 int telegramId, String name, String shop, String city, int checks, int quests, int approvedPacks, String lastActivity, List<RecentCheck> recentChecks
});




}
/// @nodoc
class _$PharmacistDetailCopyWithImpl<$Res>
    implements $PharmacistDetailCopyWith<$Res> {
  _$PharmacistDetailCopyWithImpl(this._self, this._then);

  final PharmacistDetail _self;
  final $Res Function(PharmacistDetail) _then;

/// Create a copy of PharmacistDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? telegramId = null,Object? name = null,Object? shop = null,Object? city = null,Object? checks = null,Object? quests = null,Object? approvedPacks = null,Object? lastActivity = null,Object? recentChecks = null,}) {
  return _then(_self.copyWith(
telegramId: null == telegramId ? _self.telegramId : telegramId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shop: null == shop ? _self.shop : shop // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,checks: null == checks ? _self.checks : checks // ignore: cast_nullable_to_non_nullable
as int,quests: null == quests ? _self.quests : quests // ignore: cast_nullable_to_non_nullable
as int,approvedPacks: null == approvedPacks ? _self.approvedPacks : approvedPacks // ignore: cast_nullable_to_non_nullable
as int,lastActivity: null == lastActivity ? _self.lastActivity : lastActivity // ignore: cast_nullable_to_non_nullable
as String,recentChecks: null == recentChecks ? _self.recentChecks : recentChecks // ignore: cast_nullable_to_non_nullable
as List<RecentCheck>,
  ));
}

}


/// Adds pattern-matching-related methods to [PharmacistDetail].
extension PharmacistDetailPatterns on PharmacistDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PharmacistDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PharmacistDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PharmacistDetail value)  $default,){
final _that = this;
switch (_that) {
case _PharmacistDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PharmacistDetail value)?  $default,){
final _that = this;
switch (_that) {
case _PharmacistDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int telegramId,  String name,  String shop,  String city,  int checks,  int quests,  int approvedPacks,  String lastActivity,  List<RecentCheck> recentChecks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PharmacistDetail() when $default != null:
return $default(_that.telegramId,_that.name,_that.shop,_that.city,_that.checks,_that.quests,_that.approvedPacks,_that.lastActivity,_that.recentChecks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int telegramId,  String name,  String shop,  String city,  int checks,  int quests,  int approvedPacks,  String lastActivity,  List<RecentCheck> recentChecks)  $default,) {final _that = this;
switch (_that) {
case _PharmacistDetail():
return $default(_that.telegramId,_that.name,_that.shop,_that.city,_that.checks,_that.quests,_that.approvedPacks,_that.lastActivity,_that.recentChecks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int telegramId,  String name,  String shop,  String city,  int checks,  int quests,  int approvedPacks,  String lastActivity,  List<RecentCheck> recentChecks)?  $default,) {final _that = this;
switch (_that) {
case _PharmacistDetail() when $default != null:
return $default(_that.telegramId,_that.name,_that.shop,_that.city,_that.checks,_that.quests,_that.approvedPacks,_that.lastActivity,_that.recentChecks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PharmacistDetail implements PharmacistDetail {
  const _PharmacistDetail({required this.telegramId, required this.name, required this.shop, required this.city, required this.checks, required this.quests, required this.approvedPacks, required this.lastActivity, required final  List<RecentCheck> recentChecks}): _recentChecks = recentChecks;
  factory _PharmacistDetail.fromJson(Map<String, dynamic> json) => _$PharmacistDetailFromJson(json);

@override final  int telegramId;
@override final  String name;
@override final  String shop;
@override final  String city;
@override final  int checks;
@override final  int quests;
@override final  int approvedPacks;
@override final  String lastActivity;
 final  List<RecentCheck> _recentChecks;
@override List<RecentCheck> get recentChecks {
  if (_recentChecks is EqualUnmodifiableListView) return _recentChecks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentChecks);
}


/// Create a copy of PharmacistDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PharmacistDetailCopyWith<_PharmacistDetail> get copyWith => __$PharmacistDetailCopyWithImpl<_PharmacistDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PharmacistDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PharmacistDetail&&(identical(other.telegramId, telegramId) || other.telegramId == telegramId)&&(identical(other.name, name) || other.name == name)&&(identical(other.shop, shop) || other.shop == shop)&&(identical(other.city, city) || other.city == city)&&(identical(other.checks, checks) || other.checks == checks)&&(identical(other.quests, quests) || other.quests == quests)&&(identical(other.approvedPacks, approvedPacks) || other.approvedPacks == approvedPacks)&&(identical(other.lastActivity, lastActivity) || other.lastActivity == lastActivity)&&const DeepCollectionEquality().equals(other._recentChecks, _recentChecks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,telegramId,name,shop,city,checks,quests,approvedPacks,lastActivity,const DeepCollectionEquality().hash(_recentChecks));

@override
String toString() {
  return 'PharmacistDetail(telegramId: $telegramId, name: $name, shop: $shop, city: $city, checks: $checks, quests: $quests, approvedPacks: $approvedPacks, lastActivity: $lastActivity, recentChecks: $recentChecks)';
}


}

/// @nodoc
abstract mixin class _$PharmacistDetailCopyWith<$Res> implements $PharmacistDetailCopyWith<$Res> {
  factory _$PharmacistDetailCopyWith(_PharmacistDetail value, $Res Function(_PharmacistDetail) _then) = __$PharmacistDetailCopyWithImpl;
@override @useResult
$Res call({
 int telegramId, String name, String shop, String city, int checks, int quests, int approvedPacks, String lastActivity, List<RecentCheck> recentChecks
});




}
/// @nodoc
class __$PharmacistDetailCopyWithImpl<$Res>
    implements _$PharmacistDetailCopyWith<$Res> {
  __$PharmacistDetailCopyWithImpl(this._self, this._then);

  final _PharmacistDetail _self;
  final $Res Function(_PharmacistDetail) _then;

/// Create a copy of PharmacistDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? telegramId = null,Object? name = null,Object? shop = null,Object? city = null,Object? checks = null,Object? quests = null,Object? approvedPacks = null,Object? lastActivity = null,Object? recentChecks = null,}) {
  return _then(_PharmacistDetail(
telegramId: null == telegramId ? _self.telegramId : telegramId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shop: null == shop ? _self.shop : shop // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,checks: null == checks ? _self.checks : checks // ignore: cast_nullable_to_non_nullable
as int,quests: null == quests ? _self.quests : quests // ignore: cast_nullable_to_non_nullable
as int,approvedPacks: null == approvedPacks ? _self.approvedPacks : approvedPacks // ignore: cast_nullable_to_non_nullable
as int,lastActivity: null == lastActivity ? _self.lastActivity : lastActivity // ignore: cast_nullable_to_non_nullable
as String,recentChecks: null == recentChecks ? _self._recentChecks : recentChecks // ignore: cast_nullable_to_non_nullable
as List<RecentCheck>,
  ));
}


}


/// @nodoc
mixin _$DoctorQuestDrug {

 String get drug; double get need; double get got;
/// Create a copy of DoctorQuestDrug
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorQuestDrugCopyWith<DoctorQuestDrug> get copyWith => _$DoctorQuestDrugCopyWithImpl<DoctorQuestDrug>(this as DoctorQuestDrug, _$identity);

  /// Serializes this DoctorQuestDrug to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorQuestDrug&&(identical(other.drug, drug) || other.drug == drug)&&(identical(other.need, need) || other.need == need)&&(identical(other.got, got) || other.got == got));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,drug,need,got);

@override
String toString() {
  return 'DoctorQuestDrug(drug: $drug, need: $need, got: $got)';
}


}

/// @nodoc
abstract mixin class $DoctorQuestDrugCopyWith<$Res>  {
  factory $DoctorQuestDrugCopyWith(DoctorQuestDrug value, $Res Function(DoctorQuestDrug) _then) = _$DoctorQuestDrugCopyWithImpl;
@useResult
$Res call({
 String drug, double need, double got
});




}
/// @nodoc
class _$DoctorQuestDrugCopyWithImpl<$Res>
    implements $DoctorQuestDrugCopyWith<$Res> {
  _$DoctorQuestDrugCopyWithImpl(this._self, this._then);

  final DoctorQuestDrug _self;
  final $Res Function(DoctorQuestDrug) _then;

/// Create a copy of DoctorQuestDrug
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? drug = null,Object? need = null,Object? got = null,}) {
  return _then(_self.copyWith(
drug: null == drug ? _self.drug : drug // ignore: cast_nullable_to_non_nullable
as String,need: null == need ? _self.need : need // ignore: cast_nullable_to_non_nullable
as double,got: null == got ? _self.got : got // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorQuestDrug].
extension DoctorQuestDrugPatterns on DoctorQuestDrug {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorQuestDrug value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorQuestDrug() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorQuestDrug value)  $default,){
final _that = this;
switch (_that) {
case _DoctorQuestDrug():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorQuestDrug value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorQuestDrug() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String drug,  double need,  double got)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorQuestDrug() when $default != null:
return $default(_that.drug,_that.need,_that.got);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String drug,  double need,  double got)  $default,) {final _that = this;
switch (_that) {
case _DoctorQuestDrug():
return $default(_that.drug,_that.need,_that.got);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String drug,  double need,  double got)?  $default,) {final _that = this;
switch (_that) {
case _DoctorQuestDrug() when $default != null:
return $default(_that.drug,_that.need,_that.got);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorQuestDrug implements DoctorQuestDrug {
  const _DoctorQuestDrug({required this.drug, required this.need, this.got = 0});
  factory _DoctorQuestDrug.fromJson(Map<String, dynamic> json) => _$DoctorQuestDrugFromJson(json);

@override final  String drug;
@override final  double need;
@override@JsonKey() final  double got;

/// Create a copy of DoctorQuestDrug
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorQuestDrugCopyWith<_DoctorQuestDrug> get copyWith => __$DoctorQuestDrugCopyWithImpl<_DoctorQuestDrug>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorQuestDrugToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorQuestDrug&&(identical(other.drug, drug) || other.drug == drug)&&(identical(other.need, need) || other.need == need)&&(identical(other.got, got) || other.got == got));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,drug,need,got);

@override
String toString() {
  return 'DoctorQuestDrug(drug: $drug, need: $need, got: $got)';
}


}

/// @nodoc
abstract mixin class _$DoctorQuestDrugCopyWith<$Res> implements $DoctorQuestDrugCopyWith<$Res> {
  factory _$DoctorQuestDrugCopyWith(_DoctorQuestDrug value, $Res Function(_DoctorQuestDrug) _then) = __$DoctorQuestDrugCopyWithImpl;
@override @useResult
$Res call({
 String drug, double need, double got
});




}
/// @nodoc
class __$DoctorQuestDrugCopyWithImpl<$Res>
    implements _$DoctorQuestDrugCopyWith<$Res> {
  __$DoctorQuestDrugCopyWithImpl(this._self, this._then);

  final _DoctorQuestDrug _self;
  final $Res Function(_DoctorQuestDrug) _then;

/// Create a copy of DoctorQuestDrug
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? drug = null,Object? need = null,Object? got = null,}) {
  return _then(_DoctorQuestDrug(
drug: null == drug ? _self.drug : drug // ignore: cast_nullable_to_non_nullable
as String,need: null == need ? _self.need : need // ignore: cast_nullable_to_non_nullable
as double,got: null == got ? _self.got : got // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$DoctorQuestInfo {

 int get id; String get name; double get goal; String? get startDate; String? get endDate; List<DoctorQuestDrug> get drugs;
/// Create a copy of DoctorQuestInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorQuestInfoCopyWith<DoctorQuestInfo> get copyWith => _$DoctorQuestInfoCopyWithImpl<DoctorQuestInfo>(this as DoctorQuestInfo, _$identity);

  /// Serializes this DoctorQuestInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorQuestInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.drugs, drugs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,goal,startDate,endDate,const DeepCollectionEquality().hash(drugs));

@override
String toString() {
  return 'DoctorQuestInfo(id: $id, name: $name, goal: $goal, startDate: $startDate, endDate: $endDate, drugs: $drugs)';
}


}

/// @nodoc
abstract mixin class $DoctorQuestInfoCopyWith<$Res>  {
  factory $DoctorQuestInfoCopyWith(DoctorQuestInfo value, $Res Function(DoctorQuestInfo) _then) = _$DoctorQuestInfoCopyWithImpl;
@useResult
$Res call({
 int id, String name, double goal, String? startDate, String? endDate, List<DoctorQuestDrug> drugs
});




}
/// @nodoc
class _$DoctorQuestInfoCopyWithImpl<$Res>
    implements $DoctorQuestInfoCopyWith<$Res> {
  _$DoctorQuestInfoCopyWithImpl(this._self, this._then);

  final DoctorQuestInfo _self;
  final $Res Function(DoctorQuestInfo) _then;

/// Create a copy of DoctorQuestInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? goal = null,Object? startDate = freezed,Object? endDate = freezed,Object? drugs = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as double,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,drugs: null == drugs ? _self.drugs : drugs // ignore: cast_nullable_to_non_nullable
as List<DoctorQuestDrug>,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorQuestInfo].
extension DoctorQuestInfoPatterns on DoctorQuestInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorQuestInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorQuestInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorQuestInfo value)  $default,){
final _that = this;
switch (_that) {
case _DoctorQuestInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorQuestInfo value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorQuestInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  double goal,  String? startDate,  String? endDate,  List<DoctorQuestDrug> drugs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorQuestInfo() when $default != null:
return $default(_that.id,_that.name,_that.goal,_that.startDate,_that.endDate,_that.drugs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  double goal,  String? startDate,  String? endDate,  List<DoctorQuestDrug> drugs)  $default,) {final _that = this;
switch (_that) {
case _DoctorQuestInfo():
return $default(_that.id,_that.name,_that.goal,_that.startDate,_that.endDate,_that.drugs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  double goal,  String? startDate,  String? endDate,  List<DoctorQuestDrug> drugs)?  $default,) {final _that = this;
switch (_that) {
case _DoctorQuestInfo() when $default != null:
return $default(_that.id,_that.name,_that.goal,_that.startDate,_that.endDate,_that.drugs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorQuestInfo implements DoctorQuestInfo {
  const _DoctorQuestInfo({required this.id, required this.name, required this.goal, this.startDate, this.endDate, final  List<DoctorQuestDrug> drugs = const []}): _drugs = drugs;
  factory _DoctorQuestInfo.fromJson(Map<String, dynamic> json) => _$DoctorQuestInfoFromJson(json);

@override final  int id;
@override final  String name;
@override final  double goal;
@override final  String? startDate;
@override final  String? endDate;
 final  List<DoctorQuestDrug> _drugs;
@override@JsonKey() List<DoctorQuestDrug> get drugs {
  if (_drugs is EqualUnmodifiableListView) return _drugs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_drugs);
}


/// Create a copy of DoctorQuestInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorQuestInfoCopyWith<_DoctorQuestInfo> get copyWith => __$DoctorQuestInfoCopyWithImpl<_DoctorQuestInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorQuestInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorQuestInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._drugs, _drugs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,goal,startDate,endDate,const DeepCollectionEquality().hash(_drugs));

@override
String toString() {
  return 'DoctorQuestInfo(id: $id, name: $name, goal: $goal, startDate: $startDate, endDate: $endDate, drugs: $drugs)';
}


}

/// @nodoc
abstract mixin class _$DoctorQuestInfoCopyWith<$Res> implements $DoctorQuestInfoCopyWith<$Res> {
  factory _$DoctorQuestInfoCopyWith(_DoctorQuestInfo value, $Res Function(_DoctorQuestInfo) _then) = __$DoctorQuestInfoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, double goal, String? startDate, String? endDate, List<DoctorQuestDrug> drugs
});




}
/// @nodoc
class __$DoctorQuestInfoCopyWithImpl<$Res>
    implements _$DoctorQuestInfoCopyWith<$Res> {
  __$DoctorQuestInfoCopyWithImpl(this._self, this._then);

  final _DoctorQuestInfo _self;
  final $Res Function(_DoctorQuestInfo) _then;

/// Create a copy of DoctorQuestInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? goal = null,Object? startDate = freezed,Object? endDate = freezed,Object? drugs = null,}) {
  return _then(_DoctorQuestInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as double,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,drugs: null == drugs ? _self._drugs : drugs // ignore: cast_nullable_to_non_nullable
as List<DoctorQuestDrug>,
  ));
}


}


/// @nodoc
mixin _$DoctorRow {

 int get telegramId; String get name; String get workplace; String get city; String get phone; int get recipes; int get approvedRecipes; String? get lastRecipeAt;/// Сколько раз квест выполнен целиком.
 int get done;/// Набрано в текущем заходе (с капом по норме) и норма квеста.
 double get collected; double get goal; double get progress; List<DoctorQuestDrug> get perDrug;
/// Create a copy of DoctorRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorRowCopyWith<DoctorRow> get copyWith => _$DoctorRowCopyWithImpl<DoctorRow>(this as DoctorRow, _$identity);

  /// Serializes this DoctorRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorRow&&(identical(other.telegramId, telegramId) || other.telegramId == telegramId)&&(identical(other.name, name) || other.name == name)&&(identical(other.workplace, workplace) || other.workplace == workplace)&&(identical(other.city, city) || other.city == city)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.recipes, recipes) || other.recipes == recipes)&&(identical(other.approvedRecipes, approvedRecipes) || other.approvedRecipes == approvedRecipes)&&(identical(other.lastRecipeAt, lastRecipeAt) || other.lastRecipeAt == lastRecipeAt)&&(identical(other.done, done) || other.done == done)&&(identical(other.collected, collected) || other.collected == collected)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.progress, progress) || other.progress == progress)&&const DeepCollectionEquality().equals(other.perDrug, perDrug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,telegramId,name,workplace,city,phone,recipes,approvedRecipes,lastRecipeAt,done,collected,goal,progress,const DeepCollectionEquality().hash(perDrug));

@override
String toString() {
  return 'DoctorRow(telegramId: $telegramId, name: $name, workplace: $workplace, city: $city, phone: $phone, recipes: $recipes, approvedRecipes: $approvedRecipes, lastRecipeAt: $lastRecipeAt, done: $done, collected: $collected, goal: $goal, progress: $progress, perDrug: $perDrug)';
}


}

/// @nodoc
abstract mixin class $DoctorRowCopyWith<$Res>  {
  factory $DoctorRowCopyWith(DoctorRow value, $Res Function(DoctorRow) _then) = _$DoctorRowCopyWithImpl;
@useResult
$Res call({
 int telegramId, String name, String workplace, String city, String phone, int recipes, int approvedRecipes, String? lastRecipeAt, int done, double collected, double goal, double progress, List<DoctorQuestDrug> perDrug
});




}
/// @nodoc
class _$DoctorRowCopyWithImpl<$Res>
    implements $DoctorRowCopyWith<$Res> {
  _$DoctorRowCopyWithImpl(this._self, this._then);

  final DoctorRow _self;
  final $Res Function(DoctorRow) _then;

/// Create a copy of DoctorRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? telegramId = null,Object? name = null,Object? workplace = null,Object? city = null,Object? phone = null,Object? recipes = null,Object? approvedRecipes = null,Object? lastRecipeAt = freezed,Object? done = null,Object? collected = null,Object? goal = null,Object? progress = null,Object? perDrug = null,}) {
  return _then(_self.copyWith(
telegramId: null == telegramId ? _self.telegramId : telegramId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,workplace: null == workplace ? _self.workplace : workplace // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,recipes: null == recipes ? _self.recipes : recipes // ignore: cast_nullable_to_non_nullable
as int,approvedRecipes: null == approvedRecipes ? _self.approvedRecipes : approvedRecipes // ignore: cast_nullable_to_non_nullable
as int,lastRecipeAt: freezed == lastRecipeAt ? _self.lastRecipeAt : lastRecipeAt // ignore: cast_nullable_to_non_nullable
as String?,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as int,collected: null == collected ? _self.collected : collected // ignore: cast_nullable_to_non_nullable
as double,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as double,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,perDrug: null == perDrug ? _self.perDrug : perDrug // ignore: cast_nullable_to_non_nullable
as List<DoctorQuestDrug>,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorRow].
extension DoctorRowPatterns on DoctorRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorRow value)  $default,){
final _that = this;
switch (_that) {
case _DoctorRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorRow value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int telegramId,  String name,  String workplace,  String city,  String phone,  int recipes,  int approvedRecipes,  String? lastRecipeAt,  int done,  double collected,  double goal,  double progress,  List<DoctorQuestDrug> perDrug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorRow() when $default != null:
return $default(_that.telegramId,_that.name,_that.workplace,_that.city,_that.phone,_that.recipes,_that.approvedRecipes,_that.lastRecipeAt,_that.done,_that.collected,_that.goal,_that.progress,_that.perDrug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int telegramId,  String name,  String workplace,  String city,  String phone,  int recipes,  int approvedRecipes,  String? lastRecipeAt,  int done,  double collected,  double goal,  double progress,  List<DoctorQuestDrug> perDrug)  $default,) {final _that = this;
switch (_that) {
case _DoctorRow():
return $default(_that.telegramId,_that.name,_that.workplace,_that.city,_that.phone,_that.recipes,_that.approvedRecipes,_that.lastRecipeAt,_that.done,_that.collected,_that.goal,_that.progress,_that.perDrug);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int telegramId,  String name,  String workplace,  String city,  String phone,  int recipes,  int approvedRecipes,  String? lastRecipeAt,  int done,  double collected,  double goal,  double progress,  List<DoctorQuestDrug> perDrug)?  $default,) {final _that = this;
switch (_that) {
case _DoctorRow() when $default != null:
return $default(_that.telegramId,_that.name,_that.workplace,_that.city,_that.phone,_that.recipes,_that.approvedRecipes,_that.lastRecipeAt,_that.done,_that.collected,_that.goal,_that.progress,_that.perDrug);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorRow implements DoctorRow {
  const _DoctorRow({required this.telegramId, required this.name, required this.workplace, required this.city, required this.phone, required this.recipes, required this.approvedRecipes, this.lastRecipeAt, required this.done, required this.collected, required this.goal, required this.progress, final  List<DoctorQuestDrug> perDrug = const []}): _perDrug = perDrug;
  factory _DoctorRow.fromJson(Map<String, dynamic> json) => _$DoctorRowFromJson(json);

@override final  int telegramId;
@override final  String name;
@override final  String workplace;
@override final  String city;
@override final  String phone;
@override final  int recipes;
@override final  int approvedRecipes;
@override final  String? lastRecipeAt;
/// Сколько раз квест выполнен целиком.
@override final  int done;
/// Набрано в текущем заходе (с капом по норме) и норма квеста.
@override final  double collected;
@override final  double goal;
@override final  double progress;
 final  List<DoctorQuestDrug> _perDrug;
@override@JsonKey() List<DoctorQuestDrug> get perDrug {
  if (_perDrug is EqualUnmodifiableListView) return _perDrug;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_perDrug);
}


/// Create a copy of DoctorRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorRowCopyWith<_DoctorRow> get copyWith => __$DoctorRowCopyWithImpl<_DoctorRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorRowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorRow&&(identical(other.telegramId, telegramId) || other.telegramId == telegramId)&&(identical(other.name, name) || other.name == name)&&(identical(other.workplace, workplace) || other.workplace == workplace)&&(identical(other.city, city) || other.city == city)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.recipes, recipes) || other.recipes == recipes)&&(identical(other.approvedRecipes, approvedRecipes) || other.approvedRecipes == approvedRecipes)&&(identical(other.lastRecipeAt, lastRecipeAt) || other.lastRecipeAt == lastRecipeAt)&&(identical(other.done, done) || other.done == done)&&(identical(other.collected, collected) || other.collected == collected)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.progress, progress) || other.progress == progress)&&const DeepCollectionEquality().equals(other._perDrug, _perDrug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,telegramId,name,workplace,city,phone,recipes,approvedRecipes,lastRecipeAt,done,collected,goal,progress,const DeepCollectionEquality().hash(_perDrug));

@override
String toString() {
  return 'DoctorRow(telegramId: $telegramId, name: $name, workplace: $workplace, city: $city, phone: $phone, recipes: $recipes, approvedRecipes: $approvedRecipes, lastRecipeAt: $lastRecipeAt, done: $done, collected: $collected, goal: $goal, progress: $progress, perDrug: $perDrug)';
}


}

/// @nodoc
abstract mixin class _$DoctorRowCopyWith<$Res> implements $DoctorRowCopyWith<$Res> {
  factory _$DoctorRowCopyWith(_DoctorRow value, $Res Function(_DoctorRow) _then) = __$DoctorRowCopyWithImpl;
@override @useResult
$Res call({
 int telegramId, String name, String workplace, String city, String phone, int recipes, int approvedRecipes, String? lastRecipeAt, int done, double collected, double goal, double progress, List<DoctorQuestDrug> perDrug
});




}
/// @nodoc
class __$DoctorRowCopyWithImpl<$Res>
    implements _$DoctorRowCopyWith<$Res> {
  __$DoctorRowCopyWithImpl(this._self, this._then);

  final _DoctorRow _self;
  final $Res Function(_DoctorRow) _then;

/// Create a copy of DoctorRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? telegramId = null,Object? name = null,Object? workplace = null,Object? city = null,Object? phone = null,Object? recipes = null,Object? approvedRecipes = null,Object? lastRecipeAt = freezed,Object? done = null,Object? collected = null,Object? goal = null,Object? progress = null,Object? perDrug = null,}) {
  return _then(_DoctorRow(
telegramId: null == telegramId ? _self.telegramId : telegramId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,workplace: null == workplace ? _self.workplace : workplace // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,recipes: null == recipes ? _self.recipes : recipes // ignore: cast_nullable_to_non_nullable
as int,approvedRecipes: null == approvedRecipes ? _self.approvedRecipes : approvedRecipes // ignore: cast_nullable_to_non_nullable
as int,lastRecipeAt: freezed == lastRecipeAt ? _self.lastRecipeAt : lastRecipeAt // ignore: cast_nullable_to_non_nullable
as String?,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as int,collected: null == collected ? _self.collected : collected // ignore: cast_nullable_to_non_nullable
as double,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as double,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,perDrug: null == perDrug ? _self._perDrug : perDrug // ignore: cast_nullable_to_non_nullable
as List<DoctorQuestDrug>,
  ));
}


}


/// @nodoc
mixin _$DoctorRegionGroup {

 String get region; int get doctors; int get completed; List<DoctorRow> get items;
/// Create a copy of DoctorRegionGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorRegionGroupCopyWith<DoctorRegionGroup> get copyWith => _$DoctorRegionGroupCopyWithImpl<DoctorRegionGroup>(this as DoctorRegionGroup, _$identity);

  /// Serializes this DoctorRegionGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorRegionGroup&&(identical(other.region, region) || other.region == region)&&(identical(other.doctors, doctors) || other.doctors == doctors)&&(identical(other.completed, completed) || other.completed == completed)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,region,doctors,completed,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'DoctorRegionGroup(region: $region, doctors: $doctors, completed: $completed, items: $items)';
}


}

/// @nodoc
abstract mixin class $DoctorRegionGroupCopyWith<$Res>  {
  factory $DoctorRegionGroupCopyWith(DoctorRegionGroup value, $Res Function(DoctorRegionGroup) _then) = _$DoctorRegionGroupCopyWithImpl;
@useResult
$Res call({
 String region, int doctors, int completed, List<DoctorRow> items
});




}
/// @nodoc
class _$DoctorRegionGroupCopyWithImpl<$Res>
    implements $DoctorRegionGroupCopyWith<$Res> {
  _$DoctorRegionGroupCopyWithImpl(this._self, this._then);

  final DoctorRegionGroup _self;
  final $Res Function(DoctorRegionGroup) _then;

/// Create a copy of DoctorRegionGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? region = null,Object? doctors = null,Object? completed = null,Object? items = null,}) {
  return _then(_self.copyWith(
region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,doctors: null == doctors ? _self.doctors : doctors // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<DoctorRow>,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorRegionGroup].
extension DoctorRegionGroupPatterns on DoctorRegionGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorRegionGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorRegionGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorRegionGroup value)  $default,){
final _that = this;
switch (_that) {
case _DoctorRegionGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorRegionGroup value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorRegionGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String region,  int doctors,  int completed,  List<DoctorRow> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorRegionGroup() when $default != null:
return $default(_that.region,_that.doctors,_that.completed,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String region,  int doctors,  int completed,  List<DoctorRow> items)  $default,) {final _that = this;
switch (_that) {
case _DoctorRegionGroup():
return $default(_that.region,_that.doctors,_that.completed,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String region,  int doctors,  int completed,  List<DoctorRow> items)?  $default,) {final _that = this;
switch (_that) {
case _DoctorRegionGroup() when $default != null:
return $default(_that.region,_that.doctors,_that.completed,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorRegionGroup implements DoctorRegionGroup {
  const _DoctorRegionGroup({required this.region, required this.doctors, required this.completed, final  List<DoctorRow> items = const []}): _items = items;
  factory _DoctorRegionGroup.fromJson(Map<String, dynamic> json) => _$DoctorRegionGroupFromJson(json);

@override final  String region;
@override final  int doctors;
@override final  int completed;
 final  List<DoctorRow> _items;
@override@JsonKey() List<DoctorRow> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of DoctorRegionGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorRegionGroupCopyWith<_DoctorRegionGroup> get copyWith => __$DoctorRegionGroupCopyWithImpl<_DoctorRegionGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorRegionGroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorRegionGroup&&(identical(other.region, region) || other.region == region)&&(identical(other.doctors, doctors) || other.doctors == doctors)&&(identical(other.completed, completed) || other.completed == completed)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,region,doctors,completed,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'DoctorRegionGroup(region: $region, doctors: $doctors, completed: $completed, items: $items)';
}


}

/// @nodoc
abstract mixin class _$DoctorRegionGroupCopyWith<$Res> implements $DoctorRegionGroupCopyWith<$Res> {
  factory _$DoctorRegionGroupCopyWith(_DoctorRegionGroup value, $Res Function(_DoctorRegionGroup) _then) = __$DoctorRegionGroupCopyWithImpl;
@override @useResult
$Res call({
 String region, int doctors, int completed, List<DoctorRow> items
});




}
/// @nodoc
class __$DoctorRegionGroupCopyWithImpl<$Res>
    implements _$DoctorRegionGroupCopyWith<$Res> {
  __$DoctorRegionGroupCopyWithImpl(this._self, this._then);

  final _DoctorRegionGroup _self;
  final $Res Function(_DoctorRegionGroup) _then;

/// Create a copy of DoctorRegionGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? region = null,Object? doctors = null,Object? completed = null,Object? items = null,}) {
  return _then(_DoctorRegionGroup(
region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,doctors: null == doctors ? _self.doctors : doctors // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<DoctorRow>,
  ));
}


}


/// @nodoc
mixin _$DoctorTotals {

 int get doctors; int get completed; int get inProgress; int get idle;
/// Create a copy of DoctorTotals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorTotalsCopyWith<DoctorTotals> get copyWith => _$DoctorTotalsCopyWithImpl<DoctorTotals>(this as DoctorTotals, _$identity);

  /// Serializes this DoctorTotals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorTotals&&(identical(other.doctors, doctors) || other.doctors == doctors)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.inProgress, inProgress) || other.inProgress == inProgress)&&(identical(other.idle, idle) || other.idle == idle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctors,completed,inProgress,idle);

@override
String toString() {
  return 'DoctorTotals(doctors: $doctors, completed: $completed, inProgress: $inProgress, idle: $idle)';
}


}

/// @nodoc
abstract mixin class $DoctorTotalsCopyWith<$Res>  {
  factory $DoctorTotalsCopyWith(DoctorTotals value, $Res Function(DoctorTotals) _then) = _$DoctorTotalsCopyWithImpl;
@useResult
$Res call({
 int doctors, int completed, int inProgress, int idle
});




}
/// @nodoc
class _$DoctorTotalsCopyWithImpl<$Res>
    implements $DoctorTotalsCopyWith<$Res> {
  _$DoctorTotalsCopyWithImpl(this._self, this._then);

  final DoctorTotals _self;
  final $Res Function(DoctorTotals) _then;

/// Create a copy of DoctorTotals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctors = null,Object? completed = null,Object? inProgress = null,Object? idle = null,}) {
  return _then(_self.copyWith(
doctors: null == doctors ? _self.doctors : doctors // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,inProgress: null == inProgress ? _self.inProgress : inProgress // ignore: cast_nullable_to_non_nullable
as int,idle: null == idle ? _self.idle : idle // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorTotals].
extension DoctorTotalsPatterns on DoctorTotals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorTotals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorTotals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorTotals value)  $default,){
final _that = this;
switch (_that) {
case _DoctorTotals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorTotals value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorTotals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int doctors,  int completed,  int inProgress,  int idle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorTotals() when $default != null:
return $default(_that.doctors,_that.completed,_that.inProgress,_that.idle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int doctors,  int completed,  int inProgress,  int idle)  $default,) {final _that = this;
switch (_that) {
case _DoctorTotals():
return $default(_that.doctors,_that.completed,_that.inProgress,_that.idle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int doctors,  int completed,  int inProgress,  int idle)?  $default,) {final _that = this;
switch (_that) {
case _DoctorTotals() when $default != null:
return $default(_that.doctors,_that.completed,_that.inProgress,_that.idle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorTotals implements DoctorTotals {
  const _DoctorTotals({this.doctors = 0, this.completed = 0, this.inProgress = 0, this.idle = 0});
  factory _DoctorTotals.fromJson(Map<String, dynamic> json) => _$DoctorTotalsFromJson(json);

@override@JsonKey() final  int doctors;
@override@JsonKey() final  int completed;
@override@JsonKey() final  int inProgress;
@override@JsonKey() final  int idle;

/// Create a copy of DoctorTotals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorTotalsCopyWith<_DoctorTotals> get copyWith => __$DoctorTotalsCopyWithImpl<_DoctorTotals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorTotalsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorTotals&&(identical(other.doctors, doctors) || other.doctors == doctors)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.inProgress, inProgress) || other.inProgress == inProgress)&&(identical(other.idle, idle) || other.idle == idle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctors,completed,inProgress,idle);

@override
String toString() {
  return 'DoctorTotals(doctors: $doctors, completed: $completed, inProgress: $inProgress, idle: $idle)';
}


}

/// @nodoc
abstract mixin class _$DoctorTotalsCopyWith<$Res> implements $DoctorTotalsCopyWith<$Res> {
  factory _$DoctorTotalsCopyWith(_DoctorTotals value, $Res Function(_DoctorTotals) _then) = __$DoctorTotalsCopyWithImpl;
@override @useResult
$Res call({
 int doctors, int completed, int inProgress, int idle
});




}
/// @nodoc
class __$DoctorTotalsCopyWithImpl<$Res>
    implements _$DoctorTotalsCopyWith<$Res> {
  __$DoctorTotalsCopyWithImpl(this._self, this._then);

  final _DoctorTotals _self;
  final $Res Function(_DoctorTotals) _then;

/// Create a copy of DoctorTotals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctors = null,Object? completed = null,Object? inProgress = null,Object? idle = null,}) {
  return _then(_DoctorTotals(
doctors: null == doctors ? _self.doctors : doctors // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,inProgress: null == inProgress ? _self.inProgress : inProgress // ignore: cast_nullable_to_non_nullable
as int,idle: null == idle ? _self.idle : idle // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DoctorsOverview {

/// false — у компании медпреда нет рецептурного проекта (это не ошибка).
 bool get available; String? get companyName; int? get questId; List<DoctorQuestInfo> get quests; DoctorTotals get totals; List<DoctorRegionGroup> get regions;
/// Create a copy of DoctorsOverview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorsOverviewCopyWith<DoctorsOverview> get copyWith => _$DoctorsOverviewCopyWithImpl<DoctorsOverview>(this as DoctorsOverview, _$identity);

  /// Serializes this DoctorsOverview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorsOverview&&(identical(other.available, available) || other.available == available)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.questId, questId) || other.questId == questId)&&const DeepCollectionEquality().equals(other.quests, quests)&&(identical(other.totals, totals) || other.totals == totals)&&const DeepCollectionEquality().equals(other.regions, regions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,available,companyName,questId,const DeepCollectionEquality().hash(quests),totals,const DeepCollectionEquality().hash(regions));

@override
String toString() {
  return 'DoctorsOverview(available: $available, companyName: $companyName, questId: $questId, quests: $quests, totals: $totals, regions: $regions)';
}


}

/// @nodoc
abstract mixin class $DoctorsOverviewCopyWith<$Res>  {
  factory $DoctorsOverviewCopyWith(DoctorsOverview value, $Res Function(DoctorsOverview) _then) = _$DoctorsOverviewCopyWithImpl;
@useResult
$Res call({
 bool available, String? companyName, int? questId, List<DoctorQuestInfo> quests, DoctorTotals totals, List<DoctorRegionGroup> regions
});


$DoctorTotalsCopyWith<$Res> get totals;

}
/// @nodoc
class _$DoctorsOverviewCopyWithImpl<$Res>
    implements $DoctorsOverviewCopyWith<$Res> {
  _$DoctorsOverviewCopyWithImpl(this._self, this._then);

  final DoctorsOverview _self;
  final $Res Function(DoctorsOverview) _then;

/// Create a copy of DoctorsOverview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? available = null,Object? companyName = freezed,Object? questId = freezed,Object? quests = null,Object? totals = null,Object? regions = null,}) {
  return _then(_self.copyWith(
available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,questId: freezed == questId ? _self.questId : questId // ignore: cast_nullable_to_non_nullable
as int?,quests: null == quests ? _self.quests : quests // ignore: cast_nullable_to_non_nullable
as List<DoctorQuestInfo>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as DoctorTotals,regions: null == regions ? _self.regions : regions // ignore: cast_nullable_to_non_nullable
as List<DoctorRegionGroup>,
  ));
}
/// Create a copy of DoctorsOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorTotalsCopyWith<$Res> get totals {
  
  return $DoctorTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// Adds pattern-matching-related methods to [DoctorsOverview].
extension DoctorsOverviewPatterns on DoctorsOverview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorsOverview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorsOverview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorsOverview value)  $default,){
final _that = this;
switch (_that) {
case _DoctorsOverview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorsOverview value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorsOverview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool available,  String? companyName,  int? questId,  List<DoctorQuestInfo> quests,  DoctorTotals totals,  List<DoctorRegionGroup> regions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorsOverview() when $default != null:
return $default(_that.available,_that.companyName,_that.questId,_that.quests,_that.totals,_that.regions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool available,  String? companyName,  int? questId,  List<DoctorQuestInfo> quests,  DoctorTotals totals,  List<DoctorRegionGroup> regions)  $default,) {final _that = this;
switch (_that) {
case _DoctorsOverview():
return $default(_that.available,_that.companyName,_that.questId,_that.quests,_that.totals,_that.regions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool available,  String? companyName,  int? questId,  List<DoctorQuestInfo> quests,  DoctorTotals totals,  List<DoctorRegionGroup> regions)?  $default,) {final _that = this;
switch (_that) {
case _DoctorsOverview() when $default != null:
return $default(_that.available,_that.companyName,_that.questId,_that.quests,_that.totals,_that.regions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorsOverview implements DoctorsOverview {
  const _DoctorsOverview({required this.available, this.companyName, this.questId, final  List<DoctorQuestInfo> quests = const [], this.totals = const DoctorTotals(), final  List<DoctorRegionGroup> regions = const []}): _quests = quests,_regions = regions;
  factory _DoctorsOverview.fromJson(Map<String, dynamic> json) => _$DoctorsOverviewFromJson(json);

/// false — у компании медпреда нет рецептурного проекта (это не ошибка).
@override final  bool available;
@override final  String? companyName;
@override final  int? questId;
 final  List<DoctorQuestInfo> _quests;
@override@JsonKey() List<DoctorQuestInfo> get quests {
  if (_quests is EqualUnmodifiableListView) return _quests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quests);
}

@override@JsonKey() final  DoctorTotals totals;
 final  List<DoctorRegionGroup> _regions;
@override@JsonKey() List<DoctorRegionGroup> get regions {
  if (_regions is EqualUnmodifiableListView) return _regions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_regions);
}


/// Create a copy of DoctorsOverview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorsOverviewCopyWith<_DoctorsOverview> get copyWith => __$DoctorsOverviewCopyWithImpl<_DoctorsOverview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorsOverviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorsOverview&&(identical(other.available, available) || other.available == available)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.questId, questId) || other.questId == questId)&&const DeepCollectionEquality().equals(other._quests, _quests)&&(identical(other.totals, totals) || other.totals == totals)&&const DeepCollectionEquality().equals(other._regions, _regions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,available,companyName,questId,const DeepCollectionEquality().hash(_quests),totals,const DeepCollectionEquality().hash(_regions));

@override
String toString() {
  return 'DoctorsOverview(available: $available, companyName: $companyName, questId: $questId, quests: $quests, totals: $totals, regions: $regions)';
}


}

/// @nodoc
abstract mixin class _$DoctorsOverviewCopyWith<$Res> implements $DoctorsOverviewCopyWith<$Res> {
  factory _$DoctorsOverviewCopyWith(_DoctorsOverview value, $Res Function(_DoctorsOverview) _then) = __$DoctorsOverviewCopyWithImpl;
@override @useResult
$Res call({
 bool available, String? companyName, int? questId, List<DoctorQuestInfo> quests, DoctorTotals totals, List<DoctorRegionGroup> regions
});


@override $DoctorTotalsCopyWith<$Res> get totals;

}
/// @nodoc
class __$DoctorsOverviewCopyWithImpl<$Res>
    implements _$DoctorsOverviewCopyWith<$Res> {
  __$DoctorsOverviewCopyWithImpl(this._self, this._then);

  final _DoctorsOverview _self;
  final $Res Function(_DoctorsOverview) _then;

/// Create a copy of DoctorsOverview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? available = null,Object? companyName = freezed,Object? questId = freezed,Object? quests = null,Object? totals = null,Object? regions = null,}) {
  return _then(_DoctorsOverview(
available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,questId: freezed == questId ? _self.questId : questId // ignore: cast_nullable_to_non_nullable
as int?,quests: null == quests ? _self._quests : quests // ignore: cast_nullable_to_non_nullable
as List<DoctorQuestInfo>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as DoctorTotals,regions: null == regions ? _self._regions : regions // ignore: cast_nullable_to_non_nullable
as List<DoctorRegionGroup>,
  ));
}

/// Create a copy of DoctorsOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorTotalsCopyWith<$Res> get totals {
  
  return $DoctorTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// @nodoc
mixin _$MedrepCode {

 String get code; String? get username; String? get company; int get joinedByCode;
/// Create a copy of MedrepCode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedrepCodeCopyWith<MedrepCode> get copyWith => _$MedrepCodeCopyWithImpl<MedrepCode>(this as MedrepCode, _$identity);

  /// Serializes this MedrepCode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedrepCode&&(identical(other.code, code) || other.code == code)&&(identical(other.username, username) || other.username == username)&&(identical(other.company, company) || other.company == company)&&(identical(other.joinedByCode, joinedByCode) || other.joinedByCode == joinedByCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,username,company,joinedByCode);

@override
String toString() {
  return 'MedrepCode(code: $code, username: $username, company: $company, joinedByCode: $joinedByCode)';
}


}

/// @nodoc
abstract mixin class $MedrepCodeCopyWith<$Res>  {
  factory $MedrepCodeCopyWith(MedrepCode value, $Res Function(MedrepCode) _then) = _$MedrepCodeCopyWithImpl;
@useResult
$Res call({
 String code, String? username, String? company, int joinedByCode
});




}
/// @nodoc
class _$MedrepCodeCopyWithImpl<$Res>
    implements $MedrepCodeCopyWith<$Res> {
  _$MedrepCodeCopyWithImpl(this._self, this._then);

  final MedrepCode _self;
  final $Res Function(MedrepCode) _then;

/// Create a copy of MedrepCode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? username = freezed,Object? company = freezed,Object? joinedByCode = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,joinedByCode: null == joinedByCode ? _self.joinedByCode : joinedByCode // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MedrepCode].
extension MedrepCodePatterns on MedrepCode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedrepCode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedrepCode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedrepCode value)  $default,){
final _that = this;
switch (_that) {
case _MedrepCode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedrepCode value)?  $default,){
final _that = this;
switch (_that) {
case _MedrepCode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String? username,  String? company,  int joinedByCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedrepCode() when $default != null:
return $default(_that.code,_that.username,_that.company,_that.joinedByCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String? username,  String? company,  int joinedByCode)  $default,) {final _that = this;
switch (_that) {
case _MedrepCode():
return $default(_that.code,_that.username,_that.company,_that.joinedByCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String? username,  String? company,  int joinedByCode)?  $default,) {final _that = this;
switch (_that) {
case _MedrepCode() when $default != null:
return $default(_that.code,_that.username,_that.company,_that.joinedByCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedrepCode implements MedrepCode {
  const _MedrepCode({required this.code, this.username, this.company, this.joinedByCode = 0});
  factory _MedrepCode.fromJson(Map<String, dynamic> json) => _$MedrepCodeFromJson(json);

@override final  String code;
@override final  String? username;
@override final  String? company;
@override@JsonKey() final  int joinedByCode;

/// Create a copy of MedrepCode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedrepCodeCopyWith<_MedrepCode> get copyWith => __$MedrepCodeCopyWithImpl<_MedrepCode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedrepCodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedrepCode&&(identical(other.code, code) || other.code == code)&&(identical(other.username, username) || other.username == username)&&(identical(other.company, company) || other.company == company)&&(identical(other.joinedByCode, joinedByCode) || other.joinedByCode == joinedByCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,username,company,joinedByCode);

@override
String toString() {
  return 'MedrepCode(code: $code, username: $username, company: $company, joinedByCode: $joinedByCode)';
}


}

/// @nodoc
abstract mixin class _$MedrepCodeCopyWith<$Res> implements $MedrepCodeCopyWith<$Res> {
  factory _$MedrepCodeCopyWith(_MedrepCode value, $Res Function(_MedrepCode) _then) = __$MedrepCodeCopyWithImpl;
@override @useResult
$Res call({
 String code, String? username, String? company, int joinedByCode
});




}
/// @nodoc
class __$MedrepCodeCopyWithImpl<$Res>
    implements _$MedrepCodeCopyWith<$Res> {
  __$MedrepCodeCopyWithImpl(this._self, this._then);

  final _MedrepCode _self;
  final $Res Function(_MedrepCode) _then;

/// Create a copy of MedrepCode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? username = freezed,Object? company = freezed,Object? joinedByCode = null,}) {
  return _then(_MedrepCode(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,joinedByCode: null == joinedByCode ? _self.joinedByCode : joinedByCode // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MedrepCodeOwner {

 String get name; String? get company;
/// Create a copy of MedrepCodeOwner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedrepCodeOwnerCopyWith<MedrepCodeOwner> get copyWith => _$MedrepCodeOwnerCopyWithImpl<MedrepCodeOwner>(this as MedrepCodeOwner, _$identity);

  /// Serializes this MedrepCodeOwner to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedrepCodeOwner&&(identical(other.name, name) || other.name == name)&&(identical(other.company, company) || other.company == company));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,company);

@override
String toString() {
  return 'MedrepCodeOwner(name: $name, company: $company)';
}


}

/// @nodoc
abstract mixin class $MedrepCodeOwnerCopyWith<$Res>  {
  factory $MedrepCodeOwnerCopyWith(MedrepCodeOwner value, $Res Function(MedrepCodeOwner) _then) = _$MedrepCodeOwnerCopyWithImpl;
@useResult
$Res call({
 String name, String? company
});




}
/// @nodoc
class _$MedrepCodeOwnerCopyWithImpl<$Res>
    implements $MedrepCodeOwnerCopyWith<$Res> {
  _$MedrepCodeOwnerCopyWithImpl(this._self, this._then);

  final MedrepCodeOwner _self;
  final $Res Function(MedrepCodeOwner) _then;

/// Create a copy of MedrepCodeOwner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? company = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MedrepCodeOwner].
extension MedrepCodeOwnerPatterns on MedrepCodeOwner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedrepCodeOwner value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedrepCodeOwner() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedrepCodeOwner value)  $default,){
final _that = this;
switch (_that) {
case _MedrepCodeOwner():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedrepCodeOwner value)?  $default,){
final _that = this;
switch (_that) {
case _MedrepCodeOwner() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? company)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedrepCodeOwner() when $default != null:
return $default(_that.name,_that.company);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? company)  $default,) {final _that = this;
switch (_that) {
case _MedrepCodeOwner():
return $default(_that.name,_that.company);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? company)?  $default,) {final _that = this;
switch (_that) {
case _MedrepCodeOwner() when $default != null:
return $default(_that.name,_that.company);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedrepCodeOwner implements MedrepCodeOwner {
  const _MedrepCodeOwner({required this.name, this.company});
  factory _MedrepCodeOwner.fromJson(Map<String, dynamic> json) => _$MedrepCodeOwnerFromJson(json);

@override final  String name;
@override final  String? company;

/// Create a copy of MedrepCodeOwner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedrepCodeOwnerCopyWith<_MedrepCodeOwner> get copyWith => __$MedrepCodeOwnerCopyWithImpl<_MedrepCodeOwner>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedrepCodeOwnerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedrepCodeOwner&&(identical(other.name, name) || other.name == name)&&(identical(other.company, company) || other.company == company));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,company);

@override
String toString() {
  return 'MedrepCodeOwner(name: $name, company: $company)';
}


}

/// @nodoc
abstract mixin class _$MedrepCodeOwnerCopyWith<$Res> implements $MedrepCodeOwnerCopyWith<$Res> {
  factory _$MedrepCodeOwnerCopyWith(_MedrepCodeOwner value, $Res Function(_MedrepCodeOwner) _then) = __$MedrepCodeOwnerCopyWithImpl;
@override @useResult
$Res call({
 String name, String? company
});




}
/// @nodoc
class __$MedrepCodeOwnerCopyWithImpl<$Res>
    implements _$MedrepCodeOwnerCopyWith<$Res> {
  __$MedrepCodeOwnerCopyWithImpl(this._self, this._then);

  final _MedrepCodeOwner _self;
  final $Res Function(_MedrepCodeOwner) _then;

/// Create a copy of MedrepCodeOwner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? company = freezed,}) {
  return _then(_MedrepCodeOwner(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MedrepCodeCheck {

 bool get ok; MedrepCodeOwner? get medrep;
/// Create a copy of MedrepCodeCheck
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedrepCodeCheckCopyWith<MedrepCodeCheck> get copyWith => _$MedrepCodeCheckCopyWithImpl<MedrepCodeCheck>(this as MedrepCodeCheck, _$identity);

  /// Serializes this MedrepCodeCheck to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedrepCodeCheck&&(identical(other.ok, ok) || other.ok == ok)&&(identical(other.medrep, medrep) || other.medrep == medrep));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ok,medrep);

@override
String toString() {
  return 'MedrepCodeCheck(ok: $ok, medrep: $medrep)';
}


}

/// @nodoc
abstract mixin class $MedrepCodeCheckCopyWith<$Res>  {
  factory $MedrepCodeCheckCopyWith(MedrepCodeCheck value, $Res Function(MedrepCodeCheck) _then) = _$MedrepCodeCheckCopyWithImpl;
@useResult
$Res call({
 bool ok, MedrepCodeOwner? medrep
});


$MedrepCodeOwnerCopyWith<$Res>? get medrep;

}
/// @nodoc
class _$MedrepCodeCheckCopyWithImpl<$Res>
    implements $MedrepCodeCheckCopyWith<$Res> {
  _$MedrepCodeCheckCopyWithImpl(this._self, this._then);

  final MedrepCodeCheck _self;
  final $Res Function(MedrepCodeCheck) _then;

/// Create a copy of MedrepCodeCheck
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ok = null,Object? medrep = freezed,}) {
  return _then(_self.copyWith(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,medrep: freezed == medrep ? _self.medrep : medrep // ignore: cast_nullable_to_non_nullable
as MedrepCodeOwner?,
  ));
}
/// Create a copy of MedrepCodeCheck
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MedrepCodeOwnerCopyWith<$Res>? get medrep {
    if (_self.medrep == null) {
    return null;
  }

  return $MedrepCodeOwnerCopyWith<$Res>(_self.medrep!, (value) {
    return _then(_self.copyWith(medrep: value));
  });
}
}


/// Adds pattern-matching-related methods to [MedrepCodeCheck].
extension MedrepCodeCheckPatterns on MedrepCodeCheck {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedrepCodeCheck value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedrepCodeCheck() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedrepCodeCheck value)  $default,){
final _that = this;
switch (_that) {
case _MedrepCodeCheck():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedrepCodeCheck value)?  $default,){
final _that = this;
switch (_that) {
case _MedrepCodeCheck() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool ok,  MedrepCodeOwner? medrep)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedrepCodeCheck() when $default != null:
return $default(_that.ok,_that.medrep);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool ok,  MedrepCodeOwner? medrep)  $default,) {final _that = this;
switch (_that) {
case _MedrepCodeCheck():
return $default(_that.ok,_that.medrep);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool ok,  MedrepCodeOwner? medrep)?  $default,) {final _that = this;
switch (_that) {
case _MedrepCodeCheck() when $default != null:
return $default(_that.ok,_that.medrep);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedrepCodeCheck implements MedrepCodeCheck {
  const _MedrepCodeCheck({required this.ok, this.medrep});
  factory _MedrepCodeCheck.fromJson(Map<String, dynamic> json) => _$MedrepCodeCheckFromJson(json);

@override final  bool ok;
@override final  MedrepCodeOwner? medrep;

/// Create a copy of MedrepCodeCheck
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedrepCodeCheckCopyWith<_MedrepCodeCheck> get copyWith => __$MedrepCodeCheckCopyWithImpl<_MedrepCodeCheck>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedrepCodeCheckToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedrepCodeCheck&&(identical(other.ok, ok) || other.ok == ok)&&(identical(other.medrep, medrep) || other.medrep == medrep));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ok,medrep);

@override
String toString() {
  return 'MedrepCodeCheck(ok: $ok, medrep: $medrep)';
}


}

/// @nodoc
abstract mixin class _$MedrepCodeCheckCopyWith<$Res> implements $MedrepCodeCheckCopyWith<$Res> {
  factory _$MedrepCodeCheckCopyWith(_MedrepCodeCheck value, $Res Function(_MedrepCodeCheck) _then) = __$MedrepCodeCheckCopyWithImpl;
@override @useResult
$Res call({
 bool ok, MedrepCodeOwner? medrep
});


@override $MedrepCodeOwnerCopyWith<$Res>? get medrep;

}
/// @nodoc
class __$MedrepCodeCheckCopyWithImpl<$Res>
    implements _$MedrepCodeCheckCopyWith<$Res> {
  __$MedrepCodeCheckCopyWithImpl(this._self, this._then);

  final _MedrepCodeCheck _self;
  final $Res Function(_MedrepCodeCheck) _then;

/// Create a copy of MedrepCodeCheck
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ok = null,Object? medrep = freezed,}) {
  return _then(_MedrepCodeCheck(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,medrep: freezed == medrep ? _self.medrep : medrep // ignore: cast_nullable_to_non_nullable
as MedrepCodeOwner?,
  ));
}

/// Create a copy of MedrepCodeCheck
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MedrepCodeOwnerCopyWith<$Res>? get medrep {
    if (_self.medrep == null) {
    return null;
  }

  return $MedrepCodeOwnerCopyWith<$Res>(_self.medrep!, (value) {
    return _then(_self.copyWith(medrep: value));
  });
}
}


/// @nodoc
mixin _$TeamTotals {

 int get all; int get doctors; int get pharmacists; int get pending;
/// Create a copy of TeamTotals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamTotalsCopyWith<TeamTotals> get copyWith => _$TeamTotalsCopyWithImpl<TeamTotals>(this as TeamTotals, _$identity);

  /// Serializes this TeamTotals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamTotals&&(identical(other.all, all) || other.all == all)&&(identical(other.doctors, doctors) || other.doctors == doctors)&&(identical(other.pharmacists, pharmacists) || other.pharmacists == pharmacists)&&(identical(other.pending, pending) || other.pending == pending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,all,doctors,pharmacists,pending);

@override
String toString() {
  return 'TeamTotals(all: $all, doctors: $doctors, pharmacists: $pharmacists, pending: $pending)';
}


}

/// @nodoc
abstract mixin class $TeamTotalsCopyWith<$Res>  {
  factory $TeamTotalsCopyWith(TeamTotals value, $Res Function(TeamTotals) _then) = _$TeamTotalsCopyWithImpl;
@useResult
$Res call({
 int all, int doctors, int pharmacists, int pending
});




}
/// @nodoc
class _$TeamTotalsCopyWithImpl<$Res>
    implements $TeamTotalsCopyWith<$Res> {
  _$TeamTotalsCopyWithImpl(this._self, this._then);

  final TeamTotals _self;
  final $Res Function(TeamTotals) _then;

/// Create a copy of TeamTotals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? all = null,Object? doctors = null,Object? pharmacists = null,Object? pending = null,}) {
  return _then(_self.copyWith(
all: null == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as int,doctors: null == doctors ? _self.doctors : doctors // ignore: cast_nullable_to_non_nullable
as int,pharmacists: null == pharmacists ? _self.pharmacists : pharmacists // ignore: cast_nullable_to_non_nullable
as int,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamTotals].
extension TeamTotalsPatterns on TeamTotals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamTotals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamTotals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamTotals value)  $default,){
final _that = this;
switch (_that) {
case _TeamTotals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamTotals value)?  $default,){
final _that = this;
switch (_that) {
case _TeamTotals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int all,  int doctors,  int pharmacists,  int pending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamTotals() when $default != null:
return $default(_that.all,_that.doctors,_that.pharmacists,_that.pending);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int all,  int doctors,  int pharmacists,  int pending)  $default,) {final _that = this;
switch (_that) {
case _TeamTotals():
return $default(_that.all,_that.doctors,_that.pharmacists,_that.pending);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int all,  int doctors,  int pharmacists,  int pending)?  $default,) {final _that = this;
switch (_that) {
case _TeamTotals() when $default != null:
return $default(_that.all,_that.doctors,_that.pharmacists,_that.pending);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamTotals implements TeamTotals {
  const _TeamTotals({this.all = 0, this.doctors = 0, this.pharmacists = 0, this.pending = 0});
  factory _TeamTotals.fromJson(Map<String, dynamic> json) => _$TeamTotalsFromJson(json);

@override@JsonKey() final  int all;
@override@JsonKey() final  int doctors;
@override@JsonKey() final  int pharmacists;
@override@JsonKey() final  int pending;

/// Create a copy of TeamTotals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamTotalsCopyWith<_TeamTotals> get copyWith => __$TeamTotalsCopyWithImpl<_TeamTotals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamTotalsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamTotals&&(identical(other.all, all) || other.all == all)&&(identical(other.doctors, doctors) || other.doctors == doctors)&&(identical(other.pharmacists, pharmacists) || other.pharmacists == pharmacists)&&(identical(other.pending, pending) || other.pending == pending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,all,doctors,pharmacists,pending);

@override
String toString() {
  return 'TeamTotals(all: $all, doctors: $doctors, pharmacists: $pharmacists, pending: $pending)';
}


}

/// @nodoc
abstract mixin class _$TeamTotalsCopyWith<$Res> implements $TeamTotalsCopyWith<$Res> {
  factory _$TeamTotalsCopyWith(_TeamTotals value, $Res Function(_TeamTotals) _then) = __$TeamTotalsCopyWithImpl;
@override @useResult
$Res call({
 int all, int doctors, int pharmacists, int pending
});




}
/// @nodoc
class __$TeamTotalsCopyWithImpl<$Res>
    implements _$TeamTotalsCopyWith<$Res> {
  __$TeamTotalsCopyWithImpl(this._self, this._then);

  final _TeamTotals _self;
  final $Res Function(_TeamTotals) _then;

/// Create a copy of TeamTotals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? all = null,Object? doctors = null,Object? pharmacists = null,Object? pending = null,}) {
  return _then(_TeamTotals(
all: null == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as int,doctors: null == doctors ? _self.doctors : doctors // ignore: cast_nullable_to_non_nullable
as int,pharmacists: null == pharmacists ? _self.pharmacists : pharmacists // ignore: cast_nullable_to_non_nullable
as int,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TeamDoctor {

 int? get accountId; int? get telegramId; String get name; String get specialty; String get workplace; String get city; String get phone; int get recipes; int get approved; String? get lastAt; bool get active; String? get joinedAt;
/// Create a copy of TeamDoctor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamDoctorCopyWith<TeamDoctor> get copyWith => _$TeamDoctorCopyWithImpl<TeamDoctor>(this as TeamDoctor, _$identity);

  /// Serializes this TeamDoctor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamDoctor&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.telegramId, telegramId) || other.telegramId == telegramId)&&(identical(other.name, name) || other.name == name)&&(identical(other.specialty, specialty) || other.specialty == specialty)&&(identical(other.workplace, workplace) || other.workplace == workplace)&&(identical(other.city, city) || other.city == city)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.recipes, recipes) || other.recipes == recipes)&&(identical(other.approved, approved) || other.approved == approved)&&(identical(other.lastAt, lastAt) || other.lastAt == lastAt)&&(identical(other.active, active) || other.active == active)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,telegramId,name,specialty,workplace,city,phone,recipes,approved,lastAt,active,joinedAt);

@override
String toString() {
  return 'TeamDoctor(accountId: $accountId, telegramId: $telegramId, name: $name, specialty: $specialty, workplace: $workplace, city: $city, phone: $phone, recipes: $recipes, approved: $approved, lastAt: $lastAt, active: $active, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class $TeamDoctorCopyWith<$Res>  {
  factory $TeamDoctorCopyWith(TeamDoctor value, $Res Function(TeamDoctor) _then) = _$TeamDoctorCopyWithImpl;
@useResult
$Res call({
 int? accountId, int? telegramId, String name, String specialty, String workplace, String city, String phone, int recipes, int approved, String? lastAt, bool active, String? joinedAt
});




}
/// @nodoc
class _$TeamDoctorCopyWithImpl<$Res>
    implements $TeamDoctorCopyWith<$Res> {
  _$TeamDoctorCopyWithImpl(this._self, this._then);

  final TeamDoctor _self;
  final $Res Function(TeamDoctor) _then;

/// Create a copy of TeamDoctor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = freezed,Object? telegramId = freezed,Object? name = null,Object? specialty = null,Object? workplace = null,Object? city = null,Object? phone = null,Object? recipes = null,Object? approved = null,Object? lastAt = freezed,Object? active = null,Object? joinedAt = freezed,}) {
  return _then(_self.copyWith(
accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,telegramId: freezed == telegramId ? _self.telegramId : telegramId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,specialty: null == specialty ? _self.specialty : specialty // ignore: cast_nullable_to_non_nullable
as String,workplace: null == workplace ? _self.workplace : workplace // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,recipes: null == recipes ? _self.recipes : recipes // ignore: cast_nullable_to_non_nullable
as int,approved: null == approved ? _self.approved : approved // ignore: cast_nullable_to_non_nullable
as int,lastAt: freezed == lastAt ? _self.lastAt : lastAt // ignore: cast_nullable_to_non_nullable
as String?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,joinedAt: freezed == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamDoctor].
extension TeamDoctorPatterns on TeamDoctor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamDoctor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamDoctor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamDoctor value)  $default,){
final _that = this;
switch (_that) {
case _TeamDoctor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamDoctor value)?  $default,){
final _that = this;
switch (_that) {
case _TeamDoctor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? accountId,  int? telegramId,  String name,  String specialty,  String workplace,  String city,  String phone,  int recipes,  int approved,  String? lastAt,  bool active,  String? joinedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamDoctor() when $default != null:
return $default(_that.accountId,_that.telegramId,_that.name,_that.specialty,_that.workplace,_that.city,_that.phone,_that.recipes,_that.approved,_that.lastAt,_that.active,_that.joinedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? accountId,  int? telegramId,  String name,  String specialty,  String workplace,  String city,  String phone,  int recipes,  int approved,  String? lastAt,  bool active,  String? joinedAt)  $default,) {final _that = this;
switch (_that) {
case _TeamDoctor():
return $default(_that.accountId,_that.telegramId,_that.name,_that.specialty,_that.workplace,_that.city,_that.phone,_that.recipes,_that.approved,_that.lastAt,_that.active,_that.joinedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? accountId,  int? telegramId,  String name,  String specialty,  String workplace,  String city,  String phone,  int recipes,  int approved,  String? lastAt,  bool active,  String? joinedAt)?  $default,) {final _that = this;
switch (_that) {
case _TeamDoctor() when $default != null:
return $default(_that.accountId,_that.telegramId,_that.name,_that.specialty,_that.workplace,_that.city,_that.phone,_that.recipes,_that.approved,_that.lastAt,_that.active,_that.joinedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamDoctor implements TeamDoctor {
  const _TeamDoctor({this.accountId, this.telegramId, required this.name, this.specialty = '', this.workplace = '', this.city = '', this.phone = '', this.recipes = 0, this.approved = 0, this.lastAt, this.active = false, this.joinedAt});
  factory _TeamDoctor.fromJson(Map<String, dynamic> json) => _$TeamDoctorFromJson(json);

@override final  int? accountId;
@override final  int? telegramId;
@override final  String name;
@override@JsonKey() final  String specialty;
@override@JsonKey() final  String workplace;
@override@JsonKey() final  String city;
@override@JsonKey() final  String phone;
@override@JsonKey() final  int recipes;
@override@JsonKey() final  int approved;
@override final  String? lastAt;
@override@JsonKey() final  bool active;
@override final  String? joinedAt;

/// Create a copy of TeamDoctor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamDoctorCopyWith<_TeamDoctor> get copyWith => __$TeamDoctorCopyWithImpl<_TeamDoctor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamDoctorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamDoctor&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.telegramId, telegramId) || other.telegramId == telegramId)&&(identical(other.name, name) || other.name == name)&&(identical(other.specialty, specialty) || other.specialty == specialty)&&(identical(other.workplace, workplace) || other.workplace == workplace)&&(identical(other.city, city) || other.city == city)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.recipes, recipes) || other.recipes == recipes)&&(identical(other.approved, approved) || other.approved == approved)&&(identical(other.lastAt, lastAt) || other.lastAt == lastAt)&&(identical(other.active, active) || other.active == active)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,telegramId,name,specialty,workplace,city,phone,recipes,approved,lastAt,active,joinedAt);

@override
String toString() {
  return 'TeamDoctor(accountId: $accountId, telegramId: $telegramId, name: $name, specialty: $specialty, workplace: $workplace, city: $city, phone: $phone, recipes: $recipes, approved: $approved, lastAt: $lastAt, active: $active, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class _$TeamDoctorCopyWith<$Res> implements $TeamDoctorCopyWith<$Res> {
  factory _$TeamDoctorCopyWith(_TeamDoctor value, $Res Function(_TeamDoctor) _then) = __$TeamDoctorCopyWithImpl;
@override @useResult
$Res call({
 int? accountId, int? telegramId, String name, String specialty, String workplace, String city, String phone, int recipes, int approved, String? lastAt, bool active, String? joinedAt
});




}
/// @nodoc
class __$TeamDoctorCopyWithImpl<$Res>
    implements _$TeamDoctorCopyWith<$Res> {
  __$TeamDoctorCopyWithImpl(this._self, this._then);

  final _TeamDoctor _self;
  final $Res Function(_TeamDoctor) _then;

/// Create a copy of TeamDoctor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = freezed,Object? telegramId = freezed,Object? name = null,Object? specialty = null,Object? workplace = null,Object? city = null,Object? phone = null,Object? recipes = null,Object? approved = null,Object? lastAt = freezed,Object? active = null,Object? joinedAt = freezed,}) {
  return _then(_TeamDoctor(
accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,telegramId: freezed == telegramId ? _self.telegramId : telegramId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,specialty: null == specialty ? _self.specialty : specialty // ignore: cast_nullable_to_non_nullable
as String,workplace: null == workplace ? _self.workplace : workplace // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,recipes: null == recipes ? _self.recipes : recipes // ignore: cast_nullable_to_non_nullable
as int,approved: null == approved ? _self.approved : approved // ignore: cast_nullable_to_non_nullable
as int,lastAt: freezed == lastAt ? _self.lastAt : lastAt // ignore: cast_nullable_to_non_nullable
as String?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,joinedAt: freezed == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TeamPharmacist {

 int? get telegramId; int? get accountId; String get name; String get shop; String get city; int get checks; int get quests; String? get lastAt; bool get active;
/// Create a copy of TeamPharmacist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamPharmacistCopyWith<TeamPharmacist> get copyWith => _$TeamPharmacistCopyWithImpl<TeamPharmacist>(this as TeamPharmacist, _$identity);

  /// Serializes this TeamPharmacist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamPharmacist&&(identical(other.telegramId, telegramId) || other.telegramId == telegramId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.name, name) || other.name == name)&&(identical(other.shop, shop) || other.shop == shop)&&(identical(other.city, city) || other.city == city)&&(identical(other.checks, checks) || other.checks == checks)&&(identical(other.quests, quests) || other.quests == quests)&&(identical(other.lastAt, lastAt) || other.lastAt == lastAt)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,telegramId,accountId,name,shop,city,checks,quests,lastAt,active);

@override
String toString() {
  return 'TeamPharmacist(telegramId: $telegramId, accountId: $accountId, name: $name, shop: $shop, city: $city, checks: $checks, quests: $quests, lastAt: $lastAt, active: $active)';
}


}

/// @nodoc
abstract mixin class $TeamPharmacistCopyWith<$Res>  {
  factory $TeamPharmacistCopyWith(TeamPharmacist value, $Res Function(TeamPharmacist) _then) = _$TeamPharmacistCopyWithImpl;
@useResult
$Res call({
 int? telegramId, int? accountId, String name, String shop, String city, int checks, int quests, String? lastAt, bool active
});




}
/// @nodoc
class _$TeamPharmacistCopyWithImpl<$Res>
    implements $TeamPharmacistCopyWith<$Res> {
  _$TeamPharmacistCopyWithImpl(this._self, this._then);

  final TeamPharmacist _self;
  final $Res Function(TeamPharmacist) _then;

/// Create a copy of TeamPharmacist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? telegramId = freezed,Object? accountId = freezed,Object? name = null,Object? shop = null,Object? city = null,Object? checks = null,Object? quests = null,Object? lastAt = freezed,Object? active = null,}) {
  return _then(_self.copyWith(
telegramId: freezed == telegramId ? _self.telegramId : telegramId // ignore: cast_nullable_to_non_nullable
as int?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shop: null == shop ? _self.shop : shop // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,checks: null == checks ? _self.checks : checks // ignore: cast_nullable_to_non_nullable
as int,quests: null == quests ? _self.quests : quests // ignore: cast_nullable_to_non_nullable
as int,lastAt: freezed == lastAt ? _self.lastAt : lastAt // ignore: cast_nullable_to_non_nullable
as String?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamPharmacist].
extension TeamPharmacistPatterns on TeamPharmacist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamPharmacist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamPharmacist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamPharmacist value)  $default,){
final _that = this;
switch (_that) {
case _TeamPharmacist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamPharmacist value)?  $default,){
final _that = this;
switch (_that) {
case _TeamPharmacist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? telegramId,  int? accountId,  String name,  String shop,  String city,  int checks,  int quests,  String? lastAt,  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamPharmacist() when $default != null:
return $default(_that.telegramId,_that.accountId,_that.name,_that.shop,_that.city,_that.checks,_that.quests,_that.lastAt,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? telegramId,  int? accountId,  String name,  String shop,  String city,  int checks,  int quests,  String? lastAt,  bool active)  $default,) {final _that = this;
switch (_that) {
case _TeamPharmacist():
return $default(_that.telegramId,_that.accountId,_that.name,_that.shop,_that.city,_that.checks,_that.quests,_that.lastAt,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? telegramId,  int? accountId,  String name,  String shop,  String city,  int checks,  int quests,  String? lastAt,  bool active)?  $default,) {final _that = this;
switch (_that) {
case _TeamPharmacist() when $default != null:
return $default(_that.telegramId,_that.accountId,_that.name,_that.shop,_that.city,_that.checks,_that.quests,_that.lastAt,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamPharmacist implements TeamPharmacist {
  const _TeamPharmacist({this.telegramId, this.accountId, required this.name, this.shop = '', this.city = '', this.checks = 0, this.quests = 0, this.lastAt, this.active = false});
  factory _TeamPharmacist.fromJson(Map<String, dynamic> json) => _$TeamPharmacistFromJson(json);

@override final  int? telegramId;
@override final  int? accountId;
@override final  String name;
@override@JsonKey() final  String shop;
@override@JsonKey() final  String city;
@override@JsonKey() final  int checks;
@override@JsonKey() final  int quests;
@override final  String? lastAt;
@override@JsonKey() final  bool active;

/// Create a copy of TeamPharmacist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamPharmacistCopyWith<_TeamPharmacist> get copyWith => __$TeamPharmacistCopyWithImpl<_TeamPharmacist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamPharmacistToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamPharmacist&&(identical(other.telegramId, telegramId) || other.telegramId == telegramId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.name, name) || other.name == name)&&(identical(other.shop, shop) || other.shop == shop)&&(identical(other.city, city) || other.city == city)&&(identical(other.checks, checks) || other.checks == checks)&&(identical(other.quests, quests) || other.quests == quests)&&(identical(other.lastAt, lastAt) || other.lastAt == lastAt)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,telegramId,accountId,name,shop,city,checks,quests,lastAt,active);

@override
String toString() {
  return 'TeamPharmacist(telegramId: $telegramId, accountId: $accountId, name: $name, shop: $shop, city: $city, checks: $checks, quests: $quests, lastAt: $lastAt, active: $active)';
}


}

/// @nodoc
abstract mixin class _$TeamPharmacistCopyWith<$Res> implements $TeamPharmacistCopyWith<$Res> {
  factory _$TeamPharmacistCopyWith(_TeamPharmacist value, $Res Function(_TeamPharmacist) _then) = __$TeamPharmacistCopyWithImpl;
@override @useResult
$Res call({
 int? telegramId, int? accountId, String name, String shop, String city, int checks, int quests, String? lastAt, bool active
});




}
/// @nodoc
class __$TeamPharmacistCopyWithImpl<$Res>
    implements _$TeamPharmacistCopyWith<$Res> {
  __$TeamPharmacistCopyWithImpl(this._self, this._then);

  final _TeamPharmacist _self;
  final $Res Function(_TeamPharmacist) _then;

/// Create a copy of TeamPharmacist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? telegramId = freezed,Object? accountId = freezed,Object? name = null,Object? shop = null,Object? city = null,Object? checks = null,Object? quests = null,Object? lastAt = freezed,Object? active = null,}) {
  return _then(_TeamPharmacist(
telegramId: freezed == telegramId ? _self.telegramId : telegramId // ignore: cast_nullable_to_non_nullable
as int?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shop: null == shop ? _self.shop : shop // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,checks: null == checks ? _self.checks : checks // ignore: cast_nullable_to_non_nullable
as int,quests: null == quests ? _self.quests : quests // ignore: cast_nullable_to_non_nullable
as int,lastAt: freezed == lastAt ? _self.lastAt : lastAt // ignore: cast_nullable_to_non_nullable
as String?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$MedrepTeam {

 TeamTotals get totals; List<TeamDoctor> get doctors; List<TeamPharmacist> get pharmacists;
/// Create a copy of MedrepTeam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedrepTeamCopyWith<MedrepTeam> get copyWith => _$MedrepTeamCopyWithImpl<MedrepTeam>(this as MedrepTeam, _$identity);

  /// Serializes this MedrepTeam to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedrepTeam&&(identical(other.totals, totals) || other.totals == totals)&&const DeepCollectionEquality().equals(other.doctors, doctors)&&const DeepCollectionEquality().equals(other.pharmacists, pharmacists));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totals,const DeepCollectionEquality().hash(doctors),const DeepCollectionEquality().hash(pharmacists));

@override
String toString() {
  return 'MedrepTeam(totals: $totals, doctors: $doctors, pharmacists: $pharmacists)';
}


}

/// @nodoc
abstract mixin class $MedrepTeamCopyWith<$Res>  {
  factory $MedrepTeamCopyWith(MedrepTeam value, $Res Function(MedrepTeam) _then) = _$MedrepTeamCopyWithImpl;
@useResult
$Res call({
 TeamTotals totals, List<TeamDoctor> doctors, List<TeamPharmacist> pharmacists
});


$TeamTotalsCopyWith<$Res> get totals;

}
/// @nodoc
class _$MedrepTeamCopyWithImpl<$Res>
    implements $MedrepTeamCopyWith<$Res> {
  _$MedrepTeamCopyWithImpl(this._self, this._then);

  final MedrepTeam _self;
  final $Res Function(MedrepTeam) _then;

/// Create a copy of MedrepTeam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totals = null,Object? doctors = null,Object? pharmacists = null,}) {
  return _then(_self.copyWith(
totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as TeamTotals,doctors: null == doctors ? _self.doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<TeamDoctor>,pharmacists: null == pharmacists ? _self.pharmacists : pharmacists // ignore: cast_nullable_to_non_nullable
as List<TeamPharmacist>,
  ));
}
/// Create a copy of MedrepTeam
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamTotalsCopyWith<$Res> get totals {
  
  return $TeamTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// Adds pattern-matching-related methods to [MedrepTeam].
extension MedrepTeamPatterns on MedrepTeam {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedrepTeam value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedrepTeam() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedrepTeam value)  $default,){
final _that = this;
switch (_that) {
case _MedrepTeam():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedrepTeam value)?  $default,){
final _that = this;
switch (_that) {
case _MedrepTeam() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TeamTotals totals,  List<TeamDoctor> doctors,  List<TeamPharmacist> pharmacists)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedrepTeam() when $default != null:
return $default(_that.totals,_that.doctors,_that.pharmacists);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TeamTotals totals,  List<TeamDoctor> doctors,  List<TeamPharmacist> pharmacists)  $default,) {final _that = this;
switch (_that) {
case _MedrepTeam():
return $default(_that.totals,_that.doctors,_that.pharmacists);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TeamTotals totals,  List<TeamDoctor> doctors,  List<TeamPharmacist> pharmacists)?  $default,) {final _that = this;
switch (_that) {
case _MedrepTeam() when $default != null:
return $default(_that.totals,_that.doctors,_that.pharmacists);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedrepTeam implements MedrepTeam {
  const _MedrepTeam({this.totals = const TeamTotals(), final  List<TeamDoctor> doctors = const [], final  List<TeamPharmacist> pharmacists = const []}): _doctors = doctors,_pharmacists = pharmacists;
  factory _MedrepTeam.fromJson(Map<String, dynamic> json) => _$MedrepTeamFromJson(json);

@override@JsonKey() final  TeamTotals totals;
 final  List<TeamDoctor> _doctors;
@override@JsonKey() List<TeamDoctor> get doctors {
  if (_doctors is EqualUnmodifiableListView) return _doctors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_doctors);
}

 final  List<TeamPharmacist> _pharmacists;
@override@JsonKey() List<TeamPharmacist> get pharmacists {
  if (_pharmacists is EqualUnmodifiableListView) return _pharmacists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pharmacists);
}


/// Create a copy of MedrepTeam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedrepTeamCopyWith<_MedrepTeam> get copyWith => __$MedrepTeamCopyWithImpl<_MedrepTeam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedrepTeamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedrepTeam&&(identical(other.totals, totals) || other.totals == totals)&&const DeepCollectionEquality().equals(other._doctors, _doctors)&&const DeepCollectionEquality().equals(other._pharmacists, _pharmacists));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totals,const DeepCollectionEquality().hash(_doctors),const DeepCollectionEquality().hash(_pharmacists));

@override
String toString() {
  return 'MedrepTeam(totals: $totals, doctors: $doctors, pharmacists: $pharmacists)';
}


}

/// @nodoc
abstract mixin class _$MedrepTeamCopyWith<$Res> implements $MedrepTeamCopyWith<$Res> {
  factory _$MedrepTeamCopyWith(_MedrepTeam value, $Res Function(_MedrepTeam) _then) = __$MedrepTeamCopyWithImpl;
@override @useResult
$Res call({
 TeamTotals totals, List<TeamDoctor> doctors, List<TeamPharmacist> pharmacists
});


@override $TeamTotalsCopyWith<$Res> get totals;

}
/// @nodoc
class __$MedrepTeamCopyWithImpl<$Res>
    implements _$MedrepTeamCopyWith<$Res> {
  __$MedrepTeamCopyWithImpl(this._self, this._then);

  final _MedrepTeam _self;
  final $Res Function(_MedrepTeam) _then;

/// Create a copy of MedrepTeam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totals = null,Object? doctors = null,Object? pharmacists = null,}) {
  return _then(_MedrepTeam(
totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as TeamTotals,doctors: null == doctors ? _self._doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<TeamDoctor>,pharmacists: null == pharmacists ? _self._pharmacists : pharmacists // ignore: cast_nullable_to_non_nullable
as List<TeamPharmacist>,
  ));
}

/// Create a copy of MedrepTeam
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamTotalsCopyWith<$Res> get totals {
  
  return $TeamTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}

// dart format on
