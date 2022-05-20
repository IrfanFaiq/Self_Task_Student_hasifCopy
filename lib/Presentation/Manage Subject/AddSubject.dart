import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_task_student/Bloc/Manage%20Course/course_bloc.dart';
import 'package:intl/intl.dart';
import 'package:self_task_student/Data/Database/SQLite/Model/UserCourseModel.dart';
import 'package:self_task_student/View/Settings/Manage%20Subject/SubjectList.dart';

import '../../View/Settings/Manage Subject/CheckBoxState.dart';

/*
  TODO: Compleate Time class and lab time (make sure to NOT NULL time in database repository)
    Delete unrelated code such as the checkbox (save it to other file to remember how to create checkbox list)
*.
 */


class AddSubject extends StatefulWidget {
  const AddSubject({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddSubject();
}

class _AddSubject extends State<AddSubject> {
  final lectureDays = [
    CheckBoxState(title: 'Monday'),
    CheckBoxState(title: 'Tuesday'),
    CheckBoxState(title: 'Wednesday'),
    CheckBoxState(title: 'Thursday'),
    CheckBoxState(title: 'Friday'),
  ];

  final labDays = [
    CheckBoxState(title: 'Monday'),
    CheckBoxState(title: 'Tuesday'),
    CheckBoxState(title: 'Wednesday'),
    CheckBoxState(title: 'Thursday'),
    CheckBoxState(title: 'Friday'),
  ];

  TimeOfDay selectedClassTime = TimeOfDay.now();
  TimeOfDay selectedLabTime = TimeOfDay.now();
  final CourseBloc courseBloc = CourseBloc();
  final user = FirebaseAuth.instance.currentUser!;
  final _formKey = GlobalKey<FormState>();
  String _courseDay = 'Monday';
  String? _labDay;
  final TextEditingController _courseName = TextEditingController();
  final TextEditingController _courseCode = TextEditingController();
  final TextEditingController _courseSection = TextEditingController();
  final TextEditingController? _labSection = TextEditingController();
  final TextEditingController _classTime = TextEditingController();
  final TextEditingController? _labTime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Add Subject'),
              centerTitle: true,
              backgroundColor: Colors.green,
            ),
            body: BlocProvider(
              create: (_) => courseBloc,
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _cName(),
                          const SizedBox(height: 15),
                          _cCode(),
                          const SizedBox(height: 15),
                          _cSection(),
                          const SizedBox(height: 15),
                          _lSection(),
                          const SizedBox(height: 15),
                          Row(
                            children: [Text('Class Day')],
                          ),
                          _cDay(),
                          const SizedBox(height: 5),
                          _cTime(),
                          const SizedBox(height: 15),
                          Row(
                            children: [Text('Lab Day')],
                          ),
                          _lDay(),
                          const SizedBox(height: 5),
                          _lTime(),
                          const SizedBox(height: 15),

                          ElevatedButton(
                            onPressed: () async{
                              if(_formKey.currentState!.validate()){
                                // UserCourseModel userCourseModel = UserCourseModel(courseCode: _courseCode.text, section: _courseSection.text, day: _courseDay, time: 'one', labSection: _labSection?.text, labDay: _labDay, labTime: null, userId: user.uid, courseName: '', creditHour: null);
                                // courseBloc.add(CreateUserCourseData(userCourseModel));

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Data Added Successfully'),
                                  backgroundColor: Colors.green,
                                  )
                                );
                                Navigator.pop(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                fixedSize: const Size(300, 60),
                                shape:
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                            child: Text('Confirm'),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ),

            ),
        ),
            // body: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 40),
            //     child: ListView(
            //       children: [
            //         Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Row(
            //               children: [Text('Course Name')],
            //             ),
            //             SizedBox(height: 10),
            //             _cName(),
            //             SizedBox(height: 10),
            //             Row(
            //               children: [Text('Course Code')],
            //             ),
            //             _cCode(),
            //             SizedBox(height: 10),
            //             Row(
            //               children: [Text('Course Section')],
            //             ),
            //             _cSection(),
            //             SizedBox(height: 10),
            //             Row(
            //               children: [Text('Lab Section')],
            //             ),
            //             _labSection(),
            //             SizedBox(height: 10),
            //             Row(
            //               children: [Text('Lecture')],
            //             ),
            //             ...lectureDays.map(_checkBoxList).toList(),
            //             SizedBox(height: 10),
            //             Row(
            //               children: [Text('Lab')],
            //             ),
            //             ...labDays.map(_checkBoxList).toList(),
            //             SizedBox(height: 10),
            //             _ConfirmButton(context),
            //           ],
            //         )
            //       ],
            //     ))
        );
  }

  Widget _cName() {
    return TextFormField(
      controller: _courseName,
      decoration: InputDecoration(
        hintText: 'Course Name',
      ),
    );
  }

  Widget _cCode() {// TODO: BLoc
    return TextFormField(
      controller: _courseCode,
      decoration: InputDecoration(
        hintText: 'Course Code',
      ),
    );
  }

  Widget _cSection() {
    return TextFormField(
      controller: _courseSection,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Course Section',
      ),
    );
  }

  Widget _lSection() {
    return TextFormField(
      controller: _labSection,
      decoration: InputDecoration(
        hintText: 'Lab Section(if any)',
      ),
    );
  }

  Widget _cDay() {
    return DropdownButton(
        value: _courseDay,
        items: <String>['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        underline: Container(
          height: 2,
          color: Colors.black26,
        ),
        elevation: 16,
        onChanged: (String? newValue) {
          setState(() {
            _courseDay = newValue!;
          });
        });
  }

  Widget _lDay() {
    return DropdownButton(
        value: _labDay,
        items: <String>['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        underline: Container(
          height: 2,
          color: Colors.black26,
        ),
        elevation: 16,
        onChanged: (String? anotherValue) {
          setState(() {
            _labDay = anotherValue!;
          });
        });
  }

  Widget _cTime(){
    return TextFormField(
      controller: _classTime,
      readOnly: true,
      onTap: () async {
        await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        ).then((value) {
          setState(() {
            selectedClassTime = value!;
          });
        });;
        _classTime.text = selectedClassTime.format(context);
      },
      decoration: InputDecoration(// add padding to adjust text
        contentPadding: EdgeInsets.only(top: 15),
        hintText: "Class Time",
        prefixIcon: Icon(Icons.access_time, size: 25),
        suffixIcon: IconButton(
          onPressed: _classTime.clear,
          icon: Icon(Icons.clear),
        )
      )
    );
  }

  bool isThere(){
    if(_labDay?.length != null){
      return true;
    }else{
      return false;
    }
  }

  Widget _lTime(){
    return TextField(
      controller: _labTime,
      enabled: isThere(),
      readOnly: true,
      onTap: () async {
        await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        ).then((value) {
          setState(() {
            selectedLabTime = value!;
          });
        });;

        _labTime?.text = selectedLabTime.format(context);
      },
      decoration: InputDecoration(// add padding to adjust text
          contentPadding: EdgeInsets.only(top: 15),
          hintText: "Lab Time",
          prefixIcon: Icon(Icons.access_time, size: 25),
          suffixIcon: IconButton(
            onPressed: _classTime.clear,
            icon: Icon(Icons.clear),
          )
      )
    );
  }

  Widget _daysCheckBox(day) {
    bool isCheck = false;
    return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(day),
        value: isCheck,
        onChanged: (bool? value) {
          setState(() {
            isCheck = value!;
          });
        });
  }

  // Widget _ConfirmButton(BuildContext context) {
  //   return
  //
  //   return ElevatedButton(
  //     onPressed: () {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => SubjectList()));
  //     },
  //     style: ElevatedButton.styleFrom(
  //         primary: Colors.green,
  //         fixedSize: const Size(300, 60),
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
  //     child: Text('Confirm'),
  //   );
  // }

  Widget _checkBoxList(CheckBoxState checkbox) => CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: checkbox.value,
        title: Text(checkbox.title),
        onChanged: (value) => setState(() => checkbox.value = value!),
      );
}
