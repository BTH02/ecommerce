// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateOrderResponse _$CreateOrderResponseFromJson(Map<String, dynamic> json) {
  return _CreateOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateOrderResponse {
  @JsonKey(name: 'return_code')
  int? get returnCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'return_message')
  String? get returnMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_return_code')
  int? get subReturnCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_return_message')
  String? get subReturnMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_url')
  String? get orderUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'zp_trans_token')
  String? get zpTransToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_token')
  String? get orderToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'qr_code')
  String? get qrCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateOrderResponseCopyWith<CreateOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOrderResponseCopyWith<$Res> {
  factory $CreateOrderResponseCopyWith(
          CreateOrderResponse value, $Res Function(CreateOrderResponse) then) =
      _$CreateOrderResponseCopyWithImpl<$Res, CreateOrderResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'return_code') int? returnCode,
      @JsonKey(name: 'return_message') String? returnMessage,
      @JsonKey(name: 'sub_return_code') int? subReturnCode,
      @JsonKey(name: 'sub_return_message') String? subReturnMessage,
      @JsonKey(name: 'order_url') String? orderUrl,
      @JsonKey(name: 'zp_trans_token') String? zpTransToken,
      @JsonKey(name: 'order_token') String? orderToken,
      @JsonKey(name: 'qr_code') String? qrCode});
}

/// @nodoc
class _$CreateOrderResponseCopyWithImpl<$Res, $Val extends CreateOrderResponse>
    implements $CreateOrderResponseCopyWith<$Res> {
  _$CreateOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnCode = freezed,
    Object? returnMessage = freezed,
    Object? subReturnCode = freezed,
    Object? subReturnMessage = freezed,
    Object? orderUrl = freezed,
    Object? zpTransToken = freezed,
    Object? orderToken = freezed,
    Object? qrCode = freezed,
  }) {
    return _then(_value.copyWith(
      returnCode: freezed == returnCode
          ? _value.returnCode
          : returnCode // ignore: cast_nullable_to_non_nullable
              as int?,
      returnMessage: freezed == returnMessage
          ? _value.returnMessage
          : returnMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      subReturnCode: freezed == subReturnCode
          ? _value.subReturnCode
          : subReturnCode // ignore: cast_nullable_to_non_nullable
              as int?,
      subReturnMessage: freezed == subReturnMessage
          ? _value.subReturnMessage
          : subReturnMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      orderUrl: freezed == orderUrl
          ? _value.orderUrl
          : orderUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      zpTransToken: freezed == zpTransToken
          ? _value.zpTransToken
          : zpTransToken // ignore: cast_nullable_to_non_nullable
              as String?,
      orderToken: freezed == orderToken
          ? _value.orderToken
          : orderToken // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateOrderResponseImplCopyWith<$Res>
    implements $CreateOrderResponseCopyWith<$Res> {
  factory _$$CreateOrderResponseImplCopyWith(_$CreateOrderResponseImpl value,
          $Res Function(_$CreateOrderResponseImpl) then) =
      __$$CreateOrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'return_code') int? returnCode,
      @JsonKey(name: 'return_message') String? returnMessage,
      @JsonKey(name: 'sub_return_code') int? subReturnCode,
      @JsonKey(name: 'sub_return_message') String? subReturnMessage,
      @JsonKey(name: 'order_url') String? orderUrl,
      @JsonKey(name: 'zp_trans_token') String? zpTransToken,
      @JsonKey(name: 'order_token') String? orderToken,
      @JsonKey(name: 'qr_code') String? qrCode});
}

/// @nodoc
class __$$CreateOrderResponseImplCopyWithImpl<$Res>
    extends _$CreateOrderResponseCopyWithImpl<$Res, _$CreateOrderResponseImpl>
    implements _$$CreateOrderResponseImplCopyWith<$Res> {
  __$$CreateOrderResponseImplCopyWithImpl(_$CreateOrderResponseImpl _value,
      $Res Function(_$CreateOrderResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnCode = freezed,
    Object? returnMessage = freezed,
    Object? subReturnCode = freezed,
    Object? subReturnMessage = freezed,
    Object? orderUrl = freezed,
    Object? zpTransToken = freezed,
    Object? orderToken = freezed,
    Object? qrCode = freezed,
  }) {
    return _then(_$CreateOrderResponseImpl(
      returnCode: freezed == returnCode
          ? _value.returnCode
          : returnCode // ignore: cast_nullable_to_non_nullable
              as int?,
      returnMessage: freezed == returnMessage
          ? _value.returnMessage
          : returnMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      subReturnCode: freezed == subReturnCode
          ? _value.subReturnCode
          : subReturnCode // ignore: cast_nullable_to_non_nullable
              as int?,
      subReturnMessage: freezed == subReturnMessage
          ? _value.subReturnMessage
          : subReturnMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      orderUrl: freezed == orderUrl
          ? _value.orderUrl
          : orderUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      zpTransToken: freezed == zpTransToken
          ? _value.zpTransToken
          : zpTransToken // ignore: cast_nullable_to_non_nullable
              as String?,
      orderToken: freezed == orderToken
          ? _value.orderToken
          : orderToken // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateOrderResponseImpl implements _CreateOrderResponse {
  _$CreateOrderResponseImpl(
      {@JsonKey(name: 'return_code') this.returnCode,
      @JsonKey(name: 'return_message') this.returnMessage,
      @JsonKey(name: 'sub_return_code') this.subReturnCode,
      @JsonKey(name: 'sub_return_message') this.subReturnMessage,
      @JsonKey(name: 'order_url') this.orderUrl,
      @JsonKey(name: 'zp_trans_token') this.zpTransToken,
      @JsonKey(name: 'order_token') this.orderToken,
      @JsonKey(name: 'qr_code') this.qrCode});

  factory _$CreateOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateOrderResponseImplFromJson(json);

  @override
  @JsonKey(name: 'return_code')
  final int? returnCode;
  @override
  @JsonKey(name: 'return_message')
  final String? returnMessage;
  @override
  @JsonKey(name: 'sub_return_code')
  final int? subReturnCode;
  @override
  @JsonKey(name: 'sub_return_message')
  final String? subReturnMessage;
  @override
  @JsonKey(name: 'order_url')
  final String? orderUrl;
  @override
  @JsonKey(name: 'zp_trans_token')
  final String? zpTransToken;
  @override
  @JsonKey(name: 'order_token')
  final String? orderToken;
  @override
  @JsonKey(name: 'qr_code')
  final String? qrCode;

  @override
  String toString() {
    return 'CreateOrderResponse(returnCode: $returnCode, returnMessage: $returnMessage, subReturnCode: $subReturnCode, subReturnMessage: $subReturnMessage, orderUrl: $orderUrl, zpTransToken: $zpTransToken, orderToken: $orderToken, qrCode: $qrCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrderResponseImpl &&
            (identical(other.returnCode, returnCode) ||
                other.returnCode == returnCode) &&
            (identical(other.returnMessage, returnMessage) ||
                other.returnMessage == returnMessage) &&
            (identical(other.subReturnCode, subReturnCode) ||
                other.subReturnCode == subReturnCode) &&
            (identical(other.subReturnMessage, subReturnMessage) ||
                other.subReturnMessage == subReturnMessage) &&
            (identical(other.orderUrl, orderUrl) ||
                other.orderUrl == orderUrl) &&
            (identical(other.zpTransToken, zpTransToken) ||
                other.zpTransToken == zpTransToken) &&
            (identical(other.orderToken, orderToken) ||
                other.orderToken == orderToken) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      returnCode,
      returnMessage,
      subReturnCode,
      subReturnMessage,
      orderUrl,
      zpTransToken,
      orderToken,
      qrCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrderResponseImplCopyWith<_$CreateOrderResponseImpl> get copyWith =>
      __$$CreateOrderResponseImplCopyWithImpl<_$CreateOrderResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateOrderResponseImplToJson(
      this,
    );
  }
}

abstract class _CreateOrderResponse implements CreateOrderResponse {
  factory _CreateOrderResponse(
          {@JsonKey(name: 'return_code') final int? returnCode,
          @JsonKey(name: 'return_message') final String? returnMessage,
          @JsonKey(name: 'sub_return_code') final int? subReturnCode,
          @JsonKey(name: 'sub_return_message') final String? subReturnMessage,
          @JsonKey(name: 'order_url') final String? orderUrl,
          @JsonKey(name: 'zp_trans_token') final String? zpTransToken,
          @JsonKey(name: 'order_token') final String? orderToken,
          @JsonKey(name: 'qr_code') final String? qrCode}) =
      _$CreateOrderResponseImpl;

  factory _CreateOrderResponse.fromJson(Map<String, dynamic> json) =
      _$CreateOrderResponseImpl.fromJson;

  @override
  @JsonKey(name: 'return_code')
  int? get returnCode;
  @override
  @JsonKey(name: 'return_message')
  String? get returnMessage;
  @override
  @JsonKey(name: 'sub_return_code')
  int? get subReturnCode;
  @override
  @JsonKey(name: 'sub_return_message')
  String? get subReturnMessage;
  @override
  @JsonKey(name: 'order_url')
  String? get orderUrl;
  @override
  @JsonKey(name: 'zp_trans_token')
  String? get zpTransToken;
  @override
  @JsonKey(name: 'order_token')
  String? get orderToken;
  @override
  @JsonKey(name: 'qr_code')
  String? get qrCode;
  @override
  @JsonKey(ignore: true)
  _$$CreateOrderResponseImplCopyWith<_$CreateOrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
