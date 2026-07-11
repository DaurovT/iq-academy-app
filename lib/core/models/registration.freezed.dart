// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegOption {

 String get value;@LocalizedTextConverter() LocalizedText get label;
/// Create a copy of RegOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegOptionCopyWith<RegOption> get copyWith => _$RegOptionCopyWithImpl<RegOption>(this as RegOption, _$identity);

  /// Serializes this RegOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegOption&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label);

@override
String toString() {
  return 'RegOption(value: $value, label: $label)';
}


}

/// @nodoc
abstract mixin class $RegOptionCopyWith<$Res>  {
  factory $RegOptionCopyWith(RegOption value, $Res Function(RegOption) _then) = _$RegOptionCopyWithImpl;
@useResult
$Res call({
 String value,@LocalizedTextConverter() LocalizedText label
});




}
/// @nodoc
class _$RegOptionCopyWithImpl<$Res>
    implements $RegOptionCopyWith<$Res> {
  _$RegOptionCopyWithImpl(this._self, this._then);

  final RegOption _self;
  final $Res Function(RegOption) _then;

/// Create a copy of RegOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? label = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as LocalizedText,
  ));
}

}


/// Adds pattern-matching-related methods to [RegOption].
extension RegOptionPatterns on RegOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegOption value)  $default,){
final _that = this;
switch (_that) {
case _RegOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegOption value)?  $default,){
final _that = this;
switch (_that) {
case _RegOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value, @LocalizedTextConverter()  LocalizedText label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegOption() when $default != null:
return $default(_that.value,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value, @LocalizedTextConverter()  LocalizedText label)  $default,) {final _that = this;
switch (_that) {
case _RegOption():
return $default(_that.value,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value, @LocalizedTextConverter()  LocalizedText label)?  $default,) {final _that = this;
switch (_that) {
case _RegOption() when $default != null:
return $default(_that.value,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegOption implements RegOption {
  const _RegOption({required this.value, @LocalizedTextConverter() required this.label});
  factory _RegOption.fromJson(Map<String, dynamic> json) => _$RegOptionFromJson(json);

@override final  String value;
@override@LocalizedTextConverter() final  LocalizedText label;

/// Create a copy of RegOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegOptionCopyWith<_RegOption> get copyWith => __$RegOptionCopyWithImpl<_RegOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegOption&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label);

@override
String toString() {
  return 'RegOption(value: $value, label: $label)';
}


}

/// @nodoc
abstract mixin class _$RegOptionCopyWith<$Res> implements $RegOptionCopyWith<$Res> {
  factory _$RegOptionCopyWith(_RegOption value, $Res Function(_RegOption) _then) = __$RegOptionCopyWithImpl;
@override @useResult
$Res call({
 String value,@LocalizedTextConverter() LocalizedText label
});




}
/// @nodoc
class __$RegOptionCopyWithImpl<$Res>
    implements _$RegOptionCopyWith<$Res> {
  __$RegOptionCopyWithImpl(this._self, this._then);

  final _RegOption _self;
  final $Res Function(_RegOption) _then;

/// Create a copy of RegOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? label = null,}) {
  return _then(_RegOption(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as LocalizedText,
  ));
}


}


/// @nodoc
mixin _$RegField {

 String get name; RegFieldType get type;@LocalizedTextConverter() LocalizedText get label; bool get required; List<RegOption>? get options; String? get consentUrl;
/// Create a copy of RegField
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegFieldCopyWith<RegField> get copyWith => _$RegFieldCopyWithImpl<RegField>(this as RegField, _$identity);

  /// Serializes this RegField to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegField&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.label, label) || other.label == label)&&(identical(other.required, required) || other.required == required)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.consentUrl, consentUrl) || other.consentUrl == consentUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,label,required,const DeepCollectionEquality().hash(options),consentUrl);

@override
String toString() {
  return 'RegField(name: $name, type: $type, label: $label, required: $required, options: $options, consentUrl: $consentUrl)';
}


}

/// @nodoc
abstract mixin class $RegFieldCopyWith<$Res>  {
  factory $RegFieldCopyWith(RegField value, $Res Function(RegField) _then) = _$RegFieldCopyWithImpl;
@useResult
$Res call({
 String name, RegFieldType type,@LocalizedTextConverter() LocalizedText label, bool required, List<RegOption>? options, String? consentUrl
});




}
/// @nodoc
class _$RegFieldCopyWithImpl<$Res>
    implements $RegFieldCopyWith<$Res> {
  _$RegFieldCopyWithImpl(this._self, this._then);

  final RegField _self;
  final $Res Function(RegField) _then;

/// Create a copy of RegField
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,Object? label = null,Object? required = null,Object? options = freezed,Object? consentUrl = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as RegFieldType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as LocalizedText,required: null == required ? _self.required : required // ignore: cast_nullable_to_non_nullable
as bool,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<RegOption>?,consentUrl: freezed == consentUrl ? _self.consentUrl : consentUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RegField].
extension RegFieldPatterns on RegField {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegField value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegField() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegField value)  $default,){
final _that = this;
switch (_that) {
case _RegField():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegField value)?  $default,){
final _that = this;
switch (_that) {
case _RegField() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  RegFieldType type, @LocalizedTextConverter()  LocalizedText label,  bool required,  List<RegOption>? options,  String? consentUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegField() when $default != null:
return $default(_that.name,_that.type,_that.label,_that.required,_that.options,_that.consentUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  RegFieldType type, @LocalizedTextConverter()  LocalizedText label,  bool required,  List<RegOption>? options,  String? consentUrl)  $default,) {final _that = this;
switch (_that) {
case _RegField():
return $default(_that.name,_that.type,_that.label,_that.required,_that.options,_that.consentUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  RegFieldType type, @LocalizedTextConverter()  LocalizedText label,  bool required,  List<RegOption>? options,  String? consentUrl)?  $default,) {final _that = this;
switch (_that) {
case _RegField() when $default != null:
return $default(_that.name,_that.type,_that.label,_that.required,_that.options,_that.consentUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegField implements RegField {
  const _RegField({required this.name, required this.type, @LocalizedTextConverter() required this.label, required this.required, final  List<RegOption>? options, this.consentUrl}): _options = options;
  factory _RegField.fromJson(Map<String, dynamic> json) => _$RegFieldFromJson(json);

@override final  String name;
@override final  RegFieldType type;
@override@LocalizedTextConverter() final  LocalizedText label;
@override final  bool required;
 final  List<RegOption>? _options;
@override List<RegOption>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? consentUrl;

/// Create a copy of RegField
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegFieldCopyWith<_RegField> get copyWith => __$RegFieldCopyWithImpl<_RegField>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegFieldToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegField&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.label, label) || other.label == label)&&(identical(other.required, required) || other.required == required)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.consentUrl, consentUrl) || other.consentUrl == consentUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,label,required,const DeepCollectionEquality().hash(_options),consentUrl);

@override
String toString() {
  return 'RegField(name: $name, type: $type, label: $label, required: $required, options: $options, consentUrl: $consentUrl)';
}


}

/// @nodoc
abstract mixin class _$RegFieldCopyWith<$Res> implements $RegFieldCopyWith<$Res> {
  factory _$RegFieldCopyWith(_RegField value, $Res Function(_RegField) _then) = __$RegFieldCopyWithImpl;
@override @useResult
$Res call({
 String name, RegFieldType type,@LocalizedTextConverter() LocalizedText label, bool required, List<RegOption>? options, String? consentUrl
});




}
/// @nodoc
class __$RegFieldCopyWithImpl<$Res>
    implements _$RegFieldCopyWith<$Res> {
  __$RegFieldCopyWithImpl(this._self, this._then);

  final _RegField _self;
  final $Res Function(_RegField) _then;

/// Create a copy of RegField
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,Object? label = null,Object? required = null,Object? options = freezed,Object? consentUrl = freezed,}) {
  return _then(_RegField(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as RegFieldType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as LocalizedText,required: null == required ? _self.required : required // ignore: cast_nullable_to_non_nullable
as bool,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<RegOption>?,consentUrl: freezed == consentUrl ? _self.consentUrl : consentUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RegistrationSchema {

 String get version; Role get role; List<RegField> get fields;
/// Create a copy of RegistrationSchema
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationSchemaCopyWith<RegistrationSchema> get copyWith => _$RegistrationSchemaCopyWithImpl<RegistrationSchema>(this as RegistrationSchema, _$identity);

  /// Serializes this RegistrationSchema to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationSchema&&(identical(other.version, version) || other.version == version)&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other.fields, fields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,role,const DeepCollectionEquality().hash(fields));

@override
String toString() {
  return 'RegistrationSchema(version: $version, role: $role, fields: $fields)';
}


}

/// @nodoc
abstract mixin class $RegistrationSchemaCopyWith<$Res>  {
  factory $RegistrationSchemaCopyWith(RegistrationSchema value, $Res Function(RegistrationSchema) _then) = _$RegistrationSchemaCopyWithImpl;
@useResult
$Res call({
 String version, Role role, List<RegField> fields
});




}
/// @nodoc
class _$RegistrationSchemaCopyWithImpl<$Res>
    implements $RegistrationSchemaCopyWith<$Res> {
  _$RegistrationSchemaCopyWithImpl(this._self, this._then);

  final RegistrationSchema _self;
  final $Res Function(RegistrationSchema) _then;

/// Create a copy of RegistrationSchema
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? role = null,Object? fields = null,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as Role,fields: null == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as List<RegField>,
  ));
}

}


/// Adds pattern-matching-related methods to [RegistrationSchema].
extension RegistrationSchemaPatterns on RegistrationSchema {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegistrationSchema value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegistrationSchema() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegistrationSchema value)  $default,){
final _that = this;
switch (_that) {
case _RegistrationSchema():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegistrationSchema value)?  $default,){
final _that = this;
switch (_that) {
case _RegistrationSchema() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String version,  Role role,  List<RegField> fields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegistrationSchema() when $default != null:
return $default(_that.version,_that.role,_that.fields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String version,  Role role,  List<RegField> fields)  $default,) {final _that = this;
switch (_that) {
case _RegistrationSchema():
return $default(_that.version,_that.role,_that.fields);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String version,  Role role,  List<RegField> fields)?  $default,) {final _that = this;
switch (_that) {
case _RegistrationSchema() when $default != null:
return $default(_that.version,_that.role,_that.fields);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegistrationSchema implements RegistrationSchema {
  const _RegistrationSchema({required this.version, required this.role, required final  List<RegField> fields}): _fields = fields;
  factory _RegistrationSchema.fromJson(Map<String, dynamic> json) => _$RegistrationSchemaFromJson(json);

@override final  String version;
@override final  Role role;
 final  List<RegField> _fields;
@override List<RegField> get fields {
  if (_fields is EqualUnmodifiableListView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fields);
}


/// Create a copy of RegistrationSchema
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistrationSchemaCopyWith<_RegistrationSchema> get copyWith => __$RegistrationSchemaCopyWithImpl<_RegistrationSchema>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegistrationSchemaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationSchema&&(identical(other.version, version) || other.version == version)&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other._fields, _fields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,role,const DeepCollectionEquality().hash(_fields));

@override
String toString() {
  return 'RegistrationSchema(version: $version, role: $role, fields: $fields)';
}


}

/// @nodoc
abstract mixin class _$RegistrationSchemaCopyWith<$Res> implements $RegistrationSchemaCopyWith<$Res> {
  factory _$RegistrationSchemaCopyWith(_RegistrationSchema value, $Res Function(_RegistrationSchema) _then) = __$RegistrationSchemaCopyWithImpl;
@override @useResult
$Res call({
 String version, Role role, List<RegField> fields
});




}
/// @nodoc
class __$RegistrationSchemaCopyWithImpl<$Res>
    implements _$RegistrationSchemaCopyWith<$Res> {
  __$RegistrationSchemaCopyWithImpl(this._self, this._then);

  final _RegistrationSchema _self;
  final $Res Function(_RegistrationSchema) _then;

/// Create a copy of RegistrationSchema
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? role = null,Object? fields = null,}) {
  return _then(_RegistrationSchema(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as Role,fields: null == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as List<RegField>,
  ));
}


}


/// @nodoc
mixin _$RefItem {

 String get value;@LocalizedTextConverter() LocalizedText get label;
/// Create a copy of RefItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefItemCopyWith<RefItem> get copyWith => _$RefItemCopyWithImpl<RefItem>(this as RefItem, _$identity);

  /// Serializes this RefItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefItem&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label);

@override
String toString() {
  return 'RefItem(value: $value, label: $label)';
}


}

/// @nodoc
abstract mixin class $RefItemCopyWith<$Res>  {
  factory $RefItemCopyWith(RefItem value, $Res Function(RefItem) _then) = _$RefItemCopyWithImpl;
@useResult
$Res call({
 String value,@LocalizedTextConverter() LocalizedText label
});




}
/// @nodoc
class _$RefItemCopyWithImpl<$Res>
    implements $RefItemCopyWith<$Res> {
  _$RefItemCopyWithImpl(this._self, this._then);

  final RefItem _self;
  final $Res Function(RefItem) _then;

/// Create a copy of RefItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? label = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as LocalizedText,
  ));
}

}


/// Adds pattern-matching-related methods to [RefItem].
extension RefItemPatterns on RefItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefItem value)  $default,){
final _that = this;
switch (_that) {
case _RefItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefItem value)?  $default,){
final _that = this;
switch (_that) {
case _RefItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value, @LocalizedTextConverter()  LocalizedText label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefItem() when $default != null:
return $default(_that.value,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value, @LocalizedTextConverter()  LocalizedText label)  $default,) {final _that = this;
switch (_that) {
case _RefItem():
return $default(_that.value,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value, @LocalizedTextConverter()  LocalizedText label)?  $default,) {final _that = this;
switch (_that) {
case _RefItem() when $default != null:
return $default(_that.value,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefItem implements RefItem {
  const _RefItem({required this.value, @LocalizedTextConverter() required this.label});
  factory _RefItem.fromJson(Map<String, dynamic> json) => _$RefItemFromJson(json);

@override final  String value;
@override@LocalizedTextConverter() final  LocalizedText label;

/// Create a copy of RefItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefItemCopyWith<_RefItem> get copyWith => __$RefItemCopyWithImpl<_RefItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefItem&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label);

@override
String toString() {
  return 'RefItem(value: $value, label: $label)';
}


}

/// @nodoc
abstract mixin class _$RefItemCopyWith<$Res> implements $RefItemCopyWith<$Res> {
  factory _$RefItemCopyWith(_RefItem value, $Res Function(_RefItem) _then) = __$RefItemCopyWithImpl;
@override @useResult
$Res call({
 String value,@LocalizedTextConverter() LocalizedText label
});




}
/// @nodoc
class __$RefItemCopyWithImpl<$Res>
    implements _$RefItemCopyWith<$Res> {
  __$RefItemCopyWithImpl(this._self, this._then);

  final _RefItem _self;
  final $Res Function(_RefItem) _then;

/// Create a copy of RefItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? label = null,}) {
  return _then(_RefItem(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as LocalizedText,
  ));
}


}

// dart format on
