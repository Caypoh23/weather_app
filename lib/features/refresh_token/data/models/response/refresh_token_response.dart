// Package imports:
import 'package:core/exports/json.dart';

part 'refresh_token_response.g.dart';

@JsonSerializable(
  createToJson: false,
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class RefreshTokenResponse {
  const RefreshTokenResponse({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);

  final String accessToken;
  final String tokenType;
  final int expiresIn;
}
