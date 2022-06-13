class Setting {
  late String id;
  late bool sound;
  late bool vibration;
  late bool notification;
  late bool status;

  Setting(
      {required this.id,
      required this.sound,
      required this.vibration,
      required this.notification,
      required this.status});

  Setting.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    sound = json['sound'];
    vibration = json['vibration'];
    notification = json['notification'];
    status = json['status'];
  }
}

var userSetting = Setting(id: '', sound: false, vibration: false, notification: false, status: false);