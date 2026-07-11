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

 int get id; String get name; String get phone; String? get shop; String get requestedAt;
/// Create a copy of PendingReferral
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingReferralCopyWith<PendingReferral> get copyWith => _$PendingReferralCopyWithImpl<PendingReferral>(this as PendingReferral, _$identity);

  /// Serializes this PendingReferral to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingReferral&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.shop, shop) || other.shop == shop)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,shop,requestedAt);

@override
String toString() {
  return 'PendingReferral(id: $id, name: $name, phone: $phone, shop: $shop, requestedAt: $requestedAt)';
}


}

/// @nodoc
abstract mixin class $PendingReferralCopyWith<$Res>  {
  factory $PendingReferralCopyWith(PendingReferral value, $Res Function(PendingReferral) _then) = _$PendingReferralCopyWithImpl;
@useResult
$Res call({
 int id, String name, String phone, String? shop, String requestedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? shop = freezed,Object? requestedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,shop: freezed == shop ? _self.shop : shop // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String phone,  String? shop,  String requestedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PendingReferral() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.shop,_that.requestedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String phone,  String? shop,  String requestedAt)  $default,) {final _that = this;
switch (_that) {
case _PendingReferral():
return $default(_that.id,_that.name,_that.phone,_that.shop,_that.requestedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String phone,  String? shop,  String requestedAt)?  $default,) {final _that = this;
switch (_that) {
case _PendingReferral() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.shop,_that.requestedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PendingReferral implements PendingReferral {
  const _PendingReferral({required this.id, required this.name, required this.phone, this.shop, required this.requestedAt});
  factory _PendingReferral.fromJson(Map<String, dynamic> json) => _$PendingReferralFromJson(json);

@override final  int id;
@override final  String name;
@override final  String phone;
@override final  String? shop;
@override final  String requestedAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PendingReferral&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.shop, shop) || other.shop == shop)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,shop,requestedAt);

@override
String toString() {
  return 'PendingReferral(id: $id, name: $name, phone: $phone, shop: $shop, requestedAt: $requestedAt)';
}


}

/// @nodoc
abstract mixin class _$PendingReferralCopyWith<$Res> implements $PendingReferralCopyWith<$Res> {
  factory _$PendingReferralCopyWith(_PendingReferral value, $Res Function(_PendingReferral) _then) = __$PendingReferralCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String phone, String? shop, String requestedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? shop = freezed,Object? requestedAt = null,}) {
  return _then(_PendingReferral(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,shop: freezed == shop ? _self.shop : shop // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RecentCheck {

 int get id; String get createdAt; CheckStatus get status; int get packs;
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
 int id, String createdAt, CheckStatus status, int packs
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String createdAt,  CheckStatus status,  int packs)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String createdAt,  CheckStatus status,  int packs)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String createdAt,  CheckStatus status,  int packs)?  $default,) {final _that = this;
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
  const _RecentCheck({required this.id, required this.createdAt, required this.status, required this.packs});
  factory _RecentCheck.fromJson(Map<String, dynamic> json) => _$RecentCheckFromJson(json);

@override final  int id;
@override final  String createdAt;
@override final  CheckStatus status;
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
 int id, String createdAt, CheckStatus status, int packs
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

// dart format on
