// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseErrorResponse _$BaseErrorResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BaseErrorResponse',
      json,
      ($checkedConvert) {
        final val = BaseErrorResponse(
          statusCode:
              $checkedConvert('statusCode', (v) => (v as num?)?.toInt() ?? -1),
          message: $checkedConvert(
              'message', (v) => v as String? ?? "Internal server error"),
        );
        return val;
      },
    );

Map<String, dynamic> _$BaseErrorResponseToJson(BaseErrorResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
