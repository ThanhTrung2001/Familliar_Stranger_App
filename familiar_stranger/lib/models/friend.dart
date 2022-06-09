class Friend {
  late String userId;
  late String username;
  late String avatarUrl;
  late bool recentState;
  late String sex;
  late String age;

  Friend({required this.userId, required this.username, required this.avatarUrl, required this.recentState, required this.sex, required this.age});

  void clear(){
    userId = '';
    username = '';
    avatarUrl = '';
    recentState = false;
    sex = 'male';
    age = '';
  }

  Friend.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    avatarUrl = json['avatarUrl'];
    recentState = json['recentState'];
    sex = json['sex'];
    age = json['age'];
  }
}

List<Friend> listFriend = [];
late Friend targetUser;

