import 'package:flutter/material.dart';
import '../structure/object.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  String category='';
  late TextEditingController controller1;
  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  @override
  Future openDialog() => showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        title: Text( ' New Entry'),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Category'),
              controller: controller1,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Amount'),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).pop(controller1);
                controller1.clear();
              },
              icon: Icon(Icons.add))
        ],
      ));
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
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.map((item)=>Text('${item.category} :  ${item.amount}')).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        child: Icon(Icons.add),
        onPressed: ()async{
          final category = await openDialog();
          setState(() {
            this.category = category as String;
          }
          );
        },
      ),   );
  }
}
