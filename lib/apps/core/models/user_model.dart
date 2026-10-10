class UserModel {
  final String id;
  final String fullName;
  final String role;
  final String? avatarUrl;

  UserModel({
    required this.id,
    required this.fullName,
    required this.role,
    this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as String,
        fullName: json['full_name'] as String,
        role: json['role'] as String,
        avatarUrl: json['avatar_url'] as String? ?? '',
      );

  UserModel copyWith({
    String? id,
    String? fullName,
    String? role,
    String? avatarUrl,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      role: role ?? this.role,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
