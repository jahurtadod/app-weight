// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participant_person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ParticipantWithPersonAndWeights {

 Participant get participant; Person get person; List<Weight> get weights;
/// Create a copy of ParticipantWithPersonAndWeights
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParticipantWithPersonAndWeightsCopyWith<ParticipantWithPersonAndWeights> get copyWith => _$ParticipantWithPersonAndWeightsCopyWithImpl<ParticipantWithPersonAndWeights>(this as ParticipantWithPersonAndWeights, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParticipantWithPersonAndWeights&&(identical(other.participant, participant) || other.participant == participant)&&(identical(other.person, person) || other.person == person)&&const DeepCollectionEquality().equals(other.weights, weights));
}


@override
int get hashCode => Object.hash(runtimeType,participant,person,const DeepCollectionEquality().hash(weights));

@override
String toString() {
  return 'ParticipantWithPersonAndWeights(participant: $participant, person: $person, weights: $weights)';
}


}

/// @nodoc
abstract mixin class $ParticipantWithPersonAndWeightsCopyWith<$Res>  {
  factory $ParticipantWithPersonAndWeightsCopyWith(ParticipantWithPersonAndWeights value, $Res Function(ParticipantWithPersonAndWeights) _then) = _$ParticipantWithPersonAndWeightsCopyWithImpl;
@useResult
$Res call({
 Participant participant, Person person, List<Weight> weights
});




}
/// @nodoc
class _$ParticipantWithPersonAndWeightsCopyWithImpl<$Res>
    implements $ParticipantWithPersonAndWeightsCopyWith<$Res> {
  _$ParticipantWithPersonAndWeightsCopyWithImpl(this._self, this._then);

  final ParticipantWithPersonAndWeights _self;
  final $Res Function(ParticipantWithPersonAndWeights) _then;

/// Create a copy of ParticipantWithPersonAndWeights
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? participant = null,Object? person = null,Object? weights = null,}) {
  return _then(_self.copyWith(
participant: null == participant ? _self.participant : participant // ignore: cast_nullable_to_non_nullable
as Participant,person: null == person ? _self.person : person // ignore: cast_nullable_to_non_nullable
as Person,weights: null == weights ? _self.weights : weights // ignore: cast_nullable_to_non_nullable
as List<Weight>,
  ));
}

}


/// Adds pattern-matching-related methods to [ParticipantWithPersonAndWeights].
extension ParticipantWithPersonAndWeightsPatterns on ParticipantWithPersonAndWeights {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParticipantWithPersonAndWeights value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParticipantWithPersonAndWeights() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParticipantWithPersonAndWeights value)  $default,){
final _that = this;
switch (_that) {
case _ParticipantWithPersonAndWeights():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParticipantWithPersonAndWeights value)?  $default,){
final _that = this;
switch (_that) {
case _ParticipantWithPersonAndWeights() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Participant participant,  Person person,  List<Weight> weights)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParticipantWithPersonAndWeights() when $default != null:
return $default(_that.participant,_that.person,_that.weights);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Participant participant,  Person person,  List<Weight> weights)  $default,) {final _that = this;
switch (_that) {
case _ParticipantWithPersonAndWeights():
return $default(_that.participant,_that.person,_that.weights);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Participant participant,  Person person,  List<Weight> weights)?  $default,) {final _that = this;
switch (_that) {
case _ParticipantWithPersonAndWeights() when $default != null:
return $default(_that.participant,_that.person,_that.weights);case _:
  return null;

}
}

}

/// @nodoc


class _ParticipantWithPersonAndWeights implements ParticipantWithPersonAndWeights {
  const _ParticipantWithPersonAndWeights({required this.participant, required this.person, required final  List<Weight> weights}): _weights = weights;
  

@override final  Participant participant;
@override final  Person person;
 final  List<Weight> _weights;
@override List<Weight> get weights {
  if (_weights is EqualUnmodifiableListView) return _weights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weights);
}


/// Create a copy of ParticipantWithPersonAndWeights
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParticipantWithPersonAndWeightsCopyWith<_ParticipantWithPersonAndWeights> get copyWith => __$ParticipantWithPersonAndWeightsCopyWithImpl<_ParticipantWithPersonAndWeights>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParticipantWithPersonAndWeights&&(identical(other.participant, participant) || other.participant == participant)&&(identical(other.person, person) || other.person == person)&&const DeepCollectionEquality().equals(other._weights, _weights));
}


@override
int get hashCode => Object.hash(runtimeType,participant,person,const DeepCollectionEquality().hash(_weights));

@override
String toString() {
  return 'ParticipantWithPersonAndWeights(participant: $participant, person: $person, weights: $weights)';
}


}

/// @nodoc
abstract mixin class _$ParticipantWithPersonAndWeightsCopyWith<$Res> implements $ParticipantWithPersonAndWeightsCopyWith<$Res> {
  factory _$ParticipantWithPersonAndWeightsCopyWith(_ParticipantWithPersonAndWeights value, $Res Function(_ParticipantWithPersonAndWeights) _then) = __$ParticipantWithPersonAndWeightsCopyWithImpl;
@override @useResult
$Res call({
 Participant participant, Person person, List<Weight> weights
});




}
/// @nodoc
class __$ParticipantWithPersonAndWeightsCopyWithImpl<$Res>
    implements _$ParticipantWithPersonAndWeightsCopyWith<$Res> {
  __$ParticipantWithPersonAndWeightsCopyWithImpl(this._self, this._then);

  final _ParticipantWithPersonAndWeights _self;
  final $Res Function(_ParticipantWithPersonAndWeights) _then;

/// Create a copy of ParticipantWithPersonAndWeights
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? participant = null,Object? person = null,Object? weights = null,}) {
  return _then(_ParticipantWithPersonAndWeights(
participant: null == participant ? _self.participant : participant // ignore: cast_nullable_to_non_nullable
as Participant,person: null == person ? _self.person : person // ignore: cast_nullable_to_non_nullable
as Person,weights: null == weights ? _self._weights : weights // ignore: cast_nullable_to_non_nullable
as List<Weight>,
  ));
}


}

// dart format on
