// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_bet_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BetDetails {

 Bet get bet; List<ParticipantWithPersonAndWeights> get participants;
/// Create a copy of BetDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BetDetailsCopyWith<BetDetails> get copyWith => _$BetDetailsCopyWithImpl<BetDetails>(this as BetDetails, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BetDetails&&(identical(other.bet, bet) || other.bet == bet)&&const DeepCollectionEquality().equals(other.participants, participants));
}


@override
int get hashCode => Object.hash(runtimeType,bet,const DeepCollectionEquality().hash(participants));

@override
String toString() {
  return 'BetDetails(bet: $bet, participants: $participants)';
}


}

/// @nodoc
abstract mixin class $BetDetailsCopyWith<$Res>  {
  factory $BetDetailsCopyWith(BetDetails value, $Res Function(BetDetails) _then) = _$BetDetailsCopyWithImpl;
@useResult
$Res call({
 Bet bet, List<ParticipantWithPersonAndWeights> participants
});




}
/// @nodoc
class _$BetDetailsCopyWithImpl<$Res>
    implements $BetDetailsCopyWith<$Res> {
  _$BetDetailsCopyWithImpl(this._self, this._then);

  final BetDetails _self;
  final $Res Function(BetDetails) _then;

/// Create a copy of BetDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bet = null,Object? participants = null,}) {
  return _then(_self.copyWith(
bet: null == bet ? _self.bet : bet // ignore: cast_nullable_to_non_nullable
as Bet,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<ParticipantWithPersonAndWeights>,
  ));
}

}


/// Adds pattern-matching-related methods to [BetDetails].
extension BetDetailsPatterns on BetDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BetDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BetDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BetDetails value)  $default,){
final _that = this;
switch (_that) {
case _BetDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BetDetails value)?  $default,){
final _that = this;
switch (_that) {
case _BetDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Bet bet,  List<ParticipantWithPersonAndWeights> participants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BetDetails() when $default != null:
return $default(_that.bet,_that.participants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Bet bet,  List<ParticipantWithPersonAndWeights> participants)  $default,) {final _that = this;
switch (_that) {
case _BetDetails():
return $default(_that.bet,_that.participants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Bet bet,  List<ParticipantWithPersonAndWeights> participants)?  $default,) {final _that = this;
switch (_that) {
case _BetDetails() when $default != null:
return $default(_that.bet,_that.participants);case _:
  return null;

}
}

}

/// @nodoc


class _BetDetails implements BetDetails {
  const _BetDetails({required this.bet, required final  List<ParticipantWithPersonAndWeights> participants}): _participants = participants;
  

@override final  Bet bet;
 final  List<ParticipantWithPersonAndWeights> _participants;
@override List<ParticipantWithPersonAndWeights> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}


/// Create a copy of BetDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BetDetailsCopyWith<_BetDetails> get copyWith => __$BetDetailsCopyWithImpl<_BetDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BetDetails&&(identical(other.bet, bet) || other.bet == bet)&&const DeepCollectionEquality().equals(other._participants, _participants));
}


@override
int get hashCode => Object.hash(runtimeType,bet,const DeepCollectionEquality().hash(_participants));

@override
String toString() {
  return 'BetDetails(bet: $bet, participants: $participants)';
}


}

/// @nodoc
abstract mixin class _$BetDetailsCopyWith<$Res> implements $BetDetailsCopyWith<$Res> {
  factory _$BetDetailsCopyWith(_BetDetails value, $Res Function(_BetDetails) _then) = __$BetDetailsCopyWithImpl;
@override @useResult
$Res call({
 Bet bet, List<ParticipantWithPersonAndWeights> participants
});




}
/// @nodoc
class __$BetDetailsCopyWithImpl<$Res>
    implements _$BetDetailsCopyWith<$Res> {
  __$BetDetailsCopyWithImpl(this._self, this._then);

  final _BetDetails _self;
  final $Res Function(_BetDetails) _then;

/// Create a copy of BetDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bet = null,Object? participants = null,}) {
  return _then(_BetDetails(
bet: null == bet ? _self.bet : bet // ignore: cast_nullable_to_non_nullable
as Bet,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<ParticipantWithPersonAndWeights>,
  ));
}


}

// dart format on
