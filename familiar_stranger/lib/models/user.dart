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

final User targetUser = User.fromJson({
        "_id": "625819d1e3fa573f5838629a",
        "username": "Di Hun",
        "phoneNumber": "0938085588",
        "listFriendId": [],
        "avatarUrl": "https://res.cloudinary.com/fs-app/image/upload/v1650100065/lmns2fwar7jvflmqjwvs.png",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MjVhODZiZWJlYmZhYzgwOGMyNmI5NjciLCJpYXQiOjE2NTAxMDIzNDgsImV4cCI6MTY1MDEwNTk0OH0.0a056IzVpCPOjSCGp0D6SVec3uihIwuS_bnph0KxrdQ",
        "age": "21",
        "sex": "female"
});