import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_task_student/Presentation/Manage%20Subject/AddSubject.dart';
import 'package:self_task_student/View/Settings/Manage%20Subject/CourseMenu.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../Bloc/Manage Course/course_bloc.dart';

class SubjectList extends StatefulWidget{
  const SubjectList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SubjectList();
}

class _SubjectList extends State<SubjectList>{
  final CourseBloc courseBloc = CourseBloc();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    courseBloc.add(GetAllCourse(user.uid));
    super.initState();
  }

  refresh() {
    setState(() {
      initState();
    });
  }

  //refresh when pop
  onGoBack(dynamic value) {
    setState(() {
      initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Current Subjects'),
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
          bottomNavigationBar: Stack(
            clipBehavior: Clip.none,
            alignment: const FractionalOffset(1.0, 0.3),
            children: [
              Container(
                height: 40.0,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0, right: 12.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddSubject()),
                    ).then(onGoBack);
                  },
                  child: const Text('add User'),
                ),
              ),
            ],
          ),
          body: Container(
            margin: const EdgeInsets.all(8),
            child: BlocProvider(
              create: (_) => courseBloc,
              child: BlocBuilder<CourseBloc,CourseState>(builder: (context, state){
                if (state is CourseInitial) {
                  return const Center(child: CircularProgressIndicator());

                } else if (state is CourseLoading) {
                  return const Center(child: CircularProgressIndicator());

                } else if (state is GetAllLoad) {
                  return _getUserCourseList(context, state.listData, onGoBack, refresh, courseBloc);

                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
            ),
          ),
        )
    );
  }



  Widget _getUserCourseList(BuildContext context, state, onGoBack, refresh, userBloc){
    return ListView.builder(
        itemCount: state == null ? 0 : state.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){},
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    state[index].courseCode.toString(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.assignment),
                                          onPressed: () {

                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.edit),
                                          onPressed: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) => const UpdateUserPage(),
                                            //         settings: RouteSettings(
                                            //           arguments: {
                                            //             "id": state[index].id.toString(),
                                            //           },
                                            //         ))).then(onGoBack);
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            // userBloc.add(DeleteUserData(state[index].id));
                                            // refresh();
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                state[index].section.toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black38),
                              ),
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
    );
  }

  Widget _settingList() {
    return SettingsList(sections: [
      SettingsSection(tiles: [
        // SettingsTile(
        //   title: Text("Temp SEP"),
        //   onPressed: (context) {
        //     Navigator.of(context).push(MaterialPageRoute(
        //       builder: (_) => CourseMenu(),
        //     ));
        //   },
        // ),
        SettingsTile(
          title: Text("Add Subject"),
          leading: Icon(Icons.add),
          onPressed: (context) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => AddSubject(),
            ));
          },
        )
      ]),
    ]);
  }


}

