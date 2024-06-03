class User {
 
  final String username;
  final String password;
  final int admin_type_id;

  const User({
   
    required this.username,
    required this.admin_type_id,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
    
      username: json['username'] as String,
      password: json['password'] as String,
      admin_type_id: json['admin_type_id'] as int,
    );
  }
}