part of 'course_bloc.dart';

abstract class CourseState extends Equatable {
  const CourseState();
  @override
  List<Object> get props => [];
}

class CourseInitial extends CourseState {}
class CourseLoading extends CourseState {}
class CourseError extends CourseState {}

// Get all
class GetAllLoad extends CourseState {
  final List<UserCourseModel> listData;
  const GetAllLoad(this.listData);
}

class GetUserLoad extends CourseState {
  final UserCourseModel model;
  const GetUserLoad(this.model);
}
//Get Specific
class GetSpecificLoad extends CourseState{
  final UserCourseModel model;
  const GetSpecificLoad(this.model);
}

//Create
class CreateLoad extends CourseState{}

//Update
class UpdateLoad extends CourseState{
  final UserCourseModel model;
  const UpdateLoad(this.model);
}

//Delete
class DeleteLoad extends CourseState{}