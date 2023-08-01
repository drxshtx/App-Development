import 'dart:html';

import 'package:budget_app/auth.dart';
import 'package:budget_app/structure/user.dart';
import 'package:flutter/material.dart';
import 'package:budget_app/screens/signin.dart';
import 'package:budget_app/screens/page1.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(StreamProvider.value(
      initialData: Users(),
    value:AuthService().user,
    child: MaterialApp(
        home: SignIn()

    ),
  ));
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _inputController2 = TextEditingController();
  bool enable = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _inputController.dispose();
    _inputController2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Budget Tracker',
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello User !!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height:10),
            Text(
                'Enter Login Details',
                style:TextStyle(
                  fontSize: 15,
                )
            ),
            Container(
                width:200,
                child:TextField(
                  decoration: InputDecoration(hintText: 'Username:'),
                  controller: _inputController,
                  onChanged: (data){
                    if(_inputController.text.isEmpty || _inputController2.text.isEmpty){
                      enable=false;
                    }else{
                      enable =true;
                    }
                    setState(() {});
                  },
                )),
            Container(
              width:200,
              child:TextField(
                decoration: InputDecoration(hintText: 'Password:'),
                controller: _inputController2,
                onChanged: (data){
                  if(_inputController.text.isEmpty || _inputController2.text.isEmpty){
                    enable=false;
                  }else{
                    enable =true;
                  }
                  setState(() {});
                },
              ),),
            SizedBox(height:10),
            ElevatedButton(
              onPressed:enable? (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => budget()));
                _inputController.clear();
                _inputController2.clear();
              }:null,
              child: Text(
                  'Login'
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}

