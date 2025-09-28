// Package imports:
import 'package:core/exports/json.dart';

part 'refresh_token_request.g.dart';

@JsonSerializable(createFactory: false, fieldRename: FieldRename.snake)
class RefreshTokenRequest {
  const RefreshTokenRequest({
    required this.grantType,
    required this.clientId,
    required this.clientSecret,
  });

  Map<String, dynamic> toJson() => _$RefreshTokenRequestToJson(this);

  final String grantType;
  final String clientId;
  final String clientSecret;
}
