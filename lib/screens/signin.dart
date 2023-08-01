
import 'package:flutter/material.dart';
import '../auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: ElevatedButton(
           child: Text('Sign in Anonymously'),
          onPressed: () async{
             dynamic result = await _auth.signInAnan();
             if(result==null){
               print('error signing in');
             }else{
               //ignore_for_file: avoid_print
               print('signed in');
               print(result.uid);
             }
          }  ,
        ) ,
      )
    );
  }
}
