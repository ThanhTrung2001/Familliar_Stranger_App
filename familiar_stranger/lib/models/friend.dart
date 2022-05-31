class Friend {
  late String userId;
  late String username;
  late String avatarUrl;
  late bool recentState;

  Friend({required this.userId, required this.username, required this.avatarUrl, required this.recentState});

  void clear(){
    userId = '';
    username = '';
    avatarUrl = '';
    recentState = false;
  }

  Friend.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    avatarUrl = json['avatarUrl'];
    recentState = json['recentState'];
  }
}

List<Friend> listFriend = [];
late Friend targetUser;

