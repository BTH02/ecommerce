// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_status_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderStatusRequest _$OrderStatusRequestFromJson(Map<String, dynamic> json) {
  return _OrderStatusRequest.fromJson(json);
}

/// @nodoc
mixin _$OrderStatusRequest {
  @JsonKey(name: 'app_id')
  int get appId => throw _privateConstructorUsedError;
  @JsonKey(name: 'app_trans_id')
  String get appTransId => throw _privateConstructorUsedError;
  @JsonKey(name: 'mac')
  String get mac => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderStatusRequestCopyWith<OrderStatusRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusRequestCopyWith<$Res> {
  factory $OrderStatusRequestCopyWith(
          OrderStatusRequest value, $Res Function(OrderStatusRequest) then) =
      _$OrderStatusRequestCopyWithImpl<$Res, OrderStatusRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'app_id') int appId,
      @JsonKey(name: 'app_trans_id') String appTransId,
      @JsonKey(name: 'mac') String mac});
}

/// @nodoc
class _$OrderStatusRequestCopyWithImpl<$Res, $Val extends OrderStatusRequest>
    implements $OrderStatusRequestCopyWith<$Res> {
  _$OrderStatusRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? appTransId = null,
    Object? mac = null,
  }) {
    return _then(_value.copyWith(
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as int,
      appTransId: null == appTransId
          ? _value.appTransId
          : appTransId // ignore: cast_nullable_to_non_nullable
              as String,
      mac: null == mac
          ? _value.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderStatusRequestImplCopyWith<$Res>
    implements $OrderStatusRequestCopyWith<$Res> {
  factory _$$OrderStatusRequestImplCopyWith(_$OrderStatusRequestImpl value,
          $Res Function(_$OrderStatusRequestImpl) then) =
      __$$OrderStatusRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'app_id') int appId,
      @JsonKey(name: 'app_trans_id') String appTransId,
      @JsonKey(name: 'mac') String mac});
}

/// @nodoc
class __$$OrderStatusRequestImplCopyWithImpl<$Res>
    extends _$OrderStatusRequestCopyWithImpl<$Res, _$OrderStatusRequestImpl>
    implements _$$OrderStatusRequestImplCopyWith<$Res> {
  __$$OrderStatusRequestImplCopyWithImpl(_$OrderStatusRequestImpl _value,
      $Res Function(_$OrderStatusRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? appTransId = null,
    Object? mac = null,
  }) {
    return _then(_$OrderStatusRequestImpl(
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as int,
      appTransId: null == appTransId
          ? _value.appTransId
          : appTransId // ignore: cast_nullable_to_non_nullable
              as String,
      mac: null == mac
          ? _value.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderStatusRequestImpl implements _OrderStatusRequest {
  _$OrderStatusRequestImpl(
      {@JsonKey(name: 'app_id') required this.appId,
      @JsonKey(name: 'app_trans_id') required this.appTransId,
      @JsonKey(name: 'mac') required this.mac});

  factory _$OrderStatusRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderStatusRequestImplFromJson(json);

  @override
  @JsonKey(name: 'app_id')
  final int appId;
  @override
  @JsonKey(name: 'app_trans_id')
  final String appTransId;
  @override
  @JsonKey(name: 'mac')
  final String mac;

  @override
  String toString() {
    return 'OrderStatusRequest(appId: $appId, appTransId: $appTransId, mac: $mac)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStatusRequestImpl &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.appTransId, appTransId) ||
                other.appTransId == appTransId) &&
            (identical(other.mac, mac) || other.mac == mac));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, appId, appTransId, mac);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStatusRequestImplCopyWith<_$OrderStatusRequestImpl> get copyWith =>
      __$$OrderStatusRequestImplCopyWithImpl<_$OrderStatusRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderStatusRequestImplToJson(
      this,
    );
  }
}

abstract class _OrderStatusRequest implements OrderStatusRequest {
  factory _OrderStatusRequest(
          {@JsonKey(name: 'app_id') required final int appId,
          @JsonKey(name: 'app_trans_id') required final String appTransId,
          @JsonKey(name: 'mac') required final String mac}) =
      _$OrderStatusRequestImpl;

  factory _OrderStatusRequest.fromJson(Map<String, dynamic> json) =
      _$OrderStatusRequestImpl.fromJson;

  @override
  @JsonKey(name: 'app_id')
  int get appId;
  @override
  @JsonKey(name: 'app_trans_id')
  String get appTransId;
  @override
  @JsonKey(name: 'mac')
  String get mac;
  @override
  @JsonKey(ignore: true)
  _$$OrderStatusRequestImplCopyWith<_$OrderStatusRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
