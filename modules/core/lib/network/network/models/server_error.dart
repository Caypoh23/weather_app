class ServerError {
  const ServerError({required this.code, required this.msg});

  final int code;
  final String msg;

  factory ServerError.fromJson(Map<String, dynamic> json) {
    return ServerError(code: json['code'] as int, msg: json['msg'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'code': code, 'msg': msg};
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ServerError && other.code == code && other.msg == msg;
  }

  @override
  int get hashCode => code.hashCode ^ msg.hashCode;

  @override
  String toString() {
    return 'ServerError(code: $code, msg: $msg)';
  }
}
