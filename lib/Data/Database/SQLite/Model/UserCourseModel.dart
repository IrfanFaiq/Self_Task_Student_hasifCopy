class UserCourseModel {
  final int? id;
  final String userId;
  final String courseCode;
  final String courseName;
  final int? creditHour;
  final String section;
  final String day;
  final String time;
  final String? labSection;
  final String? labDay;
  final String? labTime;


  UserCourseModel({
    this.id,
    required this.userId,
    required this.courseCode,
    required this.courseName,
    this.creditHour,
    required this.section,
    required this.day,
    required this.time,
    this.labSection,
    this.labDay,
    this.labTime,
  });

  factory UserCourseModel.fromJson(Map<String, dynamic> json) {
    return UserCourseModel(
      userId: json['userId'],
      courseCode: json['courseCode'],
      courseName: json['courseName'],
      creditHour: json['creditHour'],
      section: json['section'],
      day: json['day'],
      time: json['time'],
      labSection: json['labSection'],
      labDay: json['labDay'],
      labTime: json['labTime'],
    );
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'courseCode': courseCode,
    'courseName': courseName,
    'creditHour': creditHour,
    'section': section,
    "day": day,
    "time": time,
    'labSection': labSection,
    'labDay': labDay,
    'labTime': labTime,
  };
}
