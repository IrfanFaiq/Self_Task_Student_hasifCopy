import 'package:firebase_auth/firebase_auth.dart';
import 'package:self_task_student/Data/Database/SQLite/Model/UserCourseModel.dart';

import '../Repository/UserCourseRepository.dart';

class UserCourseProvider {
  final _userCourseInstance = CourseDatabase.instance;

  Future<List<UserCourseModel>> getAllCourseData(String userId) {
    return _userCourseInstance.getAllCourseData(userId);
  }

  // Future<UserCourseModel> getAllUserCourseData(String userId) {
  //   return _userCourseInstance.getAllUserCourseData(userId);
  // }

  Future<UserCourseModel> getSpecificUserCourseData(int id) {
    return _userCourseInstance.getSpecificUserCourseData(id);
  }

  Future<int> saveData(UserCourseModel) {
    return _userCourseInstance.add(UserCourseModel);
  }

  Future<int> updateData(UserCourseModel) {
    return _userCourseInstance.update(UserCourseModel);
  }

  Future<int> deleteData(int id) {
    return _userCourseInstance.delete(id);
  }
}
