final String userTable = 'user';

class UserFields {
  static final columns = [id, name, profile];
  static final String id = '_id';
  static final String name = 'name';
  static final String profile = 'profile';
  static final String token = 'token';
}

class User {
  final String id;
  final String name;
  final String profile;
  final String token;

  User({required this.id, required this.name, required this.profile, required this.token});

  Map<String, Object?> toJson() => {UserFields.id: id, UserFields.name: name, UserFields.profile: profile, UserFields.token: token};
  
  static User fromJson(Map<String, Object?> json) => User(
    id: json[UserFields.id] as String,
    name: json[UserFields.name] as String,
    profile: json[UserFields.profile] as String,
    token: json[UserFields.token] as String,
  );
}
