import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Validation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Form Validation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  String name, email, phone, place;
  TextEditingController nameController = TextEditingController(),
      emailController = TextEditingController(),
      phoneController = TextEditingController(),
      placeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your Name',
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                keyboardType: TextInputType.text,
                controller: nameController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your Name';
                  }
                  //Regex for alphabets(name)
                  if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(value.trim())) {
                    return 'Enter a valid Name';
                  } else {
                    name = value.trim();
                  }

                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your Email',
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your Email';
                  }
                  //Regex for email
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value.trim())) {
                    return 'Enter a valid Email';
                  } else {
                    email = value.trim();
                  }

                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your Phone number',
                  border: OutlineInputBorder(),
                  labelText: 'Phone',
                ),
                keyboardType: TextInputType.phone,
                controller: phoneController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your Phone number';
                  }
                  //Regex for numbers
                  if (!RegExp(r'^[0-9]+$').hasMatch(value.trim()) &&
                      value.trim().length != 10) {
                    return 'Phone number should be in 10 digit(Indian number)';
                  } else {
                    phone = value.trim();
                  }

                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Place (optional)',
                  border: OutlineInputBorder(),
                  labelText: 'Place',
                ),
                keyboardType: TextInputType.text,
                controller: placeController,
                validator: (value) {
                  //Regex for alphabets
                  if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(value.trim()) &&
                      value.isNotEmpty) {
                    return 'Enter a valid Place';
                  } else {
                    place = value.trim();
                  }

                  return null;
                },
              ),
            ),
            RaisedButton(
              onPressed: () {
                //this validate() validates your whole form and return a boolean if all validates then true if not false
                // if u wont call validate() your form wont validate.
                if (_formKey.currentState.validate()) {
                  // this executes after everything is validated
                  print('form validated');
                } else {
                  print('form not validated');
                }
              },
              child: Text('Validate'),
            ),
          ],
        ),
      ),
    );
  }
}
