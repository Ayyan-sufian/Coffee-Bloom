class UserData {
  final int id;
  final String name;
  final String email;
  final String address;
  final String token;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      token: json['token'] ?? '',
    );
  }
}
