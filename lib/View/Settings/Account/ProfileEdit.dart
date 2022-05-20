import 'package:flutter/material.dart';
import 'package:self_task_student/Presentation/Dashboard/Home.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileEdit();
}

class _ProfileEdit extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Register'),
              centerTitle: true,
              backgroundColor: Colors.green,
            ),
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _fullName(),
                    SizedBox(height: 10),
                    _email(),
                    SizedBox(height: 10),
                    _phoneNumber(),
                    SizedBox(height: 10),
                    _matrixNumber(),
                    SizedBox(height: 10),
                    _ConfirmButton(context),
                  ],
                ))));
  }

  Widget _fullName() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Full Name',
      ),
    );
  }

  Widget _email() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Email',
      ),
    );
  }

  Widget _phoneNumber() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Phone number',
      ),
    );
  }

  Widget _matrixNumber() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Matrix ID',
      ),
    );
  }

  Widget _ConfirmButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
      style: ElevatedButton.styleFrom(
          primary: Colors.green,
          fixedSize: const Size(300, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      child: Text('Confirm'),
    );
  }
}
