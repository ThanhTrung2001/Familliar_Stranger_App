// class Friend {
//   final String id, userName, avatarUrl, age, sex;

//   const Friend({
//     required this.id,
//     this.age = 'sex',
//     this.sex = 'male',
//     this.userName = 'unknow',
//     this.avatarUrl = '',
//   });

//   // factory Friend.fromJson(Map<String, dynamic> json) => Friend(
//   //     id: json["_id"],
//   //     userName: json['username'],
//   //     avatarUrl: json['avatarUrl'],
//   //     age: json['age'],
//   //     sex: json['sex'],
//   //   );
// }

class Friend {
  late String userId;
  late String username;
  late String avatarUrl;
  late bool recentState;

  Friend({required this.userId, required this.username, required this.avatarUrl, required this.recentState});

  Friend.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    avatarUrl = json['avatarUrl'];
    recentState = json['recentState'];
  }
}

List<Friend> listFriend = [];


