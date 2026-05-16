class LoginResponseModle {
  final String token;
  LoginResponseModle({required this.token});

  LoginResponseModle.fromJson(Map<String, dynamic> json)
    : token = json['token'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}
