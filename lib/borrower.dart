import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
           appBar: AppBar(title: Text('Insert TextField Data to MySQL Database')),
           backgroundColor: Colors.greenAccent,
            body: Center(
              child: TransfterData()
              )
            )
          );
  }
}
 
class TransfterData extends StatefulWidget {
 
TransfterDataWidget createState() => TransfterDataWidget();
 
}
 
class TransfterDataWidget extends State {
 
  // Getting value from TextField widget.
  final nameController = TextEditingController();
  final studentNumberController = TextEditingController();
  final subjectController = TextEditingController();
  final yearController = TextEditingController();
 
  // Boolean variable for CircularProgressIndicator.
  bool visible = false ;
 
  Future webCall() async{
 
    // Showing CircularProgressIndicator using State.
    setState(() {
     visible = true ; 
    });
 
    // Getting value from Controller
    String name = nameController.text;
    String studentnumber = studentNumberController.text;
    String subject = subjectController.text;
    String yearcourse = yearController.text;
 
    // API URL
    var url = 'http://192.168.1.10/LAB-System/api/submit_data.php';
 
    // Store all data with Param Name.
    var data = {'name': name, 'student_number' : studentnumber, 'subject': subject, 'course_year': yearcourse,};
 
    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));
 
    // Getting Server response into variable.
    var message = jsonDecode(response.body);
 
    // If Web call Success than Hide the CircularProgressIndicator.
    if(response.statusCode == 200){
      setState(() {
       visible = false; 
      });
    }
 
    // Showing Alert Dialog with Response JSON.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
 
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.greenAccent,),
        body: SingleChildScrollView(
          child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text('Fill All Information in Form', 
                       style: TextStyle(fontSize: 22))),
                       
              Divider (),
              
              Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                  controller: nameController,
                  autocorrect: true,
                  decoration: InputDecoration(hintText: 'Enter Name Here'),

                )
              ),
 
              Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                  controller: studentNumberController,
                  autocorrect: true,
                  decoration: InputDecoration(hintText: 'Enter Student Number'),
                  keyboardType: TextInputType.number,
                )
              ),
 
              Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                  controller: subjectController,
                  autocorrect: true,
                  decoration: InputDecoration(hintText: 'Enter Subject Code'),
                )
              ),

              Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                  controller: yearController,
                  autocorrect: true,
                  decoration: InputDecoration(hintText: 'Enter Year/Course'),
                )
              ),
             
              Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                  autocorrect: true,
                  decoration: InputDecoration(hintText: 'Enter Apparatus Borrow'),
                )
              ),

              Container(
                width: 280,
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  autocorrect: true,
                  decoration:  InputDecoration(hintText: 'Name'),
                )
              ),
 
              RaisedButton(
                onPressed: webCall,
                color: Colors.greenAccent,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Text('Send Borrowers'),
              ),
 
              Visibility(
                visible: visible, 
                child: Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: CircularProgressIndicator()
                  )
                ),
 
            ],
          ),
        )));
        
  }
}