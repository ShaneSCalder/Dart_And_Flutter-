import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
}
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButtonField(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email address',
        hintText: 'you@youremail.com'
      ),
      validator: (value) {
        if (!value.contains('@')) {
          return 'Please enter a valid email.';
        }
        return null;
      },
    );
  }


  Widget passwordField() {
    return TextFormField(
        //to obscure text use
        //obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password.',
          hintText: 'Password',
        ),
      validator: (value) {
        if (value.length < 8) {
          return 'Password must be 8 charaters or more';
        }
        return null;
      }
    );
  }

  Widget submitButtonField(){
    return RaisedButton(
      color: Colors.lightBlueAccent,
      child: Text('Submit'),
      onPressed: () {
        print(formKey.currentState.validate());
      },
    );

  }

