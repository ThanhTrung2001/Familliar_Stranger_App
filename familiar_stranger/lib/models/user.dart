class User {
  final String id, phoneNumber, userName, avatarUrl, age, sex, token;

  const User({
    required this.id,
    required this.phoneNumber,
    this.age = 'sex',
    this.sex = 'male',
    this.userName = 'unknow',
    this.avatarUrl = '',
    this.token = ''
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["_id"],
      phoneNumber: json['phoneNumber'],
      userName: json['username'],
      avatarUrl: json['avatarUrl'],
      age: json['age'],
      sex: json['sex'],
      token: json['token'], 
    );
}