// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SegmentPart {

 int get count; double get pct;
/// Create a copy of SegmentPart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentPartCopyWith<SegmentPart> get copyWith => _$SegmentPartCopyWithImpl<SegmentPart>(this as SegmentPart, _$identity);

  /// Serializes this SegmentPart to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SegmentPart&&(identical(other.count, count) || other.count == count)&&(identical(other.pct, pct) || other.pct == pct));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,pct);

@override
String toString() {
  return 'SegmentPart(count: $count, pct: $pct)';
}


}

/// @nodoc
abstract mixin class $SegmentPartCopyWith<$Res>  {
  factory $SegmentPartCopyWith(SegmentPart value, $Res Function(SegmentPart) _then) = _$SegmentPartCopyWithImpl;
@useResult
$Res call({
 int count, double pct
});




}
/// @nodoc
class _$SegmentPartCopyWithImpl<$Res>
    implements $SegmentPartCopyWith<$Res> {
  _$SegmentPartCopyWithImpl(this._self, this._then);

  final SegmentPart _self;
  final $Res Function(SegmentPart) _then;

/// Create a copy of SegmentPart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? pct = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,pct: null == pct ? _self.pct : pct // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SegmentPart].
extension SegmentPartPatterns on SegmentPart {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SegmentPart value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SegmentPart() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SegmentPart value)  $default,){
final _that = this;
switch (_that) {
case _SegmentPart():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SegmentPart value)?  $default,){
final _that = this;
switch (_that) {
case _SegmentPart() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  double pct)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SegmentPart() when $default != null:
return $default(_that.count,_that.pct);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  double pct)  $default,) {final _that = this;
switch (_that) {
case _SegmentPart():
return $default(_that.count,_that.pct);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  double pct)?  $default,) {final _that = this;
switch (_that) {
case _SegmentPart() when $default != null:
return $default(_that.count,_that.pct);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SegmentPart implements SegmentPart {
  const _SegmentPart({required this.count, required this.pct});
  factory _SegmentPart.fromJson(Map<String, dynamic> json) => _$SegmentPartFromJson(json);

@override final  int count;
@override final  double pct;

/// Create a copy of SegmentPart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SegmentPartCopyWith<_SegmentPart> get copyWith => __$SegmentPartCopyWithImpl<_SegmentPart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SegmentPartToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SegmentPart&&(identical(other.count, count) || other.count == count)&&(identical(other.pct, pct) || other.pct == pct));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,pct);

@override
String toString() {
  return 'SegmentPart(count: $count, pct: $pct)';
}


}

/// @nodoc
abstract mixin class _$SegmentPartCopyWith<$Res> implements $SegmentPartCopyWith<$Res> {
  factory _$SegmentPartCopyWith(_SegmentPart value, $Res Function(_SegmentPart) _then) = __$SegmentPartCopyWithImpl;
@override @useResult
$Res call({
 int count, double pct
});




}
/// @nodoc
class __$SegmentPartCopyWithImpl<$Res>
    implements _$SegmentPartCopyWith<$Res> {
  __$SegmentPartCopyWithImpl(this._self, this._then);

  final _SegmentPart _self;
  final $Res Function(_SegmentPart) _then;

/// Create a copy of SegmentPart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? pct = null,}) {
  return _then(_SegmentPart(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,pct: null == pct ? _self.pct : pct // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$BrandSegment {

 SegmentPart get retail; SegmentPart get chain;
/// Create a copy of BrandSegment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandSegmentCopyWith<BrandSegment> get copyWith => _$BrandSegmentCopyWithImpl<BrandSegment>(this as BrandSegment, _$identity);

  /// Serializes this BrandSegment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandSegment&&(identical(other.retail, retail) || other.retail == retail)&&(identical(other.chain, chain) || other.chain == chain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,retail,chain);

@override
String toString() {
  return 'BrandSegment(retail: $retail, chain: $chain)';
}


}

/// @nodoc
abstract mixin class $BrandSegmentCopyWith<$Res>  {
  factory $BrandSegmentCopyWith(BrandSegment value, $Res Function(BrandSegment) _then) = _$BrandSegmentCopyWithImpl;
@useResult
$Res call({
 SegmentPart retail, SegmentPart chain
});


$SegmentPartCopyWith<$Res> get retail;$SegmentPartCopyWith<$Res> get chain;

}
/// @nodoc
class _$BrandSegmentCopyWithImpl<$Res>
    implements $BrandSegmentCopyWith<$Res> {
  _$BrandSegmentCopyWithImpl(this._self, this._then);

  final BrandSegment _self;
  final $Res Function(BrandSegment) _then;

/// Create a copy of BrandSegment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? retail = null,Object? chain = null,}) {
  return _then(_self.copyWith(
retail: null == retail ? _self.retail : retail // ignore: cast_nullable_to_non_nullable
as SegmentPart,chain: null == chain ? _self.chain : chain // ignore: cast_nullable_to_non_nullable
as SegmentPart,
  ));
}
/// Create a copy of BrandSegment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SegmentPartCopyWith<$Res> get retail {
  
  return $SegmentPartCopyWith<$Res>(_self.retail, (value) {
    return _then(_self.copyWith(retail: value));
  });
}/// Create a copy of BrandSegment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SegmentPartCopyWith<$Res> get chain {
  
  return $SegmentPartCopyWith<$Res>(_self.chain, (value) {
    return _then(_self.copyWith(chain: value));
  });
}
}


/// Adds pattern-matching-related methods to [BrandSegment].
extension BrandSegmentPatterns on BrandSegment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BrandSegment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrandSegment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BrandSegment value)  $default,){
final _that = this;
switch (_that) {
case _BrandSegment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BrandSegment value)?  $default,){
final _that = this;
switch (_that) {
case _BrandSegment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SegmentPart retail,  SegmentPart chain)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrandSegment() when $default != null:
return $default(_that.retail,_that.chain);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SegmentPart retail,  SegmentPart chain)  $default,) {final _that = this;
switch (_that) {
case _BrandSegment():
return $default(_that.retail,_that.chain);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SegmentPart retail,  SegmentPart chain)?  $default,) {final _that = this;
switch (_that) {
case _BrandSegment() when $default != null:
return $default(_that.retail,_that.chain);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BrandSegment implements BrandSegment {
  const _BrandSegment({required this.retail, required this.chain});
  factory _BrandSegment.fromJson(Map<String, dynamic> json) => _$BrandSegmentFromJson(json);

@override final  SegmentPart retail;
@override final  SegmentPart chain;

/// Create a copy of BrandSegment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrandSegmentCopyWith<_BrandSegment> get copyWith => __$BrandSegmentCopyWithImpl<_BrandSegment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrandSegmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrandSegment&&(identical(other.retail, retail) || other.retail == retail)&&(identical(other.chain, chain) || other.chain == chain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,retail,chain);

@override
String toString() {
  return 'BrandSegment(retail: $retail, chain: $chain)';
}


}

/// @nodoc
abstract mixin class _$BrandSegmentCopyWith<$Res> implements $BrandSegmentCopyWith<$Res> {
  factory _$BrandSegmentCopyWith(_BrandSegment value, $Res Function(_BrandSegment) _then) = __$BrandSegmentCopyWithImpl;
@override @useResult
$Res call({
 SegmentPart retail, SegmentPart chain
});


@override $SegmentPartCopyWith<$Res> get retail;@override $SegmentPartCopyWith<$Res> get chain;

}
/// @nodoc
class __$BrandSegmentCopyWithImpl<$Res>
    implements _$BrandSegmentCopyWith<$Res> {
  __$BrandSegmentCopyWithImpl(this._self, this._then);

  final _BrandSegment _self;
  final $Res Function(_BrandSegment) _then;

/// Create a copy of BrandSegment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? retail = null,Object? chain = null,}) {
  return _then(_BrandSegment(
retail: null == retail ? _self.retail : retail // ignore: cast_nullable_to_non_nullable
as SegmentPart,chain: null == chain ? _self.chain : chain // ignore: cast_nullable_to_non_nullable
as SegmentPart,
  ));
}

/// Create a copy of BrandSegment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SegmentPartCopyWith<$Res> get retail {
  
  return $SegmentPartCopyWith<$Res>(_self.retail, (value) {
    return _then(_self.copyWith(retail: value));
  });
}/// Create a copy of BrandSegment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SegmentPartCopyWith<$Res> get chain {
  
  return $SegmentPartCopyWith<$Res>(_self.chain, (value) {
    return _then(_self.copyWith(chain: value));
  });
}
}


/// @nodoc
mixin _$RegionStat {

 String get region; int get value;
/// Create a copy of RegionStat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegionStatCopyWith<RegionStat> get copyWith => _$RegionStatCopyWithImpl<RegionStat>(this as RegionStat, _$identity);

  /// Serializes this RegionStat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegionStat&&(identical(other.region, region) || other.region == region)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,region,value);

@override
String toString() {
  return 'RegionStat(region: $region, value: $value)';
}


}

/// @nodoc
abstract mixin class $RegionStatCopyWith<$Res>  {
  factory $RegionStatCopyWith(RegionStat value, $Res Function(RegionStat) _then) = _$RegionStatCopyWithImpl;
@useResult
$Res call({
 String region, int value
});




}
/// @nodoc
class _$RegionStatCopyWithImpl<$Res>
    implements $RegionStatCopyWith<$Res> {
  _$RegionStatCopyWithImpl(this._self, this._then);

  final RegionStat _self;
  final $Res Function(RegionStat) _then;

/// Create a copy of RegionStat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? region = null,Object? value = null,}) {
  return _then(_self.copyWith(
region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RegionStat].
extension RegionStatPatterns on RegionStat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegionStat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegionStat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegionStat value)  $default,){
final _that = this;
switch (_that) {
case _RegionStat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegionStat value)?  $default,){
final _that = this;
switch (_that) {
case _RegionStat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String region,  int value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegionStat() when $default != null:
return $default(_that.region,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String region,  int value)  $default,) {final _that = this;
switch (_that) {
case _RegionStat():
return $default(_that.region,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String region,  int value)?  $default,) {final _that = this;
switch (_that) {
case _RegionStat() when $default != null:
return $default(_that.region,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegionStat implements RegionStat {
  const _RegionStat({required this.region, required this.value});
  factory _RegionStat.fromJson(Map<String, dynamic> json) => _$RegionStatFromJson(json);

@override final  String region;
@override final  int value;

/// Create a copy of RegionStat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegionStatCopyWith<_RegionStat> get copyWith => __$RegionStatCopyWithImpl<_RegionStat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegionStatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegionStat&&(identical(other.region, region) || other.region == region)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,region,value);

@override
String toString() {
  return 'RegionStat(region: $region, value: $value)';
}


}

/// @nodoc
abstract mixin class _$RegionStatCopyWith<$Res> implements $RegionStatCopyWith<$Res> {
  factory _$RegionStatCopyWith(_RegionStat value, $Res Function(_RegionStat) _then) = __$RegionStatCopyWithImpl;
@override @useResult
$Res call({
 String region, int value
});




}
/// @nodoc
class __$RegionStatCopyWithImpl<$Res>
    implements _$RegionStatCopyWith<$Res> {
  __$RegionStatCopyWithImpl(this._self, this._then);

  final _RegionStat _self;
  final $Res Function(_RegionStat) _then;

/// Create a copy of RegionStat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? region = null,Object? value = null,}) {
  return _then(_RegionStat(
region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TopProduct {

 String get name; int get total;
/// Create a copy of TopProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopProductCopyWith<TopProduct> get copyWith => _$TopProductCopyWithImpl<TopProduct>(this as TopProduct, _$identity);

  /// Serializes this TopProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopProduct&&(identical(other.name, name) || other.name == name)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,total);

@override
String toString() {
  return 'TopProduct(name: $name, total: $total)';
}


}

/// @nodoc
abstract mixin class $TopProductCopyWith<$Res>  {
  factory $TopProductCopyWith(TopProduct value, $Res Function(TopProduct) _then) = _$TopProductCopyWithImpl;
@useResult
$Res call({
 String name, int total
});




}
/// @nodoc
class _$TopProductCopyWithImpl<$Res>
    implements $TopProductCopyWith<$Res> {
  _$TopProductCopyWithImpl(this._self, this._then);

  final TopProduct _self;
  final $Res Function(TopProduct) _then;

/// Create a copy of TopProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? total = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TopProduct].
extension TopProductPatterns on TopProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopProduct() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopProduct value)  $default,){
final _that = this;
switch (_that) {
case _TopProduct():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopProduct value)?  $default,){
final _that = this;
switch (_that) {
case _TopProduct() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopProduct() when $default != null:
return $default(_that.name,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int total)  $default,) {final _that = this;
switch (_that) {
case _TopProduct():
return $default(_that.name,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int total)?  $default,) {final _that = this;
switch (_that) {
case _TopProduct() when $default != null:
return $default(_that.name,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopProduct implements TopProduct {
  const _TopProduct({required this.name, required this.total});
  factory _TopProduct.fromJson(Map<String, dynamic> json) => _$TopProductFromJson(json);

@override final  String name;
@override final  int total;

/// Create a copy of TopProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopProductCopyWith<_TopProduct> get copyWith => __$TopProductCopyWithImpl<_TopProduct>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopProduct&&(identical(other.name, name) || other.name == name)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,total);

@override
String toString() {
  return 'TopProduct(name: $name, total: $total)';
}


}

/// @nodoc
abstract mixin class _$TopProductCopyWith<$Res> implements $TopProductCopyWith<$Res> {
  factory _$TopProductCopyWith(_TopProduct value, $Res Function(_TopProduct) _then) = __$TopProductCopyWithImpl;
@override @useResult
$Res call({
 String name, int total
});




}
/// @nodoc
class __$TopProductCopyWithImpl<$Res>
    implements _$TopProductCopyWith<$Res> {
  __$TopProductCopyWithImpl(this._self, this._then);

  final _TopProduct _self;
  final $Res Function(_TopProduct) _then;

/// Create a copy of TopProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? total = null,}) {
  return _then(_TopProduct(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$BrandDashboard {

 int get checksTotal; int get packsTotal; int get activeQuests; int get participants; List<TopProduct> get topProducts; List<TopSeller> get topSellers; BrandSegment get segmentation; List<RegionStat> get regions;
/// Create a copy of BrandDashboard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandDashboardCopyWith<BrandDashboard> get copyWith => _$BrandDashboardCopyWithImpl<BrandDashboard>(this as BrandDashboard, _$identity);

  /// Serializes this BrandDashboard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandDashboard&&(identical(other.checksTotal, checksTotal) || other.checksTotal == checksTotal)&&(identical(other.packsTotal, packsTotal) || other.packsTotal == packsTotal)&&(identical(other.activeQuests, activeQuests) || other.activeQuests == activeQuests)&&(identical(other.participants, participants) || other.participants == participants)&&const DeepCollectionEquality().equals(other.topProducts, topProducts)&&const DeepCollectionEquality().equals(other.topSellers, topSellers)&&(identical(other.segmentation, segmentation) || other.segmentation == segmentation)&&const DeepCollectionEquality().equals(other.regions, regions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,checksTotal,packsTotal,activeQuests,participants,const DeepCollectionEquality().hash(topProducts),const DeepCollectionEquality().hash(topSellers),segmentation,const DeepCollectionEquality().hash(regions));

@override
String toString() {
  return 'BrandDashboard(checksTotal: $checksTotal, packsTotal: $packsTotal, activeQuests: $activeQuests, participants: $participants, topProducts: $topProducts, topSellers: $topSellers, segmentation: $segmentation, regions: $regions)';
}


}

/// @nodoc
abstract mixin class $BrandDashboardCopyWith<$Res>  {
  factory $BrandDashboardCopyWith(BrandDashboard value, $Res Function(BrandDashboard) _then) = _$BrandDashboardCopyWithImpl;
@useResult
$Res call({
 int checksTotal, int packsTotal, int activeQuests, int participants, List<TopProduct> topProducts, List<TopSeller> topSellers, BrandSegment segmentation, List<RegionStat> regions
});


$BrandSegmentCopyWith<$Res> get segmentation;

}
/// @nodoc
class _$BrandDashboardCopyWithImpl<$Res>
    implements $BrandDashboardCopyWith<$Res> {
  _$BrandDashboardCopyWithImpl(this._self, this._then);

  final BrandDashboard _self;
  final $Res Function(BrandDashboard) _then;

/// Create a copy of BrandDashboard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? checksTotal = null,Object? packsTotal = null,Object? activeQuests = null,Object? participants = null,Object? topProducts = null,Object? topSellers = null,Object? segmentation = null,Object? regions = null,}) {
  return _then(_self.copyWith(
checksTotal: null == checksTotal ? _self.checksTotal : checksTotal // ignore: cast_nullable_to_non_nullable
as int,packsTotal: null == packsTotal ? _self.packsTotal : packsTotal // ignore: cast_nullable_to_non_nullable
as int,activeQuests: null == activeQuests ? _self.activeQuests : activeQuests // ignore: cast_nullable_to_non_nullable
as int,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as int,topProducts: null == topProducts ? _self.topProducts : topProducts // ignore: cast_nullable_to_non_nullable
as List<TopProduct>,topSellers: null == topSellers ? _self.topSellers : topSellers // ignore: cast_nullable_to_non_nullable
as List<TopSeller>,segmentation: null == segmentation ? _self.segmentation : segmentation // ignore: cast_nullable_to_non_nullable
as BrandSegment,regions: null == regions ? _self.regions : regions // ignore: cast_nullable_to_non_nullable
as List<RegionStat>,
  ));
}
/// Create a copy of BrandDashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandSegmentCopyWith<$Res> get segmentation {
  
  return $BrandSegmentCopyWith<$Res>(_self.segmentation, (value) {
    return _then(_self.copyWith(segmentation: value));
  });
}
}


/// Adds pattern-matching-related methods to [BrandDashboard].
extension BrandDashboardPatterns on BrandDashboard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BrandDashboard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrandDashboard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BrandDashboard value)  $default,){
final _that = this;
switch (_that) {
case _BrandDashboard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BrandDashboard value)?  $default,){
final _that = this;
switch (_that) {
case _BrandDashboard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int checksTotal,  int packsTotal,  int activeQuests,  int participants,  List<TopProduct> topProducts,  List<TopSeller> topSellers,  BrandSegment segmentation,  List<RegionStat> regions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrandDashboard() when $default != null:
return $default(_that.checksTotal,_that.packsTotal,_that.activeQuests,_that.participants,_that.topProducts,_that.topSellers,_that.segmentation,_that.regions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int checksTotal,  int packsTotal,  int activeQuests,  int participants,  List<TopProduct> topProducts,  List<TopSeller> topSellers,  BrandSegment segmentation,  List<RegionStat> regions)  $default,) {final _that = this;
switch (_that) {
case _BrandDashboard():
return $default(_that.checksTotal,_that.packsTotal,_that.activeQuests,_that.participants,_that.topProducts,_that.topSellers,_that.segmentation,_that.regions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int checksTotal,  int packsTotal,  int activeQuests,  int participants,  List<TopProduct> topProducts,  List<TopSeller> topSellers,  BrandSegment segmentation,  List<RegionStat> regions)?  $default,) {final _that = this;
switch (_that) {
case _BrandDashboard() when $default != null:
return $default(_that.checksTotal,_that.packsTotal,_that.activeQuests,_that.participants,_that.topProducts,_that.topSellers,_that.segmentation,_that.regions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BrandDashboard implements BrandDashboard {
  const _BrandDashboard({required this.checksTotal, required this.packsTotal, required this.activeQuests, required this.participants, required final  List<TopProduct> topProducts, required final  List<TopSeller> topSellers, required this.segmentation, required final  List<RegionStat> regions}): _topProducts = topProducts,_topSellers = topSellers,_regions = regions;
  factory _BrandDashboard.fromJson(Map<String, dynamic> json) => _$BrandDashboardFromJson(json);

@override final  int checksTotal;
@override final  int packsTotal;
@override final  int activeQuests;
@override final  int participants;
 final  List<TopProduct> _topProducts;
@override List<TopProduct> get topProducts {
  if (_topProducts is EqualUnmodifiableListView) return _topProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topProducts);
}

 final  List<TopSeller> _topSellers;
@override List<TopSeller> get topSellers {
  if (_topSellers is EqualUnmodifiableListView) return _topSellers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topSellers);
}

@override final  BrandSegment segmentation;
 final  List<RegionStat> _regions;
@override List<RegionStat> get regions {
  if (_regions is EqualUnmodifiableListView) return _regions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_regions);
}


/// Create a copy of BrandDashboard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrandDashboardCopyWith<_BrandDashboard> get copyWith => __$BrandDashboardCopyWithImpl<_BrandDashboard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrandDashboardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrandDashboard&&(identical(other.checksTotal, checksTotal) || other.checksTotal == checksTotal)&&(identical(other.packsTotal, packsTotal) || other.packsTotal == packsTotal)&&(identical(other.activeQuests, activeQuests) || other.activeQuests == activeQuests)&&(identical(other.participants, participants) || other.participants == participants)&&const DeepCollectionEquality().equals(other._topProducts, _topProducts)&&const DeepCollectionEquality().equals(other._topSellers, _topSellers)&&(identical(other.segmentation, segmentation) || other.segmentation == segmentation)&&const DeepCollectionEquality().equals(other._regions, _regions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,checksTotal,packsTotal,activeQuests,participants,const DeepCollectionEquality().hash(_topProducts),const DeepCollectionEquality().hash(_topSellers),segmentation,const DeepCollectionEquality().hash(_regions));

@override
String toString() {
  return 'BrandDashboard(checksTotal: $checksTotal, packsTotal: $packsTotal, activeQuests: $activeQuests, participants: $participants, topProducts: $topProducts, topSellers: $topSellers, segmentation: $segmentation, regions: $regions)';
}


}

/// @nodoc
abstract mixin class _$BrandDashboardCopyWith<$Res> implements $BrandDashboardCopyWith<$Res> {
  factory _$BrandDashboardCopyWith(_BrandDashboard value, $Res Function(_BrandDashboard) _then) = __$BrandDashboardCopyWithImpl;
@override @useResult
$Res call({
 int checksTotal, int packsTotal, int activeQuests, int participants, List<TopProduct> topProducts, List<TopSeller> topSellers, BrandSegment segmentation, List<RegionStat> regions
});


@override $BrandSegmentCopyWith<$Res> get segmentation;

}
/// @nodoc
class __$BrandDashboardCopyWithImpl<$Res>
    implements _$BrandDashboardCopyWith<$Res> {
  __$BrandDashboardCopyWithImpl(this._self, this._then);

  final _BrandDashboard _self;
  final $Res Function(_BrandDashboard) _then;

/// Create a copy of BrandDashboard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checksTotal = null,Object? packsTotal = null,Object? activeQuests = null,Object? participants = null,Object? topProducts = null,Object? topSellers = null,Object? segmentation = null,Object? regions = null,}) {
  return _then(_BrandDashboard(
checksTotal: null == checksTotal ? _self.checksTotal : checksTotal // ignore: cast_nullable_to_non_nullable
as int,packsTotal: null == packsTotal ? _self.packsTotal : packsTotal // ignore: cast_nullable_to_non_nullable
as int,activeQuests: null == activeQuests ? _self.activeQuests : activeQuests // ignore: cast_nullable_to_non_nullable
as int,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as int,topProducts: null == topProducts ? _self._topProducts : topProducts // ignore: cast_nullable_to_non_nullable
as List<TopProduct>,topSellers: null == topSellers ? _self._topSellers : topSellers // ignore: cast_nullable_to_non_nullable
as List<TopSeller>,segmentation: null == segmentation ? _self.segmentation : segmentation // ignore: cast_nullable_to_non_nullable
as BrandSegment,regions: null == regions ? _self._regions : regions // ignore: cast_nullable_to_non_nullable
as List<RegionStat>,
  ));
}

/// Create a copy of BrandDashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandSegmentCopyWith<$Res> get segmentation {
  
  return $BrandSegmentCopyWith<$Res>(_self.segmentation, (value) {
    return _then(_self.copyWith(segmentation: value));
  });
}
}


/// @nodoc
mixin _$BrandQuest {

 int get id; String get name; QuestStatus get status; String get sponsor; List<String> get products; String get mxik; int get prizeIqc; String get startDate; String? get endDate; int? get perUserLimit; int get budgetFunded; int get budgetSpent; int get participants; int get completions;
/// Create a copy of BrandQuest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandQuestCopyWith<BrandQuest> get copyWith => _$BrandQuestCopyWithImpl<BrandQuest>(this as BrandQuest, _$identity);

  /// Serializes this BrandQuest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandQuest&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.mxik, mxik) || other.mxik == mxik)&&(identical(other.prizeIqc, prizeIqc) || other.prizeIqc == prizeIqc)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.perUserLimit, perUserLimit) || other.perUserLimit == perUserLimit)&&(identical(other.budgetFunded, budgetFunded) || other.budgetFunded == budgetFunded)&&(identical(other.budgetSpent, budgetSpent) || other.budgetSpent == budgetSpent)&&(identical(other.participants, participants) || other.participants == participants)&&(identical(other.completions, completions) || other.completions == completions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,sponsor,const DeepCollectionEquality().hash(products),mxik,prizeIqc,startDate,endDate,perUserLimit,budgetFunded,budgetSpent,participants,completions);

@override
String toString() {
  return 'BrandQuest(id: $id, name: $name, status: $status, sponsor: $sponsor, products: $products, mxik: $mxik, prizeIqc: $prizeIqc, startDate: $startDate, endDate: $endDate, perUserLimit: $perUserLimit, budgetFunded: $budgetFunded, budgetSpent: $budgetSpent, participants: $participants, completions: $completions)';
}


}

/// @nodoc
abstract mixin class $BrandQuestCopyWith<$Res>  {
  factory $BrandQuestCopyWith(BrandQuest value, $Res Function(BrandQuest) _then) = _$BrandQuestCopyWithImpl;
@useResult
$Res call({
 int id, String name, QuestStatus status, String sponsor, List<String> products, String mxik, int prizeIqc, String startDate, String? endDate, int? perUserLimit, int budgetFunded, int budgetSpent, int participants, int completions
});




}
/// @nodoc
class _$BrandQuestCopyWithImpl<$Res>
    implements $BrandQuestCopyWith<$Res> {
  _$BrandQuestCopyWithImpl(this._self, this._then);

  final BrandQuest _self;
  final $Res Function(BrandQuest) _then;

/// Create a copy of BrandQuest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? status = null,Object? sponsor = null,Object? products = null,Object? mxik = null,Object? prizeIqc = null,Object? startDate = null,Object? endDate = freezed,Object? perUserLimit = freezed,Object? budgetFunded = null,Object? budgetSpent = null,Object? participants = null,Object? completions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QuestStatus,sponsor: null == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<String>,mxik: null == mxik ? _self.mxik : mxik // ignore: cast_nullable_to_non_nullable
as String,prizeIqc: null == prizeIqc ? _self.prizeIqc : prizeIqc // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,perUserLimit: freezed == perUserLimit ? _self.perUserLimit : perUserLimit // ignore: cast_nullable_to_non_nullable
as int?,budgetFunded: null == budgetFunded ? _self.budgetFunded : budgetFunded // ignore: cast_nullable_to_non_nullable
as int,budgetSpent: null == budgetSpent ? _self.budgetSpent : budgetSpent // ignore: cast_nullable_to_non_nullable
as int,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as int,completions: null == completions ? _self.completions : completions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BrandQuest].
extension BrandQuestPatterns on BrandQuest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BrandQuest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrandQuest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BrandQuest value)  $default,){
final _that = this;
switch (_that) {
case _BrandQuest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BrandQuest value)?  $default,){
final _that = this;
switch (_that) {
case _BrandQuest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  QuestStatus status,  String sponsor,  List<String> products,  String mxik,  int prizeIqc,  String startDate,  String? endDate,  int? perUserLimit,  int budgetFunded,  int budgetSpent,  int participants,  int completions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrandQuest() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.sponsor,_that.products,_that.mxik,_that.prizeIqc,_that.startDate,_that.endDate,_that.perUserLimit,_that.budgetFunded,_that.budgetSpent,_that.participants,_that.completions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  QuestStatus status,  String sponsor,  List<String> products,  String mxik,  int prizeIqc,  String startDate,  String? endDate,  int? perUserLimit,  int budgetFunded,  int budgetSpent,  int participants,  int completions)  $default,) {final _that = this;
switch (_that) {
case _BrandQuest():
return $default(_that.id,_that.name,_that.status,_that.sponsor,_that.products,_that.mxik,_that.prizeIqc,_that.startDate,_that.endDate,_that.perUserLimit,_that.budgetFunded,_that.budgetSpent,_that.participants,_that.completions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  QuestStatus status,  String sponsor,  List<String> products,  String mxik,  int prizeIqc,  String startDate,  String? endDate,  int? perUserLimit,  int budgetFunded,  int budgetSpent,  int participants,  int completions)?  $default,) {final _that = this;
switch (_that) {
case _BrandQuest() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.sponsor,_that.products,_that.mxik,_that.prizeIqc,_that.startDate,_that.endDate,_that.perUserLimit,_that.budgetFunded,_that.budgetSpent,_that.participants,_that.completions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BrandQuest implements BrandQuest {
  const _BrandQuest({required this.id, required this.name, required this.status, required this.sponsor, required final  List<String> products, required this.mxik, required this.prizeIqc, required this.startDate, this.endDate, this.perUserLimit, required this.budgetFunded, required this.budgetSpent, required this.participants, required this.completions}): _products = products;
  factory _BrandQuest.fromJson(Map<String, dynamic> json) => _$BrandQuestFromJson(json);

@override final  int id;
@override final  String name;
@override final  QuestStatus status;
@override final  String sponsor;
 final  List<String> _products;
@override List<String> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  String mxik;
@override final  int prizeIqc;
@override final  String startDate;
@override final  String? endDate;
@override final  int? perUserLimit;
@override final  int budgetFunded;
@override final  int budgetSpent;
@override final  int participants;
@override final  int completions;

/// Create a copy of BrandQuest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrandQuestCopyWith<_BrandQuest> get copyWith => __$BrandQuestCopyWithImpl<_BrandQuest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrandQuestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrandQuest&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.mxik, mxik) || other.mxik == mxik)&&(identical(other.prizeIqc, prizeIqc) || other.prizeIqc == prizeIqc)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.perUserLimit, perUserLimit) || other.perUserLimit == perUserLimit)&&(identical(other.budgetFunded, budgetFunded) || other.budgetFunded == budgetFunded)&&(identical(other.budgetSpent, budgetSpent) || other.budgetSpent == budgetSpent)&&(identical(other.participants, participants) || other.participants == participants)&&(identical(other.completions, completions) || other.completions == completions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,sponsor,const DeepCollectionEquality().hash(_products),mxik,prizeIqc,startDate,endDate,perUserLimit,budgetFunded,budgetSpent,participants,completions);

@override
String toString() {
  return 'BrandQuest(id: $id, name: $name, status: $status, sponsor: $sponsor, products: $products, mxik: $mxik, prizeIqc: $prizeIqc, startDate: $startDate, endDate: $endDate, perUserLimit: $perUserLimit, budgetFunded: $budgetFunded, budgetSpent: $budgetSpent, participants: $participants, completions: $completions)';
}


}

/// @nodoc
abstract mixin class _$BrandQuestCopyWith<$Res> implements $BrandQuestCopyWith<$Res> {
  factory _$BrandQuestCopyWith(_BrandQuest value, $Res Function(_BrandQuest) _then) = __$BrandQuestCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, QuestStatus status, String sponsor, List<String> products, String mxik, int prizeIqc, String startDate, String? endDate, int? perUserLimit, int budgetFunded, int budgetSpent, int participants, int completions
});




}
/// @nodoc
class __$BrandQuestCopyWithImpl<$Res>
    implements _$BrandQuestCopyWith<$Res> {
  __$BrandQuestCopyWithImpl(this._self, this._then);

  final _BrandQuest _self;
  final $Res Function(_BrandQuest) _then;

/// Create a copy of BrandQuest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? status = null,Object? sponsor = null,Object? products = null,Object? mxik = null,Object? prizeIqc = null,Object? startDate = null,Object? endDate = freezed,Object? perUserLimit = freezed,Object? budgetFunded = null,Object? budgetSpent = null,Object? participants = null,Object? completions = null,}) {
  return _then(_BrandQuest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QuestStatus,sponsor: null == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<String>,mxik: null == mxik ? _self.mxik : mxik // ignore: cast_nullable_to_non_nullable
as String,prizeIqc: null == prizeIqc ? _self.prizeIqc : prizeIqc // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,perUserLimit: freezed == perUserLimit ? _self.perUserLimit : perUserLimit // ignore: cast_nullable_to_non_nullable
as int?,budgetFunded: null == budgetFunded ? _self.budgetFunded : budgetFunded // ignore: cast_nullable_to_non_nullable
as int,budgetSpent: null == budgetSpent ? _self.budgetSpent : budgetSpent // ignore: cast_nullable_to_non_nullable
as int,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as int,completions: null == completions ? _self.completions : completions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$BrandProduct {

 int get id; String get name; String get brand; String get mxik; bool get divisible; String get format; String? get imageUrl; int get questCount;
/// Create a copy of BrandProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandProductCopyWith<BrandProduct> get copyWith => _$BrandProductCopyWithImpl<BrandProduct>(this as BrandProduct, _$identity);

  /// Serializes this BrandProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.mxik, mxik) || other.mxik == mxik)&&(identical(other.divisible, divisible) || other.divisible == divisible)&&(identical(other.format, format) || other.format == format)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.questCount, questCount) || other.questCount == questCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,brand,mxik,divisible,format,imageUrl,questCount);

@override
String toString() {
  return 'BrandProduct(id: $id, name: $name, brand: $brand, mxik: $mxik, divisible: $divisible, format: $format, imageUrl: $imageUrl, questCount: $questCount)';
}


}

/// @nodoc
abstract mixin class $BrandProductCopyWith<$Res>  {
  factory $BrandProductCopyWith(BrandProduct value, $Res Function(BrandProduct) _then) = _$BrandProductCopyWithImpl;
@useResult
$Res call({
 int id, String name, String brand, String mxik, bool divisible, String format, String? imageUrl, int questCount
});




}
/// @nodoc
class _$BrandProductCopyWithImpl<$Res>
    implements $BrandProductCopyWith<$Res> {
  _$BrandProductCopyWithImpl(this._self, this._then);

  final BrandProduct _self;
  final $Res Function(BrandProduct) _then;

/// Create a copy of BrandProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? brand = null,Object? mxik = null,Object? divisible = null,Object? format = null,Object? imageUrl = freezed,Object? questCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,mxik: null == mxik ? _self.mxik : mxik // ignore: cast_nullable_to_non_nullable
as String,divisible: null == divisible ? _self.divisible : divisible // ignore: cast_nullable_to_non_nullable
as bool,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,questCount: null == questCount ? _self.questCount : questCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BrandProduct].
extension BrandProductPatterns on BrandProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BrandProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrandProduct() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BrandProduct value)  $default,){
final _that = this;
switch (_that) {
case _BrandProduct():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BrandProduct value)?  $default,){
final _that = this;
switch (_that) {
case _BrandProduct() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String brand,  String mxik,  bool divisible,  String format,  String? imageUrl,  int questCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrandProduct() when $default != null:
return $default(_that.id,_that.name,_that.brand,_that.mxik,_that.divisible,_that.format,_that.imageUrl,_that.questCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String brand,  String mxik,  bool divisible,  String format,  String? imageUrl,  int questCount)  $default,) {final _that = this;
switch (_that) {
case _BrandProduct():
return $default(_that.id,_that.name,_that.brand,_that.mxik,_that.divisible,_that.format,_that.imageUrl,_that.questCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String brand,  String mxik,  bool divisible,  String format,  String? imageUrl,  int questCount)?  $default,) {final _that = this;
switch (_that) {
case _BrandProduct() when $default != null:
return $default(_that.id,_that.name,_that.brand,_that.mxik,_that.divisible,_that.format,_that.imageUrl,_that.questCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BrandProduct implements BrandProduct {
  const _BrandProduct({required this.id, required this.name, required this.brand, required this.mxik, required this.divisible, required this.format, this.imageUrl, required this.questCount});
  factory _BrandProduct.fromJson(Map<String, dynamic> json) => _$BrandProductFromJson(json);

@override final  int id;
@override final  String name;
@override final  String brand;
@override final  String mxik;
@override final  bool divisible;
@override final  String format;
@override final  String? imageUrl;
@override final  int questCount;

/// Create a copy of BrandProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrandProductCopyWith<_BrandProduct> get copyWith => __$BrandProductCopyWithImpl<_BrandProduct>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrandProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrandProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.mxik, mxik) || other.mxik == mxik)&&(identical(other.divisible, divisible) || other.divisible == divisible)&&(identical(other.format, format) || other.format == format)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.questCount, questCount) || other.questCount == questCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,brand,mxik,divisible,format,imageUrl,questCount);

@override
String toString() {
  return 'BrandProduct(id: $id, name: $name, brand: $brand, mxik: $mxik, divisible: $divisible, format: $format, imageUrl: $imageUrl, questCount: $questCount)';
}


}

/// @nodoc
abstract mixin class _$BrandProductCopyWith<$Res> implements $BrandProductCopyWith<$Res> {
  factory _$BrandProductCopyWith(_BrandProduct value, $Res Function(_BrandProduct) _then) = __$BrandProductCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String brand, String mxik, bool divisible, String format, String? imageUrl, int questCount
});




}
/// @nodoc
class __$BrandProductCopyWithImpl<$Res>
    implements _$BrandProductCopyWith<$Res> {
  __$BrandProductCopyWithImpl(this._self, this._then);

  final _BrandProduct _self;
  final $Res Function(_BrandProduct) _then;

/// Create a copy of BrandProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? brand = null,Object? mxik = null,Object? divisible = null,Object? format = null,Object? imageUrl = freezed,Object? questCount = null,}) {
  return _then(_BrandProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,mxik: null == mxik ? _self.mxik : mxik // ignore: cast_nullable_to_non_nullable
as String,divisible: null == divisible ? _self.divisible : divisible // ignore: cast_nullable_to_non_nullable
as bool,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,questCount: null == questCount ? _self.questCount : questCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$BrandInfo {

 int get id; String get name; String get manufacturer; String? get bannerUrl; List<String> get subBrands; int get questCount;
/// Create a copy of BrandInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandInfoCopyWith<BrandInfo> get copyWith => _$BrandInfoCopyWithImpl<BrandInfo>(this as BrandInfo, _$identity);

  /// Serializes this BrandInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl)&&const DeepCollectionEquality().equals(other.subBrands, subBrands)&&(identical(other.questCount, questCount) || other.questCount == questCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,manufacturer,bannerUrl,const DeepCollectionEquality().hash(subBrands),questCount);

@override
String toString() {
  return 'BrandInfo(id: $id, name: $name, manufacturer: $manufacturer, bannerUrl: $bannerUrl, subBrands: $subBrands, questCount: $questCount)';
}


}

/// @nodoc
abstract mixin class $BrandInfoCopyWith<$Res>  {
  factory $BrandInfoCopyWith(BrandInfo value, $Res Function(BrandInfo) _then) = _$BrandInfoCopyWithImpl;
@useResult
$Res call({
 int id, String name, String manufacturer, String? bannerUrl, List<String> subBrands, int questCount
});




}
/// @nodoc
class _$BrandInfoCopyWithImpl<$Res>
    implements $BrandInfoCopyWith<$Res> {
  _$BrandInfoCopyWithImpl(this._self, this._then);

  final BrandInfo _self;
  final $Res Function(BrandInfo) _then;

/// Create a copy of BrandInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? manufacturer = null,Object? bannerUrl = freezed,Object? subBrands = null,Object? questCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,manufacturer: null == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as String,bannerUrl: freezed == bannerUrl ? _self.bannerUrl : bannerUrl // ignore: cast_nullable_to_non_nullable
as String?,subBrands: null == subBrands ? _self.subBrands : subBrands // ignore: cast_nullable_to_non_nullable
as List<String>,questCount: null == questCount ? _self.questCount : questCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BrandInfo].
extension BrandInfoPatterns on BrandInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BrandInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrandInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BrandInfo value)  $default,){
final _that = this;
switch (_that) {
case _BrandInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BrandInfo value)?  $default,){
final _that = this;
switch (_that) {
case _BrandInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String manufacturer,  String? bannerUrl,  List<String> subBrands,  int questCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrandInfo() when $default != null:
return $default(_that.id,_that.name,_that.manufacturer,_that.bannerUrl,_that.subBrands,_that.questCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String manufacturer,  String? bannerUrl,  List<String> subBrands,  int questCount)  $default,) {final _that = this;
switch (_that) {
case _BrandInfo():
return $default(_that.id,_that.name,_that.manufacturer,_that.bannerUrl,_that.subBrands,_that.questCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String manufacturer,  String? bannerUrl,  List<String> subBrands,  int questCount)?  $default,) {final _that = this;
switch (_that) {
case _BrandInfo() when $default != null:
return $default(_that.id,_that.name,_that.manufacturer,_that.bannerUrl,_that.subBrands,_that.questCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BrandInfo implements BrandInfo {
  const _BrandInfo({required this.id, required this.name, required this.manufacturer, this.bannerUrl, required final  List<String> subBrands, required this.questCount}): _subBrands = subBrands;
  factory _BrandInfo.fromJson(Map<String, dynamic> json) => _$BrandInfoFromJson(json);

@override final  int id;
@override final  String name;
@override final  String manufacturer;
@override final  String? bannerUrl;
 final  List<String> _subBrands;
@override List<String> get subBrands {
  if (_subBrands is EqualUnmodifiableListView) return _subBrands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subBrands);
}

@override final  int questCount;

/// Create a copy of BrandInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrandInfoCopyWith<_BrandInfo> get copyWith => __$BrandInfoCopyWithImpl<_BrandInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrandInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrandInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl)&&const DeepCollectionEquality().equals(other._subBrands, _subBrands)&&(identical(other.questCount, questCount) || other.questCount == questCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,manufacturer,bannerUrl,const DeepCollectionEquality().hash(_subBrands),questCount);

@override
String toString() {
  return 'BrandInfo(id: $id, name: $name, manufacturer: $manufacturer, bannerUrl: $bannerUrl, subBrands: $subBrands, questCount: $questCount)';
}


}

/// @nodoc
abstract mixin class _$BrandInfoCopyWith<$Res> implements $BrandInfoCopyWith<$Res> {
  factory _$BrandInfoCopyWith(_BrandInfo value, $Res Function(_BrandInfo) _then) = __$BrandInfoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String manufacturer, String? bannerUrl, List<String> subBrands, int questCount
});




}
/// @nodoc
class __$BrandInfoCopyWithImpl<$Res>
    implements _$BrandInfoCopyWith<$Res> {
  __$BrandInfoCopyWithImpl(this._self, this._then);

  final _BrandInfo _self;
  final $Res Function(_BrandInfo) _then;

/// Create a copy of BrandInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? manufacturer = null,Object? bannerUrl = freezed,Object? subBrands = null,Object? questCount = null,}) {
  return _then(_BrandInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,manufacturer: null == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as String,bannerUrl: freezed == bannerUrl ? _self.bannerUrl : bannerUrl // ignore: cast_nullable_to_non_nullable
as String?,subBrands: null == subBrands ? _self._subBrands : subBrands // ignore: cast_nullable_to_non_nullable
as List<String>,questCount: null == questCount ? _self.questCount : questCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SalesLogRow {

 int get id; String get date; String get pharmacist; String get shop; String get product; int get qty; String get region;
/// Create a copy of SalesLogRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesLogRowCopyWith<SalesLogRow> get copyWith => _$SalesLogRowCopyWithImpl<SalesLogRow>(this as SalesLogRow, _$identity);

  /// Serializes this SalesLogRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesLogRow&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.pharmacist, pharmacist) || other.pharmacist == pharmacist)&&(identical(other.shop, shop) || other.shop == shop)&&(identical(other.product, product) || other.product == product)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,pharmacist,shop,product,qty,region);

@override
String toString() {
  return 'SalesLogRow(id: $id, date: $date, pharmacist: $pharmacist, shop: $shop, product: $product, qty: $qty, region: $region)';
}


}

/// @nodoc
abstract mixin class $SalesLogRowCopyWith<$Res>  {
  factory $SalesLogRowCopyWith(SalesLogRow value, $Res Function(SalesLogRow) _then) = _$SalesLogRowCopyWithImpl;
@useResult
$Res call({
 int id, String date, String pharmacist, String shop, String product, int qty, String region
});




}
/// @nodoc
class _$SalesLogRowCopyWithImpl<$Res>
    implements $SalesLogRowCopyWith<$Res> {
  _$SalesLogRowCopyWithImpl(this._self, this._then);

  final SalesLogRow _self;
  final $Res Function(SalesLogRow) _then;

/// Create a copy of SalesLogRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? date = null,Object? pharmacist = null,Object? shop = null,Object? product = null,Object? qty = null,Object? region = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,pharmacist: null == pharmacist ? _self.pharmacist : pharmacist // ignore: cast_nullable_to_non_nullable
as String,shop: null == shop ? _self.shop : shop // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesLogRow].
extension SalesLogRowPatterns on SalesLogRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesLogRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesLogRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesLogRow value)  $default,){
final _that = this;
switch (_that) {
case _SalesLogRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesLogRow value)?  $default,){
final _that = this;
switch (_that) {
case _SalesLogRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String date,  String pharmacist,  String shop,  String product,  int qty,  String region)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesLogRow() when $default != null:
return $default(_that.id,_that.date,_that.pharmacist,_that.shop,_that.product,_that.qty,_that.region);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String date,  String pharmacist,  String shop,  String product,  int qty,  String region)  $default,) {final _that = this;
switch (_that) {
case _SalesLogRow():
return $default(_that.id,_that.date,_that.pharmacist,_that.shop,_that.product,_that.qty,_that.region);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String date,  String pharmacist,  String shop,  String product,  int qty,  String region)?  $default,) {final _that = this;
switch (_that) {
case _SalesLogRow() when $default != null:
return $default(_that.id,_that.date,_that.pharmacist,_that.shop,_that.product,_that.qty,_that.region);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesLogRow implements SalesLogRow {
  const _SalesLogRow({required this.id, required this.date, required this.pharmacist, required this.shop, required this.product, required this.qty, required this.region});
  factory _SalesLogRow.fromJson(Map<String, dynamic> json) => _$SalesLogRowFromJson(json);

@override final  int id;
@override final  String date;
@override final  String pharmacist;
@override final  String shop;
@override final  String product;
@override final  int qty;
@override final  String region;

/// Create a copy of SalesLogRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesLogRowCopyWith<_SalesLogRow> get copyWith => __$SalesLogRowCopyWithImpl<_SalesLogRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesLogRowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesLogRow&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.pharmacist, pharmacist) || other.pharmacist == pharmacist)&&(identical(other.shop, shop) || other.shop == shop)&&(identical(other.product, product) || other.product == product)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,pharmacist,shop,product,qty,region);

@override
String toString() {
  return 'SalesLogRow(id: $id, date: $date, pharmacist: $pharmacist, shop: $shop, product: $product, qty: $qty, region: $region)';
}


}

/// @nodoc
abstract mixin class _$SalesLogRowCopyWith<$Res> implements $SalesLogRowCopyWith<$Res> {
  factory _$SalesLogRowCopyWith(_SalesLogRow value, $Res Function(_SalesLogRow) _then) = __$SalesLogRowCopyWithImpl;
@override @useResult
$Res call({
 int id, String date, String pharmacist, String shop, String product, int qty, String region
});




}
/// @nodoc
class __$SalesLogRowCopyWithImpl<$Res>
    implements _$SalesLogRowCopyWith<$Res> {
  __$SalesLogRowCopyWithImpl(this._self, this._then);

  final _SalesLogRow _self;
  final $Res Function(_SalesLogRow) _then;

/// Create a copy of SalesLogRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? pharmacist = null,Object? shop = null,Object? product = null,Object? qty = null,Object? region = null,}) {
  return _then(_SalesLogRow(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,pharmacist: null == pharmacist ? _self.pharmacist : pharmacist // ignore: cast_nullable_to_non_nullable
as String,shop: null == shop ? _self.shop : shop // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
