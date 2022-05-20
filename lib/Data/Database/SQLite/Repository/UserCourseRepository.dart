import 'dart:core';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../Model/UserCourseModel.dart';

class CourseDatabase {
  CourseDatabase._privateContructor();

  static final CourseDatabase instance = CourseDatabase._privateContructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, 'Database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE UserCourse('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'userId TEXT NOT NULL'
            'courseCode TEXT NOT NULL,'
            'courseName TEXT NOT NULL,'
            'isLab TEXT NOT NULL'
            'section TEXT NOT NULL,'
            'day TEXT NOT NULL,'
            'time TEXT,'
            'labSection TEXT,'
            'labDay TEXT,'
            'labTime TEXT,'
        ')'
    );
  }

  Future<int> add(UserCourseModel newCourseModel) async {
    Database db = await instance.database;
    return await db.insert('UserCourse', newCourseModel.toJson());
  }

  Future<List<UserCourseModel>> getAllCourseData(String userId) async {
    Database db = await instance.database;
    final userCourseData = await db.query('UserCourse', orderBy: 'courseCode', where: 'userId=?', whereArgs: [userId]);
    return userCourseData
        .map((json) => UserCourseModel.fromJson(json))
        .toList();
  }

  // Future<UserCourseModel> getAllUserCourseData(String userId) async {
  //   Database db = await instance.database;
  //   final userCourseData = await db.query('UserCourse',
  //       columns: [
  //         'id',
  //         'courseCode',
  //         'section',
  //         'day',
  //         'time',
  //         'labSection',
  //         'labDay',
  //         'labTime',
  //         'userId'
  //       ],
  //       where: 'userId=?',
  //       whereArgs: [userId]);
  //
  //   if (userCourseData.isNotEmpty) {
  //     return UserCourseModel.fromJson(userCourseData.first);
  //   }
  //   else{
  //     return UserCourseModel.fromJson();
  //   }
  //   throw Exception('No such ID');
  // }

  Future<UserCourseModel> getSpecificUserCourseData(int id) async {
    Database db = await instance.database;
    final userCourseData = await db.query('UserCourse',
        columns: [
          'id',
          'userId',
          'courseCode'
          'courseName',
          'creditHour',
          'isLab',
          'section',
          'day',
          'time',
          'labSection',
          'labDay',
          'labTime',
        ],
        where: 'id=?',
        whereArgs: [id]);

    if (userCourseData.isNotEmpty) {
      return UserCourseModel.fromJson(userCourseData.first);
    }
    throw Exception('No such ID');
  }

  Future<int> update(UserCourseModel userCourseModel) async {
    Database db = await instance.database;

    return db.update('UserCourse', userCourseModel.toJson(),
        where: 'id = ?', whereArgs: [userCourseModel.id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return db.delete('UserCourse', where: 'id = ?', whereArgs: [id]);
  }
}
