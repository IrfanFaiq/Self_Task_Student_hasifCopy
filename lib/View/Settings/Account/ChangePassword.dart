import 'package:flutter/material.dart';
import 'package:self_task_student/View/Home.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {
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
                    _oldPassword(),
                    SizedBox(height: 10),
                    _password(),
                    SizedBox(height: 10),
                    _rePassword(),
                    SizedBox(height: 40),
                    _ConfirmButton(context),
                  ],
                ))));
  }

  Widget _oldPassword() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Old Password',
      ),
    );
  }

  Widget _password() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
      ),
    );
  }

  Widget _rePassword() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Re-Password',
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
