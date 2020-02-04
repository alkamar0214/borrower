import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class DropButton extends StatefulWidget {
  @override
  _DropButtonState createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  
TextEditingController txtNota = new  TextEditingController();
 

@override
  void initState()
  {
super.initState();
listarClientes();
  }

 List listaCliente;
  Future<Null> listarClientes() async {
    var respuesta;
    final response = await http.post(
        "http://192.168.1.11/LAB-System/api/ajax/cliente.php?op=ListarCliente",
        body: {});
    setState(() {
      respuesta = json.decode(response.body);
      listaCliente = respuesta['data'];
    });
  pintarClientes();
 }
String _dropdownValue = null;
Map<String ,String>listarClienteM=Map();

void pintarClientes()
{
  for(var i=0; i<listaCliente.length;i++)
  {
   listarClienteM[listaCliente[i]['codCli']]=listaCliente[i]['nombre'];
  }
_dropdownValue=listarClienteM[listaCliente[0]['codCli']];
}
String  mostrarcodigoCliente()
{
var usdKey=listarClienteM.keys.firstWhere((K)=> listarClienteM[K]== _dropdownValue,
orElse: ()=>null
);
return usdKey;
}



///////////////////////////////////////////////////////
  String res = '';
  Future<String> guardarReserva() async {
    var respuesta;
    final response = await http.post(
         "http://192.168.1.11/LAB-System/api/ajax/cliente.php?op=guardarReserva",
        body: {
        "motivo":txtNota.text,
        "codCli":mostrarcodigoCliente(),
        });
    setState(() {
      respuesta = json.decode(response.body);
      

    });
print (respuesta);
    if (respuesta == true) {
      res = 'Guardo exitosamente';
    } else {
      res = 'error ';
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: Text('Enter Quantity Apparatus'),
  ),
  body: Center(
    child:new  Column
    (children: <Widget>[

  Padding(padding: EdgeInsets.only(top: 30),),

      new TextField(
             controller: txtNota,
              decoration: new InputDecoration(
                  hintText: 'Enter Quantity Apparatus',
                  labelText: "Input Number",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0))),
            ),

Padding(padding: EdgeInsets.only(top: 30),),
   DropdownButton<String>(
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
          })
          .toList(),
      ),

      Padding(padding: EdgeInsets.only(top: 30),),
   DropdownButton<String>(
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
          })
          .toList(),
      ),

      Padding(padding: EdgeInsets.only(top: 30),),
   DropdownButton<String>(
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
          })
          .toList(),
      ),
      Padding(padding: EdgeInsets.only(top: 30),),
   DropdownButton<String>(
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
          })
          .toList(),
      ),
      Padding(padding: EdgeInsets.only(top: 30),),
   DropdownButton<String>(
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
          })
          .toList(),
      ),
      Padding(padding: EdgeInsets.only(top: 15),),
   new OutlineButton(
                borderSide: BorderSide(
                    color: Colors.blueGrey.shade800,
                    style: BorderStyle.solid,
                    width: 3.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                child: Text(
                  'SEND BORROWERS',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                textColor: Colors.red,
                onPressed: () {
                  guardarReserva();
                
                }),
            Text(res),


      ],
)
   
   
    )
    );
  }
}