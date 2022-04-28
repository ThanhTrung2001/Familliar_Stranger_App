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

late User targetUser;
//  = User.fromJson({
//         "_id": "625a86bebebfac808c26b967",
//         "username": "Di Hun",
//         "phoneNumber": "0938085588",
//         "avatarUrl": "https://res.cloudinary.com/fs-app/image/upload/v1650100065/lmns2fwar7jvflmqjwvs.png",
//         "age": "21",
//         "token":"",
//         "sex": "female"
// });