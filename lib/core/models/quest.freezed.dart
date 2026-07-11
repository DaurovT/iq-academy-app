// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Quest {

 int get id; String get name; String get description; QuestStatus get status; RewardType get rewardType; QuestTarget get target; int get prizeIqc; double get progress; int get completedCount; String? get brand; String? get drug; String? get startDate; String? get endDate;
/// Create a copy of Quest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestCopyWith<Quest> get copyWith => _$QuestCopyWithImpl<Quest>(this as Quest, _$identity);

  /// Serializes this Quest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Quest&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.rewardType, rewardType) || other.rewardType == rewardType)&&(identical(other.target, target) || other.target == target)&&(identical(other.prizeIqc, prizeIqc) || other.prizeIqc == prizeIqc)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.completedCount, completedCount) || other.completedCount == completedCount)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.drug, drug) || other.drug == drug)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,status,rewardType,target,prizeIqc,progress,completedCount,brand,drug,startDate,endDate);

@override
String toString() {
  return 'Quest(id: $id, name: $name, description: $description, status: $status, rewardType: $rewardType, target: $target, prizeIqc: $prizeIqc, progress: $progress, completedCount: $completedCount, brand: $brand, drug: $drug, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $QuestCopyWith<$Res>  {
  factory $QuestCopyWith(Quest value, $Res Function(Quest) _then) = _$QuestCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description, QuestStatus status, RewardType rewardType, QuestTarget target, int prizeIqc, double progress, int completedCount, String? brand, String? drug, String? startDate, String? endDate
});




}
/// @nodoc
class _$QuestCopyWithImpl<$Res>
    implements $QuestCopyWith<$Res> {
  _$QuestCopyWithImpl(this._self, this._then);

  final Quest _self;
  final $Res Function(Quest) _then;

/// Create a copy of Quest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? status = null,Object? rewardType = null,Object? target = null,Object? prizeIqc = null,Object? progress = null,Object? completedCount = null,Object? brand = freezed,Object? drug = freezed,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QuestStatus,rewardType: null == rewardType ? _self.rewardType : rewardType // ignore: cast_nullable_to_non_nullable
as RewardType,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as QuestTarget,prizeIqc: null == prizeIqc ? _self.prizeIqc : prizeIqc // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,completedCount: null == completedCount ? _self.completedCount : completedCount // ignore: cast_nullable_to_non_nullable
as int,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,drug: freezed == drug ? _self.drug : drug // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Quest].
extension QuestPatterns on Quest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Quest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Quest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Quest value)  $default,){
final _that = this;
switch (_that) {
case _Quest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Quest value)?  $default,){
final _that = this;
switch (_that) {
case _Quest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description,  QuestStatus status,  RewardType rewardType,  QuestTarget target,  int prizeIqc,  double progress,  int completedCount,  String? brand,  String? drug,  String? startDate,  String? endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Quest() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.status,_that.rewardType,_that.target,_that.prizeIqc,_that.progress,_that.completedCount,_that.brand,_that.drug,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description,  QuestStatus status,  RewardType rewardType,  QuestTarget target,  int prizeIqc,  double progress,  int completedCount,  String? brand,  String? drug,  String? startDate,  String? endDate)  $default,) {final _that = this;
switch (_that) {
case _Quest():
return $default(_that.id,_that.name,_that.description,_that.status,_that.rewardType,_that.target,_that.prizeIqc,_that.progress,_that.completedCount,_that.brand,_that.drug,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description,  QuestStatus status,  RewardType rewardType,  QuestTarget target,  int prizeIqc,  double progress,  int completedCount,  String? brand,  String? drug,  String? startDate,  String? endDate)?  $default,) {final _that = this;
switch (_that) {
case _Quest() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.status,_that.rewardType,_that.target,_that.prizeIqc,_that.progress,_that.completedCount,_that.brand,_that.drug,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Quest implements Quest {
  const _Quest({required this.id, required this.name, required this.description, required this.status, required this.rewardType, required this.target, required this.prizeIqc, required this.progress, required this.completedCount, this.brand, this.drug, this.startDate, this.endDate});
  factory _Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);

@override final  int id;
@override final  String name;
@override final  String description;
@override final  QuestStatus status;
@override final  RewardType rewardType;
@override final  QuestTarget target;
@override final  int prizeIqc;
@override final  double progress;
@override final  int completedCount;
@override final  String? brand;
@override final  String? drug;
@override final  String? startDate;
@override final  String? endDate;

/// Create a copy of Quest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestCopyWith<_Quest> get copyWith => __$QuestCopyWithImpl<_Quest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Quest&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.rewardType, rewardType) || other.rewardType == rewardType)&&(identical(other.target, target) || other.target == target)&&(identical(other.prizeIqc, prizeIqc) || other.prizeIqc == prizeIqc)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.completedCount, completedCount) || other.completedCount == completedCount)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.drug, drug) || other.drug == drug)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,status,rewardType,target,prizeIqc,progress,completedCount,brand,drug,startDate,endDate);

@override
String toString() {
  return 'Quest(id: $id, name: $name, description: $description, status: $status, rewardType: $rewardType, target: $target, prizeIqc: $prizeIqc, progress: $progress, completedCount: $completedCount, brand: $brand, drug: $drug, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$QuestCopyWith<$Res> implements $QuestCopyWith<$Res> {
  factory _$QuestCopyWith(_Quest value, $Res Function(_Quest) _then) = __$QuestCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description, QuestStatus status, RewardType rewardType, QuestTarget target, int prizeIqc, double progress, int completedCount, String? brand, String? drug, String? startDate, String? endDate
});




}
/// @nodoc
class __$QuestCopyWithImpl<$Res>
    implements _$QuestCopyWith<$Res> {
  __$QuestCopyWithImpl(this._self, this._then);

  final _Quest _self;
  final $Res Function(_Quest) _then;

/// Create a copy of Quest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? status = null,Object? rewardType = null,Object? target = null,Object? prizeIqc = null,Object? progress = null,Object? completedCount = null,Object? brand = freezed,Object? drug = freezed,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_Quest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QuestStatus,rewardType: null == rewardType ? _self.rewardType : rewardType // ignore: cast_nullable_to_non_nullable
as RewardType,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as QuestTarget,prizeIqc: null == prizeIqc ? _self.prizeIqc : prizeIqc // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,completedCount: null == completedCount ? _self.completedCount : completedCount // ignore: cast_nullable_to_non_nullable
as int,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,drug: freezed == drug ? _self.drug : drug // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$QuestMechanic {

 String get drug; int get qty;
/// Create a copy of QuestMechanic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestMechanicCopyWith<QuestMechanic> get copyWith => _$QuestMechanicCopyWithImpl<QuestMechanic>(this as QuestMechanic, _$identity);

  /// Serializes this QuestMechanic to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestMechanic&&(identical(other.drug, drug) || other.drug == drug)&&(identical(other.qty, qty) || other.qty == qty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,drug,qty);

@override
String toString() {
  return 'QuestMechanic(drug: $drug, qty: $qty)';
}


}

/// @nodoc
abstract mixin class $QuestMechanicCopyWith<$Res>  {
  factory $QuestMechanicCopyWith(QuestMechanic value, $Res Function(QuestMechanic) _then) = _$QuestMechanicCopyWithImpl;
@useResult
$Res call({
 String drug, int qty
});




}
/// @nodoc
class _$QuestMechanicCopyWithImpl<$Res>
    implements $QuestMechanicCopyWith<$Res> {
  _$QuestMechanicCopyWithImpl(this._self, this._then);

  final QuestMechanic _self;
  final $Res Function(QuestMechanic) _then;

/// Create a copy of QuestMechanic
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? drug = null,Object? qty = null,}) {
  return _then(_self.copyWith(
drug: null == drug ? _self.drug : drug // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestMechanic].
extension QuestMechanicPatterns on QuestMechanic {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestMechanic value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestMechanic() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestMechanic value)  $default,){
final _that = this;
switch (_that) {
case _QuestMechanic():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestMechanic value)?  $default,){
final _that = this;
switch (_that) {
case _QuestMechanic() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String drug,  int qty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestMechanic() when $default != null:
return $default(_that.drug,_that.qty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String drug,  int qty)  $default,) {final _that = this;
switch (_that) {
case _QuestMechanic():
return $default(_that.drug,_that.qty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String drug,  int qty)?  $default,) {final _that = this;
switch (_that) {
case _QuestMechanic() when $default != null:
return $default(_that.drug,_that.qty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuestMechanic implements QuestMechanic {
  const _QuestMechanic({required this.drug, required this.qty});
  factory _QuestMechanic.fromJson(Map<String, dynamic> json) => _$QuestMechanicFromJson(json);

@override final  String drug;
@override final  int qty;

/// Create a copy of QuestMechanic
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestMechanicCopyWith<_QuestMechanic> get copyWith => __$QuestMechanicCopyWithImpl<_QuestMechanic>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestMechanicToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestMechanic&&(identical(other.drug, drug) || other.drug == drug)&&(identical(other.qty, qty) || other.qty == qty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,drug,qty);

@override
String toString() {
  return 'QuestMechanic(drug: $drug, qty: $qty)';
}


}

/// @nodoc
abstract mixin class _$QuestMechanicCopyWith<$Res> implements $QuestMechanicCopyWith<$Res> {
  factory _$QuestMechanicCopyWith(_QuestMechanic value, $Res Function(_QuestMechanic) _then) = __$QuestMechanicCopyWithImpl;
@override @useResult
$Res call({
 String drug, int qty
});




}
/// @nodoc
class __$QuestMechanicCopyWithImpl<$Res>
    implements _$QuestMechanicCopyWith<$Res> {
  __$QuestMechanicCopyWithImpl(this._self, this._then);

  final _QuestMechanic _self;
  final $Res Function(_QuestMechanic) _then;

/// Create a copy of QuestMechanic
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? drug = null,Object? qty = null,}) {
  return _then(_QuestMechanic(
drug: null == drug ? _self.drug : drug // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TopSeller {

 int get rank; String get name; String get shop; int get total;
/// Create a copy of TopSeller
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopSellerCopyWith<TopSeller> get copyWith => _$TopSellerCopyWithImpl<TopSeller>(this as TopSeller, _$identity);

  /// Serializes this TopSeller to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopSeller&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.name, name) || other.name == name)&&(identical(other.shop, shop) || other.shop == shop)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rank,name,shop,total);

@override
String toString() {
  return 'TopSeller(rank: $rank, name: $name, shop: $shop, total: $total)';
}


}

/// @nodoc
abstract mixin class $TopSellerCopyWith<$Res>  {
  factory $TopSellerCopyWith(TopSeller value, $Res Function(TopSeller) _then) = _$TopSellerCopyWithImpl;
@useResult
$Res call({
 int rank, String name, String shop, int total
});




}
/// @nodoc
class _$TopSellerCopyWithImpl<$Res>
    implements $TopSellerCopyWith<$Res> {
  _$TopSellerCopyWithImpl(this._self, this._then);

  final TopSeller _self;
  final $Res Function(TopSeller) _then;

/// Create a copy of TopSeller
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rank = null,Object? name = null,Object? shop = null,Object? total = null,}) {
  return _then(_self.copyWith(
rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shop: null == shop ? _self.shop : shop // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TopSeller].
extension TopSellerPatterns on TopSeller {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopSeller value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopSeller() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopSeller value)  $default,){
final _that = this;
switch (_that) {
case _TopSeller():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopSeller value)?  $default,){
final _that = this;
switch (_that) {
case _TopSeller() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int rank,  String name,  String shop,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopSeller() when $default != null:
return $default(_that.rank,_that.name,_that.shop,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int rank,  String name,  String shop,  int total)  $default,) {final _that = this;
switch (_that) {
case _TopSeller():
return $default(_that.rank,_that.name,_that.shop,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int rank,  String name,  String shop,  int total)?  $default,) {final _that = this;
switch (_that) {
case _TopSeller() when $default != null:
return $default(_that.rank,_that.name,_that.shop,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopSeller implements TopSeller {
  const _TopSeller({required this.rank, required this.name, required this.shop, required this.total});
  factory _TopSeller.fromJson(Map<String, dynamic> json) => _$TopSellerFromJson(json);

@override final  int rank;
@override final  String name;
@override final  String shop;
@override final  int total;

/// Create a copy of TopSeller
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopSellerCopyWith<_TopSeller> get copyWith => __$TopSellerCopyWithImpl<_TopSeller>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopSellerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopSeller&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.name, name) || other.name == name)&&(identical(other.shop, shop) || other.shop == shop)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rank,name,shop,total);

@override
String toString() {
  return 'TopSeller(rank: $rank, name: $name, shop: $shop, total: $total)';
}


}

/// @nodoc
abstract mixin class _$TopSellerCopyWith<$Res> implements $TopSellerCopyWith<$Res> {
  factory _$TopSellerCopyWith(_TopSeller value, $Res Function(_TopSeller) _then) = __$TopSellerCopyWithImpl;
@override @useResult
$Res call({
 int rank, String name, String shop, int total
});




}
/// @nodoc
class __$TopSellerCopyWithImpl<$Res>
    implements _$TopSellerCopyWith<$Res> {
  __$TopSellerCopyWithImpl(this._self, this._then);

  final _TopSeller _self;
  final $Res Function(_TopSeller) _then;

/// Create a copy of TopSeller
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rank = null,Object? name = null,Object? shop = null,Object? total = null,}) {
  return _then(_TopSeller(
rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shop: null == shop ? _self.shop : shop // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$QuestDetail {

 int get id; String get name; String get description; QuestStatus get status; RewardType get rewardType; QuestTarget get target; int get prizeIqc; double get progress; int get completedCount; String? get brand; String? get drug; List<QuestMechanic> get mechanics; String get startDate; String? get endDate; String get repeatability;// 'once' | 'unlimited'
 int? get perUserLimit; int? get participantLimit; int get participants; List<TopSeller> get topSellers; int get goal; int get myCount; bool get rewardReceived;
/// Create a copy of QuestDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestDetailCopyWith<QuestDetail> get copyWith => _$QuestDetailCopyWithImpl<QuestDetail>(this as QuestDetail, _$identity);

  /// Serializes this QuestDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.rewardType, rewardType) || other.rewardType == rewardType)&&(identical(other.target, target) || other.target == target)&&(identical(other.prizeIqc, prizeIqc) || other.prizeIqc == prizeIqc)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.completedCount, completedCount) || other.completedCount == completedCount)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.drug, drug) || other.drug == drug)&&const DeepCollectionEquality().equals(other.mechanics, mechanics)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.repeatability, repeatability) || other.repeatability == repeatability)&&(identical(other.perUserLimit, perUserLimit) || other.perUserLimit == perUserLimit)&&(identical(other.participantLimit, participantLimit) || other.participantLimit == participantLimit)&&(identical(other.participants, participants) || other.participants == participants)&&const DeepCollectionEquality().equals(other.topSellers, topSellers)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.myCount, myCount) || other.myCount == myCount)&&(identical(other.rewardReceived, rewardReceived) || other.rewardReceived == rewardReceived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,description,status,rewardType,target,prizeIqc,progress,completedCount,brand,drug,const DeepCollectionEquality().hash(mechanics),startDate,endDate,repeatability,perUserLimit,participantLimit,participants,const DeepCollectionEquality().hash(topSellers),goal,myCount,rewardReceived]);

@override
String toString() {
  return 'QuestDetail(id: $id, name: $name, description: $description, status: $status, rewardType: $rewardType, target: $target, prizeIqc: $prizeIqc, progress: $progress, completedCount: $completedCount, brand: $brand, drug: $drug, mechanics: $mechanics, startDate: $startDate, endDate: $endDate, repeatability: $repeatability, perUserLimit: $perUserLimit, participantLimit: $participantLimit, participants: $participants, topSellers: $topSellers, goal: $goal, myCount: $myCount, rewardReceived: $rewardReceived)';
}


}

/// @nodoc
abstract mixin class $QuestDetailCopyWith<$Res>  {
  factory $QuestDetailCopyWith(QuestDetail value, $Res Function(QuestDetail) _then) = _$QuestDetailCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description, QuestStatus status, RewardType rewardType, QuestTarget target, int prizeIqc, double progress, int completedCount, String? brand, String? drug, List<QuestMechanic> mechanics, String startDate, String? endDate, String repeatability, int? perUserLimit, int? participantLimit, int participants, List<TopSeller> topSellers, int goal, int myCount, bool rewardReceived
});




}
/// @nodoc
class _$QuestDetailCopyWithImpl<$Res>
    implements $QuestDetailCopyWith<$Res> {
  _$QuestDetailCopyWithImpl(this._self, this._then);

  final QuestDetail _self;
  final $Res Function(QuestDetail) _then;

/// Create a copy of QuestDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? status = null,Object? rewardType = null,Object? target = null,Object? prizeIqc = null,Object? progress = null,Object? completedCount = null,Object? brand = freezed,Object? drug = freezed,Object? mechanics = null,Object? startDate = null,Object? endDate = freezed,Object? repeatability = null,Object? perUserLimit = freezed,Object? participantLimit = freezed,Object? participants = null,Object? topSellers = null,Object? goal = null,Object? myCount = null,Object? rewardReceived = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QuestStatus,rewardType: null == rewardType ? _self.rewardType : rewardType // ignore: cast_nullable_to_non_nullable
as RewardType,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as QuestTarget,prizeIqc: null == prizeIqc ? _self.prizeIqc : prizeIqc // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,completedCount: null == completedCount ? _self.completedCount : completedCount // ignore: cast_nullable_to_non_nullable
as int,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,drug: freezed == drug ? _self.drug : drug // ignore: cast_nullable_to_non_nullable
as String?,mechanics: null == mechanics ? _self.mechanics : mechanics // ignore: cast_nullable_to_non_nullable
as List<QuestMechanic>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,repeatability: null == repeatability ? _self.repeatability : repeatability // ignore: cast_nullable_to_non_nullable
as String,perUserLimit: freezed == perUserLimit ? _self.perUserLimit : perUserLimit // ignore: cast_nullable_to_non_nullable
as int?,participantLimit: freezed == participantLimit ? _self.participantLimit : participantLimit // ignore: cast_nullable_to_non_nullable
as int?,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as int,topSellers: null == topSellers ? _self.topSellers : topSellers // ignore: cast_nullable_to_non_nullable
as List<TopSeller>,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int,myCount: null == myCount ? _self.myCount : myCount // ignore: cast_nullable_to_non_nullable
as int,rewardReceived: null == rewardReceived ? _self.rewardReceived : rewardReceived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestDetail].
extension QuestDetailPatterns on QuestDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestDetail value)  $default,){
final _that = this;
switch (_that) {
case _QuestDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestDetail value)?  $default,){
final _that = this;
switch (_that) {
case _QuestDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description,  QuestStatus status,  RewardType rewardType,  QuestTarget target,  int prizeIqc,  double progress,  int completedCount,  String? brand,  String? drug,  List<QuestMechanic> mechanics,  String startDate,  String? endDate,  String repeatability,  int? perUserLimit,  int? participantLimit,  int participants,  List<TopSeller> topSellers,  int goal,  int myCount,  bool rewardReceived)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestDetail() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.status,_that.rewardType,_that.target,_that.prizeIqc,_that.progress,_that.completedCount,_that.brand,_that.drug,_that.mechanics,_that.startDate,_that.endDate,_that.repeatability,_that.perUserLimit,_that.participantLimit,_that.participants,_that.topSellers,_that.goal,_that.myCount,_that.rewardReceived);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description,  QuestStatus status,  RewardType rewardType,  QuestTarget target,  int prizeIqc,  double progress,  int completedCount,  String? brand,  String? drug,  List<QuestMechanic> mechanics,  String startDate,  String? endDate,  String repeatability,  int? perUserLimit,  int? participantLimit,  int participants,  List<TopSeller> topSellers,  int goal,  int myCount,  bool rewardReceived)  $default,) {final _that = this;
switch (_that) {
case _QuestDetail():
return $default(_that.id,_that.name,_that.description,_that.status,_that.rewardType,_that.target,_that.prizeIqc,_that.progress,_that.completedCount,_that.brand,_that.drug,_that.mechanics,_that.startDate,_that.endDate,_that.repeatability,_that.perUserLimit,_that.participantLimit,_that.participants,_that.topSellers,_that.goal,_that.myCount,_that.rewardReceived);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description,  QuestStatus status,  RewardType rewardType,  QuestTarget target,  int prizeIqc,  double progress,  int completedCount,  String? brand,  String? drug,  List<QuestMechanic> mechanics,  String startDate,  String? endDate,  String repeatability,  int? perUserLimit,  int? participantLimit,  int participants,  List<TopSeller> topSellers,  int goal,  int myCount,  bool rewardReceived)?  $default,) {final _that = this;
switch (_that) {
case _QuestDetail() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.status,_that.rewardType,_that.target,_that.prizeIqc,_that.progress,_that.completedCount,_that.brand,_that.drug,_that.mechanics,_that.startDate,_that.endDate,_that.repeatability,_that.perUserLimit,_that.participantLimit,_that.participants,_that.topSellers,_that.goal,_that.myCount,_that.rewardReceived);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuestDetail implements QuestDetail {
  const _QuestDetail({required this.id, required this.name, required this.description, required this.status, required this.rewardType, required this.target, required this.prizeIqc, required this.progress, required this.completedCount, this.brand, this.drug, required final  List<QuestMechanic> mechanics, required this.startDate, this.endDate, required this.repeatability, this.perUserLimit, this.participantLimit, required this.participants, required final  List<TopSeller> topSellers, required this.goal, required this.myCount, required this.rewardReceived}): _mechanics = mechanics,_topSellers = topSellers;
  factory _QuestDetail.fromJson(Map<String, dynamic> json) => _$QuestDetailFromJson(json);

@override final  int id;
@override final  String name;
@override final  String description;
@override final  QuestStatus status;
@override final  RewardType rewardType;
@override final  QuestTarget target;
@override final  int prizeIqc;
@override final  double progress;
@override final  int completedCount;
@override final  String? brand;
@override final  String? drug;
 final  List<QuestMechanic> _mechanics;
@override List<QuestMechanic> get mechanics {
  if (_mechanics is EqualUnmodifiableListView) return _mechanics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mechanics);
}

@override final  String startDate;
@override final  String? endDate;
@override final  String repeatability;
// 'once' | 'unlimited'
@override final  int? perUserLimit;
@override final  int? participantLimit;
@override final  int participants;
 final  List<TopSeller> _topSellers;
@override List<TopSeller> get topSellers {
  if (_topSellers is EqualUnmodifiableListView) return _topSellers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topSellers);
}

@override final  int goal;
@override final  int myCount;
@override final  bool rewardReceived;

/// Create a copy of QuestDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestDetailCopyWith<_QuestDetail> get copyWith => __$QuestDetailCopyWithImpl<_QuestDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.rewardType, rewardType) || other.rewardType == rewardType)&&(identical(other.target, target) || other.target == target)&&(identical(other.prizeIqc, prizeIqc) || other.prizeIqc == prizeIqc)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.completedCount, completedCount) || other.completedCount == completedCount)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.drug, drug) || other.drug == drug)&&const DeepCollectionEquality().equals(other._mechanics, _mechanics)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.repeatability, repeatability) || other.repeatability == repeatability)&&(identical(other.perUserLimit, perUserLimit) || other.perUserLimit == perUserLimit)&&(identical(other.participantLimit, participantLimit) || other.participantLimit == participantLimit)&&(identical(other.participants, participants) || other.participants == participants)&&const DeepCollectionEquality().equals(other._topSellers, _topSellers)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.myCount, myCount) || other.myCount == myCount)&&(identical(other.rewardReceived, rewardReceived) || other.rewardReceived == rewardReceived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,description,status,rewardType,target,prizeIqc,progress,completedCount,brand,drug,const DeepCollectionEquality().hash(_mechanics),startDate,endDate,repeatability,perUserLimit,participantLimit,participants,const DeepCollectionEquality().hash(_topSellers),goal,myCount,rewardReceived]);

@override
String toString() {
  return 'QuestDetail(id: $id, name: $name, description: $description, status: $status, rewardType: $rewardType, target: $target, prizeIqc: $prizeIqc, progress: $progress, completedCount: $completedCount, brand: $brand, drug: $drug, mechanics: $mechanics, startDate: $startDate, endDate: $endDate, repeatability: $repeatability, perUserLimit: $perUserLimit, participantLimit: $participantLimit, participants: $participants, topSellers: $topSellers, goal: $goal, myCount: $myCount, rewardReceived: $rewardReceived)';
}


}

/// @nodoc
abstract mixin class _$QuestDetailCopyWith<$Res> implements $QuestDetailCopyWith<$Res> {
  factory _$QuestDetailCopyWith(_QuestDetail value, $Res Function(_QuestDetail) _then) = __$QuestDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description, QuestStatus status, RewardType rewardType, QuestTarget target, int prizeIqc, double progress, int completedCount, String? brand, String? drug, List<QuestMechanic> mechanics, String startDate, String? endDate, String repeatability, int? perUserLimit, int? participantLimit, int participants, List<TopSeller> topSellers, int goal, int myCount, bool rewardReceived
});




}
/// @nodoc
class __$QuestDetailCopyWithImpl<$Res>
    implements _$QuestDetailCopyWith<$Res> {
  __$QuestDetailCopyWithImpl(this._self, this._then);

  final _QuestDetail _self;
  final $Res Function(_QuestDetail) _then;

/// Create a copy of QuestDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? status = null,Object? rewardType = null,Object? target = null,Object? prizeIqc = null,Object? progress = null,Object? completedCount = null,Object? brand = freezed,Object? drug = freezed,Object? mechanics = null,Object? startDate = null,Object? endDate = freezed,Object? repeatability = null,Object? perUserLimit = freezed,Object? participantLimit = freezed,Object? participants = null,Object? topSellers = null,Object? goal = null,Object? myCount = null,Object? rewardReceived = null,}) {
  return _then(_QuestDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QuestStatus,rewardType: null == rewardType ? _self.rewardType : rewardType // ignore: cast_nullable_to_non_nullable
as RewardType,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as QuestTarget,prizeIqc: null == prizeIqc ? _self.prizeIqc : prizeIqc // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,completedCount: null == completedCount ? _self.completedCount : completedCount // ignore: cast_nullable_to_non_nullable
as int,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,drug: freezed == drug ? _self.drug : drug // ignore: cast_nullable_to_non_nullable
as String?,mechanics: null == mechanics ? _self._mechanics : mechanics // ignore: cast_nullable_to_non_nullable
as List<QuestMechanic>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,repeatability: null == repeatability ? _self.repeatability : repeatability // ignore: cast_nullable_to_non_nullable
as String,perUserLimit: freezed == perUserLimit ? _self.perUserLimit : perUserLimit // ignore: cast_nullable_to_non_nullable
as int?,participantLimit: freezed == participantLimit ? _self.participantLimit : participantLimit // ignore: cast_nullable_to_non_nullable
as int?,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as int,topSellers: null == topSellers ? _self._topSellers : topSellers // ignore: cast_nullable_to_non_nullable
as List<TopSeller>,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int,myCount: null == myCount ? _self.myCount : myCount // ignore: cast_nullable_to_non_nullable
as int,rewardReceived: null == rewardReceived ? _self.rewardReceived : rewardReceived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$QuestParticipation {

 int get questId; String get questName; String get completedAt; RewardType get rewardType; int get rewardIqc; bool get rewardReceived;
/// Create a copy of QuestParticipation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestParticipationCopyWith<QuestParticipation> get copyWith => _$QuestParticipationCopyWithImpl<QuestParticipation>(this as QuestParticipation, _$identity);

  /// Serializes this QuestParticipation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestParticipation&&(identical(other.questId, questId) || other.questId == questId)&&(identical(other.questName, questName) || other.questName == questName)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.rewardType, rewardType) || other.rewardType == rewardType)&&(identical(other.rewardIqc, rewardIqc) || other.rewardIqc == rewardIqc)&&(identical(other.rewardReceived, rewardReceived) || other.rewardReceived == rewardReceived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questId,questName,completedAt,rewardType,rewardIqc,rewardReceived);

@override
String toString() {
  return 'QuestParticipation(questId: $questId, questName: $questName, completedAt: $completedAt, rewardType: $rewardType, rewardIqc: $rewardIqc, rewardReceived: $rewardReceived)';
}


}

/// @nodoc
abstract mixin class $QuestParticipationCopyWith<$Res>  {
  factory $QuestParticipationCopyWith(QuestParticipation value, $Res Function(QuestParticipation) _then) = _$QuestParticipationCopyWithImpl;
@useResult
$Res call({
 int questId, String questName, String completedAt, RewardType rewardType, int rewardIqc, bool rewardReceived
});




}
/// @nodoc
class _$QuestParticipationCopyWithImpl<$Res>
    implements $QuestParticipationCopyWith<$Res> {
  _$QuestParticipationCopyWithImpl(this._self, this._then);

  final QuestParticipation _self;
  final $Res Function(QuestParticipation) _then;

/// Create a copy of QuestParticipation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questId = null,Object? questName = null,Object? completedAt = null,Object? rewardType = null,Object? rewardIqc = null,Object? rewardReceived = null,}) {
  return _then(_self.copyWith(
questId: null == questId ? _self.questId : questId // ignore: cast_nullable_to_non_nullable
as int,questName: null == questName ? _self.questName : questName // ignore: cast_nullable_to_non_nullable
as String,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String,rewardType: null == rewardType ? _self.rewardType : rewardType // ignore: cast_nullable_to_non_nullable
as RewardType,rewardIqc: null == rewardIqc ? _self.rewardIqc : rewardIqc // ignore: cast_nullable_to_non_nullable
as int,rewardReceived: null == rewardReceived ? _self.rewardReceived : rewardReceived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestParticipation].
extension QuestParticipationPatterns on QuestParticipation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestParticipation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestParticipation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestParticipation value)  $default,){
final _that = this;
switch (_that) {
case _QuestParticipation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestParticipation value)?  $default,){
final _that = this;
switch (_that) {
case _QuestParticipation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int questId,  String questName,  String completedAt,  RewardType rewardType,  int rewardIqc,  bool rewardReceived)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestParticipation() when $default != null:
return $default(_that.questId,_that.questName,_that.completedAt,_that.rewardType,_that.rewardIqc,_that.rewardReceived);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int questId,  String questName,  String completedAt,  RewardType rewardType,  int rewardIqc,  bool rewardReceived)  $default,) {final _that = this;
switch (_that) {
case _QuestParticipation():
return $default(_that.questId,_that.questName,_that.completedAt,_that.rewardType,_that.rewardIqc,_that.rewardReceived);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int questId,  String questName,  String completedAt,  RewardType rewardType,  int rewardIqc,  bool rewardReceived)?  $default,) {final _that = this;
switch (_that) {
case _QuestParticipation() when $default != null:
return $default(_that.questId,_that.questName,_that.completedAt,_that.rewardType,_that.rewardIqc,_that.rewardReceived);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuestParticipation implements QuestParticipation {
  const _QuestParticipation({required this.questId, required this.questName, required this.completedAt, required this.rewardType, required this.rewardIqc, required this.rewardReceived});
  factory _QuestParticipation.fromJson(Map<String, dynamic> json) => _$QuestParticipationFromJson(json);

@override final  int questId;
@override final  String questName;
@override final  String completedAt;
@override final  RewardType rewardType;
@override final  int rewardIqc;
@override final  bool rewardReceived;

/// Create a copy of QuestParticipation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestParticipationCopyWith<_QuestParticipation> get copyWith => __$QuestParticipationCopyWithImpl<_QuestParticipation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestParticipationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestParticipation&&(identical(other.questId, questId) || other.questId == questId)&&(identical(other.questName, questName) || other.questName == questName)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.rewardType, rewardType) || other.rewardType == rewardType)&&(identical(other.rewardIqc, rewardIqc) || other.rewardIqc == rewardIqc)&&(identical(other.rewardReceived, rewardReceived) || other.rewardReceived == rewardReceived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questId,questName,completedAt,rewardType,rewardIqc,rewardReceived);

@override
String toString() {
  return 'QuestParticipation(questId: $questId, questName: $questName, completedAt: $completedAt, rewardType: $rewardType, rewardIqc: $rewardIqc, rewardReceived: $rewardReceived)';
}


}

/// @nodoc
abstract mixin class _$QuestParticipationCopyWith<$Res> implements $QuestParticipationCopyWith<$Res> {
  factory _$QuestParticipationCopyWith(_QuestParticipation value, $Res Function(_QuestParticipation) _then) = __$QuestParticipationCopyWithImpl;
@override @useResult
$Res call({
 int questId, String questName, String completedAt, RewardType rewardType, int rewardIqc, bool rewardReceived
});




}
/// @nodoc
class __$QuestParticipationCopyWithImpl<$Res>
    implements _$QuestParticipationCopyWith<$Res> {
  __$QuestParticipationCopyWithImpl(this._self, this._then);

  final _QuestParticipation _self;
  final $Res Function(_QuestParticipation) _then;

/// Create a copy of QuestParticipation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questId = null,Object? questName = null,Object? completedAt = null,Object? rewardType = null,Object? rewardIqc = null,Object? rewardReceived = null,}) {
  return _then(_QuestParticipation(
questId: null == questId ? _self.questId : questId // ignore: cast_nullable_to_non_nullable
as int,questName: null == questName ? _self.questName : questName // ignore: cast_nullable_to_non_nullable
as String,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String,rewardType: null == rewardType ? _self.rewardType : rewardType // ignore: cast_nullable_to_non_nullable
as RewardType,rewardIqc: null == rewardIqc ? _self.rewardIqc : rewardIqc // ignore: cast_nullable_to_non_nullable
as int,rewardReceived: null == rewardReceived ? _self.rewardReceived : rewardReceived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
