import 'package:flutter/material.dart';
import 'page2.dart';

class budget extends StatefulWidget {
  const budget({super.key});

  @override
  State<budget> createState() => _budgetState();
}

class _budgetState extends State<budget> {
  int expense=26700;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Budget Tracker',
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[400],
      )
      ,body:Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(Icons.person_3_rounded, size:50),
          ),
          SizedBox(height:30),
          Text(
            'Welcome Back !!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(height:20),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => page2()));
            },
            child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Expense  :',
                      style: TextStyle(
                        fontSize:20,
                      ),
                    ),
                    SizedBox(width:10),
                    Text(
                        '$expense',
                        style: TextStyle(
                          fontSize: 20,
                        )
                    ),
                    Icon(Icons.arrow_drop_down,size:30),

                  ],
                )
            ),
          ),
        ],
      ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.purpleAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}