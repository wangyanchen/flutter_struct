class User {
  final String userName;
  final String userId;
  User(this.userName, this.userId);
  factory User.fromJson(Map<String, Object> json) {
    return new User(json['user_name'], json['userid']);
  }
}