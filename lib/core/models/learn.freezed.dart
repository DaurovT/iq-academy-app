// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learn.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Course {

 int get id; String get title; String get description; int get lessonCount; double get progress; String? get ownerBrand; String? get coverUrl; String? get category; String? get targetCity; String? get targetSpecialty; bool? get mandatory; bool? get isNew;
/// Create a copy of Course
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseCopyWith<Course> get copyWith => _$CourseCopyWithImpl<Course>(this as Course, _$identity);

  /// Serializes this Course to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Course&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.lessonCount, lessonCount) || other.lessonCount == lessonCount)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.ownerBrand, ownerBrand) || other.ownerBrand == ownerBrand)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.category, category) || other.category == category)&&(identical(other.targetCity, targetCity) || other.targetCity == targetCity)&&(identical(other.targetSpecialty, targetSpecialty) || other.targetSpecialty == targetSpecialty)&&(identical(other.mandatory, mandatory) || other.mandatory == mandatory)&&(identical(other.isNew, isNew) || other.isNew == isNew));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,lessonCount,progress,ownerBrand,coverUrl,category,targetCity,targetSpecialty,mandatory,isNew);

@override
String toString() {
  return 'Course(id: $id, title: $title, description: $description, lessonCount: $lessonCount, progress: $progress, ownerBrand: $ownerBrand, coverUrl: $coverUrl, category: $category, targetCity: $targetCity, targetSpecialty: $targetSpecialty, mandatory: $mandatory, isNew: $isNew)';
}


}

/// @nodoc
abstract mixin class $CourseCopyWith<$Res>  {
  factory $CourseCopyWith(Course value, $Res Function(Course) _then) = _$CourseCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, int lessonCount, double progress, String? ownerBrand, String? coverUrl, String? category, String? targetCity, String? targetSpecialty, bool? mandatory, bool? isNew
});




}
/// @nodoc
class _$CourseCopyWithImpl<$Res>
    implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._self, this._then);

  final Course _self;
  final $Res Function(Course) _then;

/// Create a copy of Course
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? lessonCount = null,Object? progress = null,Object? ownerBrand = freezed,Object? coverUrl = freezed,Object? category = freezed,Object? targetCity = freezed,Object? targetSpecialty = freezed,Object? mandatory = freezed,Object? isNew = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,lessonCount: null == lessonCount ? _self.lessonCount : lessonCount // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,ownerBrand: freezed == ownerBrand ? _self.ownerBrand : ownerBrand // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,targetCity: freezed == targetCity ? _self.targetCity : targetCity // ignore: cast_nullable_to_non_nullable
as String?,targetSpecialty: freezed == targetSpecialty ? _self.targetSpecialty : targetSpecialty // ignore: cast_nullable_to_non_nullable
as String?,mandatory: freezed == mandatory ? _self.mandatory : mandatory // ignore: cast_nullable_to_non_nullable
as bool?,isNew: freezed == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Course].
extension CoursePatterns on Course {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Course value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Course() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Course value)  $default,){
final _that = this;
switch (_that) {
case _Course():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Course value)?  $default,){
final _that = this;
switch (_that) {
case _Course() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String description,  int lessonCount,  double progress,  String? ownerBrand,  String? coverUrl,  String? category,  String? targetCity,  String? targetSpecialty,  bool? mandatory,  bool? isNew)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Course() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.lessonCount,_that.progress,_that.ownerBrand,_that.coverUrl,_that.category,_that.targetCity,_that.targetSpecialty,_that.mandatory,_that.isNew);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String description,  int lessonCount,  double progress,  String? ownerBrand,  String? coverUrl,  String? category,  String? targetCity,  String? targetSpecialty,  bool? mandatory,  bool? isNew)  $default,) {final _that = this;
switch (_that) {
case _Course():
return $default(_that.id,_that.title,_that.description,_that.lessonCount,_that.progress,_that.ownerBrand,_that.coverUrl,_that.category,_that.targetCity,_that.targetSpecialty,_that.mandatory,_that.isNew);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String description,  int lessonCount,  double progress,  String? ownerBrand,  String? coverUrl,  String? category,  String? targetCity,  String? targetSpecialty,  bool? mandatory,  bool? isNew)?  $default,) {final _that = this;
switch (_that) {
case _Course() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.lessonCount,_that.progress,_that.ownerBrand,_that.coverUrl,_that.category,_that.targetCity,_that.targetSpecialty,_that.mandatory,_that.isNew);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Course implements Course {
  const _Course({required this.id, required this.title, required this.description, required this.lessonCount, required this.progress, this.ownerBrand, this.coverUrl, this.category, this.targetCity, this.targetSpecialty, this.mandatory, this.isNew});
  factory _Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

@override final  int id;
@override final  String title;
@override final  String description;
@override final  int lessonCount;
@override final  double progress;
@override final  String? ownerBrand;
@override final  String? coverUrl;
@override final  String? category;
@override final  String? targetCity;
@override final  String? targetSpecialty;
@override final  bool? mandatory;
@override final  bool? isNew;

/// Create a copy of Course
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseCopyWith<_Course> get copyWith => __$CourseCopyWithImpl<_Course>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Course&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.lessonCount, lessonCount) || other.lessonCount == lessonCount)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.ownerBrand, ownerBrand) || other.ownerBrand == ownerBrand)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.category, category) || other.category == category)&&(identical(other.targetCity, targetCity) || other.targetCity == targetCity)&&(identical(other.targetSpecialty, targetSpecialty) || other.targetSpecialty == targetSpecialty)&&(identical(other.mandatory, mandatory) || other.mandatory == mandatory)&&(identical(other.isNew, isNew) || other.isNew == isNew));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,lessonCount,progress,ownerBrand,coverUrl,category,targetCity,targetSpecialty,mandatory,isNew);

@override
String toString() {
  return 'Course(id: $id, title: $title, description: $description, lessonCount: $lessonCount, progress: $progress, ownerBrand: $ownerBrand, coverUrl: $coverUrl, category: $category, targetCity: $targetCity, targetSpecialty: $targetSpecialty, mandatory: $mandatory, isNew: $isNew)';
}


}

/// @nodoc
abstract mixin class _$CourseCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$CourseCopyWith(_Course value, $Res Function(_Course) _then) = __$CourseCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, int lessonCount, double progress, String? ownerBrand, String? coverUrl, String? category, String? targetCity, String? targetSpecialty, bool? mandatory, bool? isNew
});




}
/// @nodoc
class __$CourseCopyWithImpl<$Res>
    implements _$CourseCopyWith<$Res> {
  __$CourseCopyWithImpl(this._self, this._then);

  final _Course _self;
  final $Res Function(_Course) _then;

/// Create a copy of Course
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? lessonCount = null,Object? progress = null,Object? ownerBrand = freezed,Object? coverUrl = freezed,Object? category = freezed,Object? targetCity = freezed,Object? targetSpecialty = freezed,Object? mandatory = freezed,Object? isNew = freezed,}) {
  return _then(_Course(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,lessonCount: null == lessonCount ? _self.lessonCount : lessonCount // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,ownerBrand: freezed == ownerBrand ? _self.ownerBrand : ownerBrand // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,targetCity: freezed == targetCity ? _self.targetCity : targetCity // ignore: cast_nullable_to_non_nullable
as String?,targetSpecialty: freezed == targetSpecialty ? _self.targetSpecialty : targetSpecialty // ignore: cast_nullable_to_non_nullable
as String?,mandatory: freezed == mandatory ? _self.mandatory : mandatory // ignore: cast_nullable_to_non_nullable
as bool?,isNew: freezed == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$Lesson {

 int get id; String get title; String get kind;// 'video' | 'quiz'
 int get durationMin; bool get completed; int get rewardIqc; int? get videoDurationSec; String? get videoUrl; bool? get locked;
/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonCopyWith<Lesson> get copyWith => _$LessonCopyWithImpl<Lesson>(this as Lesson, _$identity);

  /// Serializes this Lesson to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Lesson&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.durationMin, durationMin) || other.durationMin == durationMin)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.rewardIqc, rewardIqc) || other.rewardIqc == rewardIqc)&&(identical(other.videoDurationSec, videoDurationSec) || other.videoDurationSec == videoDurationSec)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.locked, locked) || other.locked == locked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,kind,durationMin,completed,rewardIqc,videoDurationSec,videoUrl,locked);

@override
String toString() {
  return 'Lesson(id: $id, title: $title, kind: $kind, durationMin: $durationMin, completed: $completed, rewardIqc: $rewardIqc, videoDurationSec: $videoDurationSec, videoUrl: $videoUrl, locked: $locked)';
}


}

/// @nodoc
abstract mixin class $LessonCopyWith<$Res>  {
  factory $LessonCopyWith(Lesson value, $Res Function(Lesson) _then) = _$LessonCopyWithImpl;
@useResult
$Res call({
 int id, String title, String kind, int durationMin, bool completed, int rewardIqc, int? videoDurationSec, String? videoUrl, bool? locked
});




}
/// @nodoc
class _$LessonCopyWithImpl<$Res>
    implements $LessonCopyWith<$Res> {
  _$LessonCopyWithImpl(this._self, this._then);

  final Lesson _self;
  final $Res Function(Lesson) _then;

/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? kind = null,Object? durationMin = null,Object? completed = null,Object? rewardIqc = null,Object? videoDurationSec = freezed,Object? videoUrl = freezed,Object? locked = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,durationMin: null == durationMin ? _self.durationMin : durationMin // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,rewardIqc: null == rewardIqc ? _self.rewardIqc : rewardIqc // ignore: cast_nullable_to_non_nullable
as int,videoDurationSec: freezed == videoDurationSec ? _self.videoDurationSec : videoDurationSec // ignore: cast_nullable_to_non_nullable
as int?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,locked: freezed == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Lesson].
extension LessonPatterns on Lesson {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Lesson value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Lesson() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Lesson value)  $default,){
final _that = this;
switch (_that) {
case _Lesson():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Lesson value)?  $default,){
final _that = this;
switch (_that) {
case _Lesson() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String kind,  int durationMin,  bool completed,  int rewardIqc,  int? videoDurationSec,  String? videoUrl,  bool? locked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Lesson() when $default != null:
return $default(_that.id,_that.title,_that.kind,_that.durationMin,_that.completed,_that.rewardIqc,_that.videoDurationSec,_that.videoUrl,_that.locked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String kind,  int durationMin,  bool completed,  int rewardIqc,  int? videoDurationSec,  String? videoUrl,  bool? locked)  $default,) {final _that = this;
switch (_that) {
case _Lesson():
return $default(_that.id,_that.title,_that.kind,_that.durationMin,_that.completed,_that.rewardIqc,_that.videoDurationSec,_that.videoUrl,_that.locked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String kind,  int durationMin,  bool completed,  int rewardIqc,  int? videoDurationSec,  String? videoUrl,  bool? locked)?  $default,) {final _that = this;
switch (_that) {
case _Lesson() when $default != null:
return $default(_that.id,_that.title,_that.kind,_that.durationMin,_that.completed,_that.rewardIqc,_that.videoDurationSec,_that.videoUrl,_that.locked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Lesson implements Lesson {
  const _Lesson({required this.id, required this.title, required this.kind, required this.durationMin, required this.completed, required this.rewardIqc, this.videoDurationSec, this.videoUrl, this.locked});
  factory _Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

@override final  int id;
@override final  String title;
@override final  String kind;
// 'video' | 'quiz'
@override final  int durationMin;
@override final  bool completed;
@override final  int rewardIqc;
@override final  int? videoDurationSec;
@override final  String? videoUrl;
@override final  bool? locked;

/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonCopyWith<_Lesson> get copyWith => __$LessonCopyWithImpl<_Lesson>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LessonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Lesson&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.durationMin, durationMin) || other.durationMin == durationMin)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.rewardIqc, rewardIqc) || other.rewardIqc == rewardIqc)&&(identical(other.videoDurationSec, videoDurationSec) || other.videoDurationSec == videoDurationSec)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.locked, locked) || other.locked == locked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,kind,durationMin,completed,rewardIqc,videoDurationSec,videoUrl,locked);

@override
String toString() {
  return 'Lesson(id: $id, title: $title, kind: $kind, durationMin: $durationMin, completed: $completed, rewardIqc: $rewardIqc, videoDurationSec: $videoDurationSec, videoUrl: $videoUrl, locked: $locked)';
}


}

/// @nodoc
abstract mixin class _$LessonCopyWith<$Res> implements $LessonCopyWith<$Res> {
  factory _$LessonCopyWith(_Lesson value, $Res Function(_Lesson) _then) = __$LessonCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String kind, int durationMin, bool completed, int rewardIqc, int? videoDurationSec, String? videoUrl, bool? locked
});




}
/// @nodoc
class __$LessonCopyWithImpl<$Res>
    implements _$LessonCopyWith<$Res> {
  __$LessonCopyWithImpl(this._self, this._then);

  final _Lesson _self;
  final $Res Function(_Lesson) _then;

/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? kind = null,Object? durationMin = null,Object? completed = null,Object? rewardIqc = null,Object? videoDurationSec = freezed,Object? videoUrl = freezed,Object? locked = freezed,}) {
  return _then(_Lesson(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,durationMin: null == durationMin ? _self.durationMin : durationMin // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,rewardIqc: null == rewardIqc ? _self.rewardIqc : rewardIqc // ignore: cast_nullable_to_non_nullable
as int,videoDurationSec: freezed == videoDurationSec ? _self.videoDurationSec : videoDurationSec // ignore: cast_nullable_to_non_nullable
as int?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,locked: freezed == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$CourseDetail {

 int get id; String get title; String get description; int get lessonCount; double get progress; String? get ownerBrand; String? get coverUrl; String? get category; String? get targetCity; String? get targetSpecialty; bool? get mandatory; bool? get isNew; List<Lesson> get lessons;
/// Create a copy of CourseDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseDetailCopyWith<CourseDetail> get copyWith => _$CourseDetailCopyWithImpl<CourseDetail>(this as CourseDetail, _$identity);

  /// Serializes this CourseDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.lessonCount, lessonCount) || other.lessonCount == lessonCount)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.ownerBrand, ownerBrand) || other.ownerBrand == ownerBrand)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.category, category) || other.category == category)&&(identical(other.targetCity, targetCity) || other.targetCity == targetCity)&&(identical(other.targetSpecialty, targetSpecialty) || other.targetSpecialty == targetSpecialty)&&(identical(other.mandatory, mandatory) || other.mandatory == mandatory)&&(identical(other.isNew, isNew) || other.isNew == isNew)&&const DeepCollectionEquality().equals(other.lessons, lessons));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,lessonCount,progress,ownerBrand,coverUrl,category,targetCity,targetSpecialty,mandatory,isNew,const DeepCollectionEquality().hash(lessons));

@override
String toString() {
  return 'CourseDetail(id: $id, title: $title, description: $description, lessonCount: $lessonCount, progress: $progress, ownerBrand: $ownerBrand, coverUrl: $coverUrl, category: $category, targetCity: $targetCity, targetSpecialty: $targetSpecialty, mandatory: $mandatory, isNew: $isNew, lessons: $lessons)';
}


}

/// @nodoc
abstract mixin class $CourseDetailCopyWith<$Res>  {
  factory $CourseDetailCopyWith(CourseDetail value, $Res Function(CourseDetail) _then) = _$CourseDetailCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, int lessonCount, double progress, String? ownerBrand, String? coverUrl, String? category, String? targetCity, String? targetSpecialty, bool? mandatory, bool? isNew, List<Lesson> lessons
});




}
/// @nodoc
class _$CourseDetailCopyWithImpl<$Res>
    implements $CourseDetailCopyWith<$Res> {
  _$CourseDetailCopyWithImpl(this._self, this._then);

  final CourseDetail _self;
  final $Res Function(CourseDetail) _then;

/// Create a copy of CourseDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? lessonCount = null,Object? progress = null,Object? ownerBrand = freezed,Object? coverUrl = freezed,Object? category = freezed,Object? targetCity = freezed,Object? targetSpecialty = freezed,Object? mandatory = freezed,Object? isNew = freezed,Object? lessons = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,lessonCount: null == lessonCount ? _self.lessonCount : lessonCount // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,ownerBrand: freezed == ownerBrand ? _self.ownerBrand : ownerBrand // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,targetCity: freezed == targetCity ? _self.targetCity : targetCity // ignore: cast_nullable_to_non_nullable
as String?,targetSpecialty: freezed == targetSpecialty ? _self.targetSpecialty : targetSpecialty // ignore: cast_nullable_to_non_nullable
as String?,mandatory: freezed == mandatory ? _self.mandatory : mandatory // ignore: cast_nullable_to_non_nullable
as bool?,isNew: freezed == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool?,lessons: null == lessons ? _self.lessons : lessons // ignore: cast_nullable_to_non_nullable
as List<Lesson>,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseDetail].
extension CourseDetailPatterns on CourseDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourseDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourseDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourseDetail value)  $default,){
final _that = this;
switch (_that) {
case _CourseDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourseDetail value)?  $default,){
final _that = this;
switch (_that) {
case _CourseDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String description,  int lessonCount,  double progress,  String? ownerBrand,  String? coverUrl,  String? category,  String? targetCity,  String? targetSpecialty,  bool? mandatory,  bool? isNew,  List<Lesson> lessons)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseDetail() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.lessonCount,_that.progress,_that.ownerBrand,_that.coverUrl,_that.category,_that.targetCity,_that.targetSpecialty,_that.mandatory,_that.isNew,_that.lessons);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String description,  int lessonCount,  double progress,  String? ownerBrand,  String? coverUrl,  String? category,  String? targetCity,  String? targetSpecialty,  bool? mandatory,  bool? isNew,  List<Lesson> lessons)  $default,) {final _that = this;
switch (_that) {
case _CourseDetail():
return $default(_that.id,_that.title,_that.description,_that.lessonCount,_that.progress,_that.ownerBrand,_that.coverUrl,_that.category,_that.targetCity,_that.targetSpecialty,_that.mandatory,_that.isNew,_that.lessons);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String description,  int lessonCount,  double progress,  String? ownerBrand,  String? coverUrl,  String? category,  String? targetCity,  String? targetSpecialty,  bool? mandatory,  bool? isNew,  List<Lesson> lessons)?  $default,) {final _that = this;
switch (_that) {
case _CourseDetail() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.lessonCount,_that.progress,_that.ownerBrand,_that.coverUrl,_that.category,_that.targetCity,_that.targetSpecialty,_that.mandatory,_that.isNew,_that.lessons);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CourseDetail implements CourseDetail {
  const _CourseDetail({required this.id, required this.title, required this.description, required this.lessonCount, required this.progress, this.ownerBrand, this.coverUrl, this.category, this.targetCity, this.targetSpecialty, this.mandatory, this.isNew, required final  List<Lesson> lessons}): _lessons = lessons;
  factory _CourseDetail.fromJson(Map<String, dynamic> json) => _$CourseDetailFromJson(json);

@override final  int id;
@override final  String title;
@override final  String description;
@override final  int lessonCount;
@override final  double progress;
@override final  String? ownerBrand;
@override final  String? coverUrl;
@override final  String? category;
@override final  String? targetCity;
@override final  String? targetSpecialty;
@override final  bool? mandatory;
@override final  bool? isNew;
 final  List<Lesson> _lessons;
@override List<Lesson> get lessons {
  if (_lessons is EqualUnmodifiableListView) return _lessons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lessons);
}


/// Create a copy of CourseDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseDetailCopyWith<_CourseDetail> get copyWith => __$CourseDetailCopyWithImpl<_CourseDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourseDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.lessonCount, lessonCount) || other.lessonCount == lessonCount)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.ownerBrand, ownerBrand) || other.ownerBrand == ownerBrand)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.category, category) || other.category == category)&&(identical(other.targetCity, targetCity) || other.targetCity == targetCity)&&(identical(other.targetSpecialty, targetSpecialty) || other.targetSpecialty == targetSpecialty)&&(identical(other.mandatory, mandatory) || other.mandatory == mandatory)&&(identical(other.isNew, isNew) || other.isNew == isNew)&&const DeepCollectionEquality().equals(other._lessons, _lessons));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,lessonCount,progress,ownerBrand,coverUrl,category,targetCity,targetSpecialty,mandatory,isNew,const DeepCollectionEquality().hash(_lessons));

@override
String toString() {
  return 'CourseDetail(id: $id, title: $title, description: $description, lessonCount: $lessonCount, progress: $progress, ownerBrand: $ownerBrand, coverUrl: $coverUrl, category: $category, targetCity: $targetCity, targetSpecialty: $targetSpecialty, mandatory: $mandatory, isNew: $isNew, lessons: $lessons)';
}


}

/// @nodoc
abstract mixin class _$CourseDetailCopyWith<$Res> implements $CourseDetailCopyWith<$Res> {
  factory _$CourseDetailCopyWith(_CourseDetail value, $Res Function(_CourseDetail) _then) = __$CourseDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, int lessonCount, double progress, String? ownerBrand, String? coverUrl, String? category, String? targetCity, String? targetSpecialty, bool? mandatory, bool? isNew, List<Lesson> lessons
});




}
/// @nodoc
class __$CourseDetailCopyWithImpl<$Res>
    implements _$CourseDetailCopyWith<$Res> {
  __$CourseDetailCopyWithImpl(this._self, this._then);

  final _CourseDetail _self;
  final $Res Function(_CourseDetail) _then;

/// Create a copy of CourseDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? lessonCount = null,Object? progress = null,Object? ownerBrand = freezed,Object? coverUrl = freezed,Object? category = freezed,Object? targetCity = freezed,Object? targetSpecialty = freezed,Object? mandatory = freezed,Object? isNew = freezed,Object? lessons = null,}) {
  return _then(_CourseDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,lessonCount: null == lessonCount ? _self.lessonCount : lessonCount // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,ownerBrand: freezed == ownerBrand ? _self.ownerBrand : ownerBrand // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,targetCity: freezed == targetCity ? _self.targetCity : targetCity // ignore: cast_nullable_to_non_nullable
as String?,targetSpecialty: freezed == targetSpecialty ? _self.targetSpecialty : targetSpecialty // ignore: cast_nullable_to_non_nullable
as String?,mandatory: freezed == mandatory ? _self.mandatory : mandatory // ignore: cast_nullable_to_non_nullable
as bool?,isNew: freezed == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool?,lessons: null == lessons ? _self._lessons : lessons // ignore: cast_nullable_to_non_nullable
as List<Lesson>,
  ));
}


}


/// @nodoc
mixin _$QuizQuestion {

 int get id; QuizQuestionType get type; String get text; String? get imageUrl; List<String>? get options; String? get numericHint; List<String>? get matchLeft;
/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizQuestionCopyWith<QuizQuestion> get copyWith => _$QuizQuestionCopyWithImpl<QuizQuestion>(this as QuizQuestion, _$identity);

  /// Serializes this QuizQuestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.numericHint, numericHint) || other.numericHint == numericHint)&&const DeepCollectionEquality().equals(other.matchLeft, matchLeft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,text,imageUrl,const DeepCollectionEquality().hash(options),numericHint,const DeepCollectionEquality().hash(matchLeft));

@override
String toString() {
  return 'QuizQuestion(id: $id, type: $type, text: $text, imageUrl: $imageUrl, options: $options, numericHint: $numericHint, matchLeft: $matchLeft)';
}


}

/// @nodoc
abstract mixin class $QuizQuestionCopyWith<$Res>  {
  factory $QuizQuestionCopyWith(QuizQuestion value, $Res Function(QuizQuestion) _then) = _$QuizQuestionCopyWithImpl;
@useResult
$Res call({
 int id, QuizQuestionType type, String text, String? imageUrl, List<String>? options, String? numericHint, List<String>? matchLeft
});




}
/// @nodoc
class _$QuizQuestionCopyWithImpl<$Res>
    implements $QuizQuestionCopyWith<$Res> {
  _$QuizQuestionCopyWithImpl(this._self, this._then);

  final QuizQuestion _self;
  final $Res Function(QuizQuestion) _then;

/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? text = null,Object? imageUrl = freezed,Object? options = freezed,Object? numericHint = freezed,Object? matchLeft = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QuizQuestionType,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>?,numericHint: freezed == numericHint ? _self.numericHint : numericHint // ignore: cast_nullable_to_non_nullable
as String?,matchLeft: freezed == matchLeft ? _self.matchLeft : matchLeft // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizQuestion].
extension QuizQuestionPatterns on QuizQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizQuestion value)  $default,){
final _that = this;
switch (_that) {
case _QuizQuestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  QuizQuestionType type,  String text,  String? imageUrl,  List<String>? options,  String? numericHint,  List<String>? matchLeft)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
return $default(_that.id,_that.type,_that.text,_that.imageUrl,_that.options,_that.numericHint,_that.matchLeft);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  QuizQuestionType type,  String text,  String? imageUrl,  List<String>? options,  String? numericHint,  List<String>? matchLeft)  $default,) {final _that = this;
switch (_that) {
case _QuizQuestion():
return $default(_that.id,_that.type,_that.text,_that.imageUrl,_that.options,_that.numericHint,_that.matchLeft);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  QuizQuestionType type,  String text,  String? imageUrl,  List<String>? options,  String? numericHint,  List<String>? matchLeft)?  $default,) {final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
return $default(_that.id,_that.type,_that.text,_that.imageUrl,_that.options,_that.numericHint,_that.matchLeft);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizQuestion implements QuizQuestion {
  const _QuizQuestion({required this.id, required this.type, required this.text, this.imageUrl, final  List<String>? options, this.numericHint, final  List<String>? matchLeft}): _options = options,_matchLeft = matchLeft;
  factory _QuizQuestion.fromJson(Map<String, dynamic> json) => _$QuizQuestionFromJson(json);

@override final  int id;
@override final  QuizQuestionType type;
@override final  String text;
@override final  String? imageUrl;
 final  List<String>? _options;
@override List<String>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? numericHint;
 final  List<String>? _matchLeft;
@override List<String>? get matchLeft {
  final value = _matchLeft;
  if (value == null) return null;
  if (_matchLeft is EqualUnmodifiableListView) return _matchLeft;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizQuestionCopyWith<_QuizQuestion> get copyWith => __$QuizQuestionCopyWithImpl<_QuizQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.numericHint, numericHint) || other.numericHint == numericHint)&&const DeepCollectionEquality().equals(other._matchLeft, _matchLeft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,text,imageUrl,const DeepCollectionEquality().hash(_options),numericHint,const DeepCollectionEquality().hash(_matchLeft));

@override
String toString() {
  return 'QuizQuestion(id: $id, type: $type, text: $text, imageUrl: $imageUrl, options: $options, numericHint: $numericHint, matchLeft: $matchLeft)';
}


}

/// @nodoc
abstract mixin class _$QuizQuestionCopyWith<$Res> implements $QuizQuestionCopyWith<$Res> {
  factory _$QuizQuestionCopyWith(_QuizQuestion value, $Res Function(_QuizQuestion) _then) = __$QuizQuestionCopyWithImpl;
@override @useResult
$Res call({
 int id, QuizQuestionType type, String text, String? imageUrl, List<String>? options, String? numericHint, List<String>? matchLeft
});




}
/// @nodoc
class __$QuizQuestionCopyWithImpl<$Res>
    implements _$QuizQuestionCopyWith<$Res> {
  __$QuizQuestionCopyWithImpl(this._self, this._then);

  final _QuizQuestion _self;
  final $Res Function(_QuizQuestion) _then;

/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? text = null,Object? imageUrl = freezed,Object? options = freezed,Object? numericHint = freezed,Object? matchLeft = freezed,}) {
  return _then(_QuizQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QuizQuestionType,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>?,numericHint: freezed == numericHint ? _self.numericHint : numericHint // ignore: cast_nullable_to_non_nullable
as String?,matchLeft: freezed == matchLeft ? _self._matchLeft : matchLeft // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$QuizAttempt {

 int get score; int get total; bool get passed; String get at;
/// Create a copy of QuizAttempt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizAttemptCopyWith<QuizAttempt> get copyWith => _$QuizAttemptCopyWithImpl<QuizAttempt>(this as QuizAttempt, _$identity);

  /// Serializes this QuizAttempt to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizAttempt&&(identical(other.score, score) || other.score == score)&&(identical(other.total, total) || other.total == total)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.at, at) || other.at == at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,score,total,passed,at);

@override
String toString() {
  return 'QuizAttempt(score: $score, total: $total, passed: $passed, at: $at)';
}


}

/// @nodoc
abstract mixin class $QuizAttemptCopyWith<$Res>  {
  factory $QuizAttemptCopyWith(QuizAttempt value, $Res Function(QuizAttempt) _then) = _$QuizAttemptCopyWithImpl;
@useResult
$Res call({
 int score, int total, bool passed, String at
});




}
/// @nodoc
class _$QuizAttemptCopyWithImpl<$Res>
    implements $QuizAttemptCopyWith<$Res> {
  _$QuizAttemptCopyWithImpl(this._self, this._then);

  final QuizAttempt _self;
  final $Res Function(QuizAttempt) _then;

/// Create a copy of QuizAttempt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? score = null,Object? total = null,Object? passed = null,Object? at = null,}) {
  return _then(_self.copyWith(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizAttempt].
extension QuizAttemptPatterns on QuizAttempt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizAttempt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizAttempt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizAttempt value)  $default,){
final _that = this;
switch (_that) {
case _QuizAttempt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizAttempt value)?  $default,){
final _that = this;
switch (_that) {
case _QuizAttempt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int score,  int total,  bool passed,  String at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizAttempt() when $default != null:
return $default(_that.score,_that.total,_that.passed,_that.at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int score,  int total,  bool passed,  String at)  $default,) {final _that = this;
switch (_that) {
case _QuizAttempt():
return $default(_that.score,_that.total,_that.passed,_that.at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int score,  int total,  bool passed,  String at)?  $default,) {final _that = this;
switch (_that) {
case _QuizAttempt() when $default != null:
return $default(_that.score,_that.total,_that.passed,_that.at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizAttempt implements QuizAttempt {
  const _QuizAttempt({required this.score, required this.total, required this.passed, required this.at});
  factory _QuizAttempt.fromJson(Map<String, dynamic> json) => _$QuizAttemptFromJson(json);

@override final  int score;
@override final  int total;
@override final  bool passed;
@override final  String at;

/// Create a copy of QuizAttempt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizAttemptCopyWith<_QuizAttempt> get copyWith => __$QuizAttemptCopyWithImpl<_QuizAttempt>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizAttemptToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizAttempt&&(identical(other.score, score) || other.score == score)&&(identical(other.total, total) || other.total == total)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.at, at) || other.at == at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,score,total,passed,at);

@override
String toString() {
  return 'QuizAttempt(score: $score, total: $total, passed: $passed, at: $at)';
}


}

/// @nodoc
abstract mixin class _$QuizAttemptCopyWith<$Res> implements $QuizAttemptCopyWith<$Res> {
  factory _$QuizAttemptCopyWith(_QuizAttempt value, $Res Function(_QuizAttempt) _then) = __$QuizAttemptCopyWithImpl;
@override @useResult
$Res call({
 int score, int total, bool passed, String at
});




}
/// @nodoc
class __$QuizAttemptCopyWithImpl<$Res>
    implements _$QuizAttemptCopyWith<$Res> {
  __$QuizAttemptCopyWithImpl(this._self, this._then);

  final _QuizAttempt _self;
  final $Res Function(_QuizAttempt) _then;

/// Create a copy of QuizAttempt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? score = null,Object? total = null,Object? passed = null,Object? at = null,}) {
  return _then(_QuizAttempt(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Quiz {

 String get title; int get passScore; List<QuizQuestion> get questions; int? get timeLimitSec; int? get attemptsAllowed; int? get attemptsUsed; List<QuizAttempt>? get history;
/// Create a copy of Quiz
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizCopyWith<Quiz> get copyWith => _$QuizCopyWithImpl<Quiz>(this as Quiz, _$identity);

  /// Serializes this Quiz to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Quiz&&(identical(other.title, title) || other.title == title)&&(identical(other.passScore, passScore) || other.passScore == passScore)&&const DeepCollectionEquality().equals(other.questions, questions)&&(identical(other.timeLimitSec, timeLimitSec) || other.timeLimitSec == timeLimitSec)&&(identical(other.attemptsAllowed, attemptsAllowed) || other.attemptsAllowed == attemptsAllowed)&&(identical(other.attemptsUsed, attemptsUsed) || other.attemptsUsed == attemptsUsed)&&const DeepCollectionEquality().equals(other.history, history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,passScore,const DeepCollectionEquality().hash(questions),timeLimitSec,attemptsAllowed,attemptsUsed,const DeepCollectionEquality().hash(history));

@override
String toString() {
  return 'Quiz(title: $title, passScore: $passScore, questions: $questions, timeLimitSec: $timeLimitSec, attemptsAllowed: $attemptsAllowed, attemptsUsed: $attemptsUsed, history: $history)';
}


}

/// @nodoc
abstract mixin class $QuizCopyWith<$Res>  {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) _then) = _$QuizCopyWithImpl;
@useResult
$Res call({
 String title, int passScore, List<QuizQuestion> questions, int? timeLimitSec, int? attemptsAllowed, int? attemptsUsed, List<QuizAttempt>? history
});




}
/// @nodoc
class _$QuizCopyWithImpl<$Res>
    implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._self, this._then);

  final Quiz _self;
  final $Res Function(Quiz) _then;

/// Create a copy of Quiz
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? passScore = null,Object? questions = null,Object? timeLimitSec = freezed,Object? attemptsAllowed = freezed,Object? attemptsUsed = freezed,Object? history = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,passScore: null == passScore ? _self.passScore : passScore // ignore: cast_nullable_to_non_nullable
as int,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuizQuestion>,timeLimitSec: freezed == timeLimitSec ? _self.timeLimitSec : timeLimitSec // ignore: cast_nullable_to_non_nullable
as int?,attemptsAllowed: freezed == attemptsAllowed ? _self.attemptsAllowed : attemptsAllowed // ignore: cast_nullable_to_non_nullable
as int?,attemptsUsed: freezed == attemptsUsed ? _self.attemptsUsed : attemptsUsed // ignore: cast_nullable_to_non_nullable
as int?,history: freezed == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<QuizAttempt>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Quiz].
extension QuizPatterns on Quiz {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Quiz value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Quiz() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Quiz value)  $default,){
final _that = this;
switch (_that) {
case _Quiz():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Quiz value)?  $default,){
final _that = this;
switch (_that) {
case _Quiz() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  int passScore,  List<QuizQuestion> questions,  int? timeLimitSec,  int? attemptsAllowed,  int? attemptsUsed,  List<QuizAttempt>? history)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Quiz() when $default != null:
return $default(_that.title,_that.passScore,_that.questions,_that.timeLimitSec,_that.attemptsAllowed,_that.attemptsUsed,_that.history);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  int passScore,  List<QuizQuestion> questions,  int? timeLimitSec,  int? attemptsAllowed,  int? attemptsUsed,  List<QuizAttempt>? history)  $default,) {final _that = this;
switch (_that) {
case _Quiz():
return $default(_that.title,_that.passScore,_that.questions,_that.timeLimitSec,_that.attemptsAllowed,_that.attemptsUsed,_that.history);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  int passScore,  List<QuizQuestion> questions,  int? timeLimitSec,  int? attemptsAllowed,  int? attemptsUsed,  List<QuizAttempt>? history)?  $default,) {final _that = this;
switch (_that) {
case _Quiz() when $default != null:
return $default(_that.title,_that.passScore,_that.questions,_that.timeLimitSec,_that.attemptsAllowed,_that.attemptsUsed,_that.history);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Quiz implements Quiz {
  const _Quiz({required this.title, required this.passScore, required final  List<QuizQuestion> questions, this.timeLimitSec, this.attemptsAllowed, this.attemptsUsed, final  List<QuizAttempt>? history}): _questions = questions,_history = history;
  factory _Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);

@override final  String title;
@override final  int passScore;
 final  List<QuizQuestion> _questions;
@override List<QuizQuestion> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

@override final  int? timeLimitSec;
@override final  int? attemptsAllowed;
@override final  int? attemptsUsed;
 final  List<QuizAttempt>? _history;
@override List<QuizAttempt>? get history {
  final value = _history;
  if (value == null) return null;
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Quiz
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizCopyWith<_Quiz> get copyWith => __$QuizCopyWithImpl<_Quiz>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Quiz&&(identical(other.title, title) || other.title == title)&&(identical(other.passScore, passScore) || other.passScore == passScore)&&const DeepCollectionEquality().equals(other._questions, _questions)&&(identical(other.timeLimitSec, timeLimitSec) || other.timeLimitSec == timeLimitSec)&&(identical(other.attemptsAllowed, attemptsAllowed) || other.attemptsAllowed == attemptsAllowed)&&(identical(other.attemptsUsed, attemptsUsed) || other.attemptsUsed == attemptsUsed)&&const DeepCollectionEquality().equals(other._history, _history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,passScore,const DeepCollectionEquality().hash(_questions),timeLimitSec,attemptsAllowed,attemptsUsed,const DeepCollectionEquality().hash(_history));

@override
String toString() {
  return 'Quiz(title: $title, passScore: $passScore, questions: $questions, timeLimitSec: $timeLimitSec, attemptsAllowed: $attemptsAllowed, attemptsUsed: $attemptsUsed, history: $history)';
}


}

/// @nodoc
abstract mixin class _$QuizCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$QuizCopyWith(_Quiz value, $Res Function(_Quiz) _then) = __$QuizCopyWithImpl;
@override @useResult
$Res call({
 String title, int passScore, List<QuizQuestion> questions, int? timeLimitSec, int? attemptsAllowed, int? attemptsUsed, List<QuizAttempt>? history
});




}
/// @nodoc
class __$QuizCopyWithImpl<$Res>
    implements _$QuizCopyWith<$Res> {
  __$QuizCopyWithImpl(this._self, this._then);

  final _Quiz _self;
  final $Res Function(_Quiz) _then;

/// Create a copy of Quiz
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? passScore = null,Object? questions = null,Object? timeLimitSec = freezed,Object? attemptsAllowed = freezed,Object? attemptsUsed = freezed,Object? history = freezed,}) {
  return _then(_Quiz(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,passScore: null == passScore ? _self.passScore : passScore // ignore: cast_nullable_to_non_nullable
as int,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuizQuestion>,timeLimitSec: freezed == timeLimitSec ? _self.timeLimitSec : timeLimitSec // ignore: cast_nullable_to_non_nullable
as int?,attemptsAllowed: freezed == attemptsAllowed ? _self.attemptsAllowed : attemptsAllowed // ignore: cast_nullable_to_non_nullable
as int?,attemptsUsed: freezed == attemptsUsed ? _self.attemptsUsed : attemptsUsed // ignore: cast_nullable_to_non_nullable
as int?,history: freezed == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<QuizAttempt>?,
  ));
}


}


/// @nodoc
mixin _$QuizReviewItem {

 int get questionId; bool get correct; String get correctText; String get yourText;
/// Create a copy of QuizReviewItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizReviewItemCopyWith<QuizReviewItem> get copyWith => _$QuizReviewItemCopyWithImpl<QuizReviewItem>(this as QuizReviewItem, _$identity);

  /// Serializes this QuizReviewItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizReviewItem&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.correct, correct) || other.correct == correct)&&(identical(other.correctText, correctText) || other.correctText == correctText)&&(identical(other.yourText, yourText) || other.yourText == yourText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,correct,correctText,yourText);

@override
String toString() {
  return 'QuizReviewItem(questionId: $questionId, correct: $correct, correctText: $correctText, yourText: $yourText)';
}


}

/// @nodoc
abstract mixin class $QuizReviewItemCopyWith<$Res>  {
  factory $QuizReviewItemCopyWith(QuizReviewItem value, $Res Function(QuizReviewItem) _then) = _$QuizReviewItemCopyWithImpl;
@useResult
$Res call({
 int questionId, bool correct, String correctText, String yourText
});




}
/// @nodoc
class _$QuizReviewItemCopyWithImpl<$Res>
    implements $QuizReviewItemCopyWith<$Res> {
  _$QuizReviewItemCopyWithImpl(this._self, this._then);

  final QuizReviewItem _self;
  final $Res Function(QuizReviewItem) _then;

/// Create a copy of QuizReviewItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questionId = null,Object? correct = null,Object? correctText = null,Object? yourText = null,}) {
  return _then(_self.copyWith(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as int,correct: null == correct ? _self.correct : correct // ignore: cast_nullable_to_non_nullable
as bool,correctText: null == correctText ? _self.correctText : correctText // ignore: cast_nullable_to_non_nullable
as String,yourText: null == yourText ? _self.yourText : yourText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizReviewItem].
extension QuizReviewItemPatterns on QuizReviewItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizReviewItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizReviewItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizReviewItem value)  $default,){
final _that = this;
switch (_that) {
case _QuizReviewItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizReviewItem value)?  $default,){
final _that = this;
switch (_that) {
case _QuizReviewItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int questionId,  bool correct,  String correctText,  String yourText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizReviewItem() when $default != null:
return $default(_that.questionId,_that.correct,_that.correctText,_that.yourText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int questionId,  bool correct,  String correctText,  String yourText)  $default,) {final _that = this;
switch (_that) {
case _QuizReviewItem():
return $default(_that.questionId,_that.correct,_that.correctText,_that.yourText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int questionId,  bool correct,  String correctText,  String yourText)?  $default,) {final _that = this;
switch (_that) {
case _QuizReviewItem() when $default != null:
return $default(_that.questionId,_that.correct,_that.correctText,_that.yourText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizReviewItem implements QuizReviewItem {
  const _QuizReviewItem({required this.questionId, required this.correct, required this.correctText, required this.yourText});
  factory _QuizReviewItem.fromJson(Map<String, dynamic> json) => _$QuizReviewItemFromJson(json);

@override final  int questionId;
@override final  bool correct;
@override final  String correctText;
@override final  String yourText;

/// Create a copy of QuizReviewItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizReviewItemCopyWith<_QuizReviewItem> get copyWith => __$QuizReviewItemCopyWithImpl<_QuizReviewItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizReviewItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizReviewItem&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.correct, correct) || other.correct == correct)&&(identical(other.correctText, correctText) || other.correctText == correctText)&&(identical(other.yourText, yourText) || other.yourText == yourText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,correct,correctText,yourText);

@override
String toString() {
  return 'QuizReviewItem(questionId: $questionId, correct: $correct, correctText: $correctText, yourText: $yourText)';
}


}

/// @nodoc
abstract mixin class _$QuizReviewItemCopyWith<$Res> implements $QuizReviewItemCopyWith<$Res> {
  factory _$QuizReviewItemCopyWith(_QuizReviewItem value, $Res Function(_QuizReviewItem) _then) = __$QuizReviewItemCopyWithImpl;
@override @useResult
$Res call({
 int questionId, bool correct, String correctText, String yourText
});




}
/// @nodoc
class __$QuizReviewItemCopyWithImpl<$Res>
    implements _$QuizReviewItemCopyWith<$Res> {
  __$QuizReviewItemCopyWithImpl(this._self, this._then);

  final _QuizReviewItem _self;
  final $Res Function(_QuizReviewItem) _then;

/// Create a copy of QuizReviewItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questionId = null,Object? correct = null,Object? correctText = null,Object? yourText = null,}) {
  return _then(_QuizReviewItem(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as int,correct: null == correct ? _self.correct : correct // ignore: cast_nullable_to_non_nullable
as bool,correctText: null == correctText ? _self.correctText : correctText // ignore: cast_nullable_to_non_nullable
as String,yourText: null == yourText ? _self.yourText : yourText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$QuizResult {

 bool get passed; int get score; int get total; int get rewardIqc; Wallet get wallet; int get attemptsLeft; List<QuizReviewItem> get review;
/// Create a copy of QuizResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizResultCopyWith<QuizResult> get copyWith => _$QuizResultCopyWithImpl<QuizResult>(this as QuizResult, _$identity);

  /// Serializes this QuizResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizResult&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.score, score) || other.score == score)&&(identical(other.total, total) || other.total == total)&&(identical(other.rewardIqc, rewardIqc) || other.rewardIqc == rewardIqc)&&(identical(other.wallet, wallet) || other.wallet == wallet)&&(identical(other.attemptsLeft, attemptsLeft) || other.attemptsLeft == attemptsLeft)&&const DeepCollectionEquality().equals(other.review, review));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,passed,score,total,rewardIqc,wallet,attemptsLeft,const DeepCollectionEquality().hash(review));

@override
String toString() {
  return 'QuizResult(passed: $passed, score: $score, total: $total, rewardIqc: $rewardIqc, wallet: $wallet, attemptsLeft: $attemptsLeft, review: $review)';
}


}

/// @nodoc
abstract mixin class $QuizResultCopyWith<$Res>  {
  factory $QuizResultCopyWith(QuizResult value, $Res Function(QuizResult) _then) = _$QuizResultCopyWithImpl;
@useResult
$Res call({
 bool passed, int score, int total, int rewardIqc, Wallet wallet, int attemptsLeft, List<QuizReviewItem> review
});


$WalletCopyWith<$Res> get wallet;

}
/// @nodoc
class _$QuizResultCopyWithImpl<$Res>
    implements $QuizResultCopyWith<$Res> {
  _$QuizResultCopyWithImpl(this._self, this._then);

  final QuizResult _self;
  final $Res Function(QuizResult) _then;

/// Create a copy of QuizResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? passed = null,Object? score = null,Object? total = null,Object? rewardIqc = null,Object? wallet = null,Object? attemptsLeft = null,Object? review = null,}) {
  return _then(_self.copyWith(
passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,rewardIqc: null == rewardIqc ? _self.rewardIqc : rewardIqc // ignore: cast_nullable_to_non_nullable
as int,wallet: null == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as Wallet,attemptsLeft: null == attemptsLeft ? _self.attemptsLeft : attemptsLeft // ignore: cast_nullable_to_non_nullable
as int,review: null == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as List<QuizReviewItem>,
  ));
}
/// Create a copy of QuizResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletCopyWith<$Res> get wallet {
  
  return $WalletCopyWith<$Res>(_self.wallet, (value) {
    return _then(_self.copyWith(wallet: value));
  });
}
}


/// Adds pattern-matching-related methods to [QuizResult].
extension QuizResultPatterns on QuizResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizResult value)  $default,){
final _that = this;
switch (_that) {
case _QuizResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizResult value)?  $default,){
final _that = this;
switch (_that) {
case _QuizResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool passed,  int score,  int total,  int rewardIqc,  Wallet wallet,  int attemptsLeft,  List<QuizReviewItem> review)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizResult() when $default != null:
return $default(_that.passed,_that.score,_that.total,_that.rewardIqc,_that.wallet,_that.attemptsLeft,_that.review);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool passed,  int score,  int total,  int rewardIqc,  Wallet wallet,  int attemptsLeft,  List<QuizReviewItem> review)  $default,) {final _that = this;
switch (_that) {
case _QuizResult():
return $default(_that.passed,_that.score,_that.total,_that.rewardIqc,_that.wallet,_that.attemptsLeft,_that.review);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool passed,  int score,  int total,  int rewardIqc,  Wallet wallet,  int attemptsLeft,  List<QuizReviewItem> review)?  $default,) {final _that = this;
switch (_that) {
case _QuizResult() when $default != null:
return $default(_that.passed,_that.score,_that.total,_that.rewardIqc,_that.wallet,_that.attemptsLeft,_that.review);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizResult implements QuizResult {
  const _QuizResult({required this.passed, required this.score, required this.total, required this.rewardIqc, required this.wallet, required this.attemptsLeft, required final  List<QuizReviewItem> review}): _review = review;
  factory _QuizResult.fromJson(Map<String, dynamic> json) => _$QuizResultFromJson(json);

@override final  bool passed;
@override final  int score;
@override final  int total;
@override final  int rewardIqc;
@override final  Wallet wallet;
@override final  int attemptsLeft;
 final  List<QuizReviewItem> _review;
@override List<QuizReviewItem> get review {
  if (_review is EqualUnmodifiableListView) return _review;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_review);
}


/// Create a copy of QuizResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizResultCopyWith<_QuizResult> get copyWith => __$QuizResultCopyWithImpl<_QuizResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizResult&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.score, score) || other.score == score)&&(identical(other.total, total) || other.total == total)&&(identical(other.rewardIqc, rewardIqc) || other.rewardIqc == rewardIqc)&&(identical(other.wallet, wallet) || other.wallet == wallet)&&(identical(other.attemptsLeft, attemptsLeft) || other.attemptsLeft == attemptsLeft)&&const DeepCollectionEquality().equals(other._review, _review));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,passed,score,total,rewardIqc,wallet,attemptsLeft,const DeepCollectionEquality().hash(_review));

@override
String toString() {
  return 'QuizResult(passed: $passed, score: $score, total: $total, rewardIqc: $rewardIqc, wallet: $wallet, attemptsLeft: $attemptsLeft, review: $review)';
}


}

/// @nodoc
abstract mixin class _$QuizResultCopyWith<$Res> implements $QuizResultCopyWith<$Res> {
  factory _$QuizResultCopyWith(_QuizResult value, $Res Function(_QuizResult) _then) = __$QuizResultCopyWithImpl;
@override @useResult
$Res call({
 bool passed, int score, int total, int rewardIqc, Wallet wallet, int attemptsLeft, List<QuizReviewItem> review
});


@override $WalletCopyWith<$Res> get wallet;

}
/// @nodoc
class __$QuizResultCopyWithImpl<$Res>
    implements _$QuizResultCopyWith<$Res> {
  __$QuizResultCopyWithImpl(this._self, this._then);

  final _QuizResult _self;
  final $Res Function(_QuizResult) _then;

/// Create a copy of QuizResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? passed = null,Object? score = null,Object? total = null,Object? rewardIqc = null,Object? wallet = null,Object? attemptsLeft = null,Object? review = null,}) {
  return _then(_QuizResult(
passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,rewardIqc: null == rewardIqc ? _self.rewardIqc : rewardIqc // ignore: cast_nullable_to_non_nullable
as int,wallet: null == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as Wallet,attemptsLeft: null == attemptsLeft ? _self.attemptsLeft : attemptsLeft // ignore: cast_nullable_to_non_nullable
as int,review: null == review ? _self._review : review // ignore: cast_nullable_to_non_nullable
as List<QuizReviewItem>,
  ));
}

/// Create a copy of QuizResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletCopyWith<$Res> get wallet {
  
  return $WalletCopyWith<$Res>(_self.wallet, (value) {
    return _then(_self.copyWith(wallet: value));
  });
}
}

// dart format on
