class CourseListModel {
  final String courseCode;
  final String courseName;
  final int creditHour;
  final bool lab;

  CourseListModel({
    required this.courseCode,
    required this.courseName,
    required this.creditHour,
    required this.lab,
  });

  factory CourseListModel.fromJson(Map<String, dynamic> json) {
    return CourseListModel(
        courseCode: json['courseCode'],
        courseName: json['courseName'],
        creditHour: json['creditHour'],
        lab: json['lab']);
  }

  Map<String, dynamic> toJson() => {
        'courseCode': courseCode,
        "courseName": courseName,
        "creditHour": creditHour,
        "lab": lab
      };
}
