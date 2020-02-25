import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar:
                AppBar(title: Text('Insert TextField Data to MySQL Database')),
            backgroundColor: Colors.greenAccent,
            body: Center(child: TransfterData())));
  }
}

class TransfterData extends StatefulWidget {
  TransfterData({Key key, this.title}) : super(key: key);

  final String title;

  TransfterDataWidget createState() => TransfterDataWidget();
}

class TransfterDataWidget extends State {
  final _formKey = GlobalKey<FormState>();
 

  // Getting value from TextField widget.

  String name, student, subject, q1, q2, q3, q4, q5, q6,q7;
  // final nameController = TextEditingController();
  // final studentNumberController = TextEditingController();
  // final subjectController = TextEditingController();
  // final yearController = TextEditingController();

  TextEditingController txtNota = new TextEditingController();
  TextEditingController txtNota1 = new TextEditingController();
  TextEditingController txtNota2 = new TextEditingController();
  TextEditingController txtNota3 = new TextEditingController();
  TextEditingController txtNota4 = new TextEditingController();
  TextEditingController txtNota5 = new TextEditingController();
  TextEditingController txtNota6 = new TextEditingController();

  @override
  void initState() {
    super.initState();
    listarClientes();
  }

  List listaCliente;
  List listaCliente1;
  List listaCliente2;
 
  Future<Null> listarClientes() async {
    var respuesta;
    final response = await http.post(
        "http://192.168.1.83/LAB-System/api/ajax/cliente.php?op=ListarCliente",
        body: {});
    setState(() {
      respuesta = json.decode(response.body);
      listaCliente = respuesta['data'];
      listaCliente1 = respuesta['data'];
      listaCliente2 = respuesta['data'];

    });
    pintarClientes();
    pintarClientes1();
    pintarClientes2();
    pintarClientes3();
    pintarClientes4();
    pintarClientes5();
   
  }

  String _dropdownValue = null;
  String _dropdownValue1 = null;
  String _dropdownValue2 = null;
  String _dropdownValue3 = null;
  String _dropdownValue4 = null;
  String _dropdownValue5 = null;
 

  Map<String, String> listarClienteM = Map();
  Map<String, String> listarClienteM1 = Map();
  Map<String, String> listarClienteM2 = Map();
  

  void pintarClientes() {
    for (var i = 0; i < listaCliente.length; i++) {
      listarClienteM[listaCliente[i]['codCli']] = listaCliente[i]['nombre'];
    }
    _dropdownValue = listarClienteM[listaCliente[0]['codCli']];
  }

  String mostrarcodigoCliente() {
    var usdKey = listarClienteM.keys.firstWhere(
        (K) => listarClienteM[K] == _dropdownValue,
        orElse: () => null);
    return usdKey;
  }

// second dropdown
  void pintarClientes1() {
    for (var i = 0; i < listaCliente.length; i++) {
      listarClienteM[listaCliente[i]['codCli']] = listaCliente[i]['nombre'];
    }
    _dropdownValue1 = listarClienteM[listaCliente[0]['codCli']];
  }

  String mostrarcodigoCliente1() {
    var usdKey = listarClienteM.keys.firstWhere(
        (K) => listarClienteM[K] == _dropdownValue1,
        orElse: () => null);
    return usdKey;
  }

// 3rd dropdown
  void pintarClientes2() {
    for (var i = 0; i < listaCliente.length; i++) {
      listarClienteM[listaCliente[i]['codCli']] = listaCliente[i]['nombre'];
    }
    _dropdownValue2 = listarClienteM[listaCliente[0]['codCli']];
  }

  String mostrarcodigoCliente2() {
    var usdKey = listarClienteM.keys.firstWhere(
        (K) => listarClienteM[K] == _dropdownValue2,
        orElse: () => null);
    return usdKey;
  }

// 4th dropdown
  void pintarClientes3() {
    for (var i = 0; i < listaCliente.length; i++) {
      listarClienteM[listaCliente[i]['codCli']] = listaCliente[i]['nombre'];
    }
    _dropdownValue3 = listarClienteM[listaCliente[0]['codCli']];
  }

  String mostrarcodigoCliente3() {
    var usdKey = listarClienteM.keys.firstWhere(
        (K) => listarClienteM[K] == _dropdownValue3,
        orElse: () => null);
    return usdKey;
  }

// 5th dropdown
  void pintarClientes4() {
    for (var a = 0; a < listaCliente1.length; a++) {
      listarClienteM1[listaCliente1[a]['codCli']] = listaCliente1[a]['subject'];
    }
    _dropdownValue4 = listarClienteM1[listaCliente1[0]['codCli']];
  }

  String mostrarcodigoCliente4() {
    var usdKey = listarClienteM1.keys.firstWhere(
        (K) => listarClienteM1[K] == _dropdownValue4,
        orElse: () => null);
    return usdKey;
  }

// 6th dropdown
  void pintarClientes5() {
    for (var a = 0; a < listaCliente2.length; a++) {
      listarClienteM2[listaCliente2[a]['codCli']] = listaCliente2[a]['course'];
    }
    _dropdownValue5 = listarClienteM2[listaCliente2[0]['codCli']];
  }

  String mostrarcodigoCliente5() {
    var usdKey = listarClienteM2.keys.firstWhere(
        (K) => listarClienteM2[K] == _dropdownValue5,
        orElse: () => null);
    return usdKey;
  }


///////////////////////////////////////////////////////
  String res = '';
  Future<String> guardarReserva() async {
    var respuesta;
    final response = await http.post(
        "http://192.168.1.83/LAB-System/api/ajax/cliente.php?op=guardarReserva",
        body: {
          "nombre": _dropdownValue,
          "motivo": txtNota.text,
          "nombre1": _dropdownValue1,
          "motivo1": txtNota1.text,
          "nombre2": _dropdownValue2,
          "motivo2": txtNota2.text,
          "nombre3": _dropdownValue3,
          "motivo3": txtNota3.text,
          "motivo4": txtNota4.text,
          "motivo5": txtNota5.text,
          "subject": _dropdownValue4,
          "course": _dropdownValue5,
          "experiment_title": txtNota6.text,
          
        });
    setState(() {
      respuesta = json.decode(response.body);
    });
    print(respuesta);
    if (respuesta == true) {
      res = '';
    } else {
      res = 'error ';
    }
  }

  // // Boolean variable for CircularProgressIndicator.
  // bool visible = false ;

  // Future webCall() async{

  //   // Showing CircularProgressIndicator using State.
  //   setState(() {
  //    visible = true ;
  //   });

  //   // Getting value from Controller
  //   String name = nameController.text;
  //   String studentnumber = studentNumberController.text;
  //   String subject = subjectController.text;
  //   String yearcourse = yearController.text;

  //   // API URL
  //   var url = 'http://192.168.1.83/LAB-System/api/submit_data.php';

  //   // Store all data with Param Name.
  //   var data = {'name': name, 'student_number' : studentnumber, 'subject': subject, 'course_year': yearcourse,};

  //   // Starting Web Call with data.
  //   var response = await http.post(url, body: json.encode(data));

  //   // Getting Server response into variable.
  //   var message = jsonDecode(response.body);

  //   // If Web call Success than Hide the CircularProgressIndicator.
  //   if(response.statusCode == 200){
  //     setState(() {
  //      visible = false;
  //     });
  //   }

  // Showing Alert Dialog with Response JSON.
  // showDialog(
  //   context: context,
  //   builder: (BuildContext context) {
  //     return AlertDialog(
  //       title: new Text(message),
  //       actions: <Widget>[
  //         FlatButton(
  //           child: new Text("OK"),
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //         ),
  //       ],
  //     );
  //   },
  // );

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Borrower's Form"),
        backgroundColor: Colors.green,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            Image.asset('assets/undraw_fill_forms.png', width: 350),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       hintText: 'Enter your Name',
            //       border: OutlineInputBorder(),
            //       labelText: 'Name',
            //     ),
            //     keyboardType: TextInputType.text,
            //     controller: nameController,
            //     validator: (value) {
            //       if (value.isEmpty) {
            //         return 'Please enter your Name';
            //       }
            //       //Regex for alphabets(name)
            //       if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(value.trim())) {
            //         return 'Enter a valid Name';
            //       } else {
            //         name = value.trim();
            //       }

            //       return null;
            //     },
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       hintText: 'Enter your Student Number',
            //       border: OutlineInputBorder(),
            //       labelText: 'Student Number',
            //     ),
            //     keyboardType: TextInputType.number,
            //     controller: studentNumberController,
            //     validator: (value) {
            //       if (value.isEmpty) {
            //         return 'Please enter your Student Number';
            //       }
            //        if (!RegExp(r'^[0-9]+$').hasMatch(value.trim()) &&
            //           value.trim().length != 10) {
            //         return 'Student number should be in 10 digit';
            //       } else {
            //         student = value.trim();
            //       }

            //       return null;
            //       //Regex for email
            //       // if (!RegExp(
            //       //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            //       //     .hasMatch(value.trim())) {
            //       //   return 'Enter a valid Email';
            //       // } else {
            //       //   email = value.trim();
            //       // }

            //       // return null;
            //     },
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       hintText: 'Enter your Subject',
            //       border: OutlineInputBorder(),
            //       labelText: 'Subject',
            //     ),
            //     keyboardType: TextInputType.text,
            //     controller: subjectController,
            //     validator: (value) {
            //       if (value.isEmpty) {
            //         return 'Please enter your Subject';
            //       }
            //     //Regex for alphabets(name)
            //       if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(value.trim())) {
            //         return 'Enter a valid Subject';
            //       } else {
            //         subject = value.trim();
            //       }

            //       return null;
            //     },
            //   ),
            // ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       hintText: 'Course & Year',
            //       border: OutlineInputBorder(),
            //       labelText: 'Course & Year',
            //     ),
            // keyboardType: TextInputType.text,
            // controller: yearController,
            // validator: (value) {
            //   if (value.isEmpty) {
            //     return 'Please enter your Course & Year';
            //   }
            //   //Regex for alphabets(name)
            //   if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(value.trim())) {
            //     return 'Enter a valid Course & Year';
            //   } else {
            //     year = value.trim();
            //   }

            //   return null;
            // },
            //   ),
            // ),

            //  RaisedButton(
            //               onPressed: webCall,
            //               color: Colors.greenAccent,
            //               textColor: Colors.white,
            //               padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
            //               child: Text('Send Borrowers'),
            //             ),

            Padding(
              padding: EdgeInsets.only(top: 20, left: 100.0),
            ),
            TextFormField(
              controller: txtNota4,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Full Name';
                }
                //Regex for alphabets(name)
                if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(value.trim())) {
                  // return 'Enter a valid Course & Year';
                } else {
                  q1 = value.trim();
                }

                return null;
              },
              decoration: new InputDecoration(
                  hintText: 'Enter Fullname',
                  labelText: "Enter Fullname",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 20.0),
            ),

            TextFormField(
              controller: txtNota5,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Student Number';
                } else if (value.length <= 9) {
                  return "Number is Exact 10 Digits";
                }
                //Regex for alphabets(name)
                // if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(value.trim())) {
                //   // return 'Enter a valid Course & Year';
                // }
                else {
                  q2 = value.trim();
                }

                return null;
              },
              decoration: new InputDecoration(
                  hintText: 'Student Number',
                  labelText: "Student Number",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0))),
            ),

              Padding(
              padding: EdgeInsets.only(top: 20, left: 100.0),
            ),
            TextFormField(
              controller: txtNota6,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Experiment Title';
                }
                //Regex for alphabets(name)
                if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(value.trim())) {
                  // return 'Enter a valid Course & Year';
                } else {
                  q7 = value.trim();
                }

                return null;
              },
              decoration: new InputDecoration(
                  hintText: 'Enter Experiment Title',
                  labelText: "Enter Experiment Title",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0))),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20, left: 20.0),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 50.0,
                ),
                Expanded(
                    child: DropdownButton<String>(
                  value: _dropdownValue4,
                  onChanged: (String newValue) {
                    setState(() {
                      _dropdownValue4 = newValue;
                    });
                  },
                  items: listarClienteM1.values
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(top: 20, left: 20.0),
            ),

            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 50.0,
                ),
                Expanded(
                    child: DropdownButton<String>(
                  value: _dropdownValue5,
                  onChanged: (String newValue) {
                    setState(() {
                      _dropdownValue5 = newValue;
                    });
                  },
                  items: listarClienteM2.values
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(top: 20, left: 20.0),
            ),
           
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20.0),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 50.0,
                ),
                Expanded(
                    child: DropdownButton<String>(
                  value: _dropdownValue,
                  onChanged: (String newValue) {
                    setState(() {
                      _dropdownValue = newValue;
                    });
                  },
                  items: listarClienteM.values
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                ),
                Expanded(
                    child: TextFormField(
                  controller: txtNota,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Quantity';
                    }
                    //Regex for alphabets(name)
                    if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(value.trim())) {
                      // return 'Enter a valid Course & Year';
                    } else {
                      q3 = value.trim();
                    }

                    return null;
                  },
                  decoration: new InputDecoration(
                      hintText: 'Number of Apparatus',
                      labelText: "Quantity",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0))),
                )),
              ],
            ),

// Padding(padding: EdgeInsets.only(top: 30),),
//   new TextField(
//   controller: txtNota,
//   keyboardType: TextInputType.number,
//   decoration: new InputDecoration(
//   hintText: 'Number of Apparatus',
//     labelText: "Quantity",
//     border: new OutlineInputBorder(
//     borderRadius: new BorderRadius.circular(20.0))),
// ),

            // second dropdown
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20.0),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 50.0,
                ),
                Expanded(
                    child: DropdownButton<String>(
                  value: _dropdownValue1,
                  onChanged: (String newValue) {
                    setState(() {
                      _dropdownValue1 = newValue;
                    });
                  },
                  items: listarClienteM.values
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                ),
                Expanded(
                    child: new TextFormField(
                  controller: txtNota1,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Quantity';
                    }
                    //Regex for alphabets(name)
                    if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(value.trim())) {
                      // return 'Enter a valid Course & Year';
                    } else {
                      q4 = value.trim();
                    }

                    return null;
                  },
                  decoration: new InputDecoration(
                      hintText: 'Number of Apparatus',
                      labelText: "Quantity",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0))),
                )),
              ],
            ),
            // 3rd dropdown

            Padding(
              padding: EdgeInsets.only(top: 20, left: 20.0),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 50.0,
                ),
                Expanded(
                    child: DropdownButton<String>(
                  value: _dropdownValue2,
                  onChanged: (String newValue) {
                    setState(() {
                      _dropdownValue2 = newValue;
                    });
                  },
                  items: listarClienteM.values
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                ),
                Expanded(
                    child: new TextFormField(
                  controller: txtNota2,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Quantity';
                    }
                    //Regex for alphabets(name)
                    if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(value.trim())) {
                      // return 'Enter a valid Course & Year';
                    } else {
                      q5 = value.trim();
                    }

                    return null;
                  },
                  decoration: new InputDecoration(
                      hintText: 'Number of Apparatus',
                      labelText: "Quantity",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0))),
                )),
              ],
            ),
            // 4th dropdown
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20.0),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 50.0,
                ),
                Expanded(
                    child: DropdownButton<String>(
                  value: _dropdownValue3,
                  onChanged: (String newValue) {
                    setState(() {
                      _dropdownValue3 = newValue;
                    });
                  },
                  items: listarClienteM.values
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                ),
                Expanded(
                    child: new TextFormField(
                  controller: txtNota3,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Quantity';
                    }
                    //Regex for alphabets(name)
                    if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(value.trim())) {
                      // return 'Enter a valid Course & Year';
                    } else {
                      q6 = value.trim();
                    }

                    return null;
                  },
                  decoration: new InputDecoration(
                      hintText: 'Number of Apparatus',
                      labelText: "Quantity",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0))),
                )),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 5.0),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: new RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    // Navigator.of(context).pushNamed('/sharedloginregister');
                    //this validate() validates your whole form and return a boolean if all validates then true if not false
                    // if u wont call validate() your form wont validate.
                    
                    if (_formKey.currentState.validate()) {
                      // this executes after everything is validated
                      print('form validated');
                      callToast("Request Sent");
                      Navigator.pop(context);
                      // webCall();
                      guardarReserva();
                    } else {
                       callToast("Failed");
                      print('form not validated');
                    }
                  },
                  color: Colors.green,
                  child: Text(
                    "SEND BORROWERS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                )),
                Text(res),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
          ],
        ),
      ),
    );
  }
  callToast(String msg) {
    Fluttertoast.showToast(
        msg: "$msg",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.white,
        fontSize: 16.0);
  }
  
}
