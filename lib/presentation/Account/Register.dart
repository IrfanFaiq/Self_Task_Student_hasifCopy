import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Register();
}

class _Register extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _fullName(),
          SizedBox(height: 10),
          _email(),
          SizedBox(height: 10),
          _phoneNumber(),
          SizedBox(height: 10),
          _matrixNumber(),
          SizedBox(height: 10),
          _password(),
          SizedBox(height: 10),
          _rePassword(),
          SizedBox(height: 40),
          _registerButton(context),
        ]),
      ),
    );
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

  Widget _registerButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Register()));
      },
      style: ElevatedButton.styleFrom(
          primary: Colors.green,
          fixedSize: const Size(300, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      child: Text('Register'),
    );
  }
}
