import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shape_of_view/shape_of_view.dart';

class ConversionAArabico extends StatefulWidget {
  ConversionAArabico({Key key}) : super(key: key);

  @override
  _ConversionAArabicoState createState() => _ConversionAArabicoState();
}

class _ConversionAArabicoState extends State<ConversionAArabico> {
int _numero = Random().nextInt(401);
String _texto = '';
List<String> _numeros = [
  "cero",
  "uno",
  "dos",
  "tres",
  "cuatro",
  "cinco",
  "seis",
  "siete",
  "ocho",
  "nueve",
  "diez",
  "once",
  "doce",
  "trece",
  "catorce",
  "quince",
  "dieciseis",
  "diecisiete",
  "dieciocho",
  "diecinueve",
];
TextEditingController _controllerNumero = TextEditingController();
 _comprobarNumero(){
  if(_controllerNumero.text != ""){
    if(int.parse(_controllerNumero.text) == _numero){
      _texto = 'El número es correcto';
    }
    else {
      _texto = "El número no es correcto";
    }
  }
  else {
    _texto = "El número no es correcto";
  }
  
}
String _imagenUnPiso(){
  return "assets/images/" +_numeros[_numero]+".png";
}
String _imagenDosPisos(int piso){
  int pisoDos = (_numero ~/ 20);
  int pisoUno = (_numero % 20);
  if(piso == 2) {
     return "assets/images/" +_numeros[pisoDos]+".png";
  }
  else {
     return "assets/images/" +_numeros[pisoUno]+".png";
  }
}
String _imagenTresPisos(int piso){
  int pisoTres = (_numero ~/ 400);
  int pisoDos = ( (_numero -(pisoTres * 400)) ~/ 20 );
  int pisoUno = ((_numero -(pisoTres * 400)) % 20);
  String imagen = "";
  switch (piso) {
    case 3:
        imagen = "assets/images/" +_numeros[pisoTres]+".png";
      break;
    case 2:
        imagen = "assets/images/" +_numeros[pisoDos]+".png";
      break;
    case 1:
        imagen = "assets/images/" +_numeros[pisoUno]+".png";
      break;
  }
  return imagen;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow[100].withOpacity(0.6),
        child: Column(
          children: [
            ShapeOfView(
              shape: ArcShape(
                direction: ArcDirection.Outside,
                height: 30,
                position: ArcPosition.Bottom
              ),
              child: Container(
                color: Colors.brown,
                width: MediaQuery.of(context).size.width, 
                height: 105,
                child: Row(
                  children: [
                    Container(
                        height: 100,
                        width: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 12
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 4,
                                  ),
                                  shape: BoxShape.circle
                              ),
                              child: IconButton(
                                icon: Icon(Icons.arrow_back),
                                color: Colors.white,
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                splashRadius: 25,
                              ),
                            ),
                          ],
                        )
                    ),
                    Expanded(
                      flex: 11,
                      child: Container(
                        padding: EdgeInsets.only(
                          right: 57
                        ),
                        height: 65,
                        child: Align(
                          alignment: Alignment.center,
                            child: Text(
                            ' De Maya a Arabico',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ),
            Container(height: 30,),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.7),
                    blurRadius: 30.0, 
                    spreadRadius: 8, 
                    offset: Offset(
                      1.0, 
                      1.0, 
                    ),
                  )
                ],
              ),
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.5,
                    ),
                  ),
                  constraints: BoxConstraints(
                    minHeight: 270,
                    minWidth: 150,
                    maxHeight: 300,
                    maxWidth: 170,
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                      children: [
                        if(_numero < 20)
                        Expanded(
                          child: Center(
                            child: Image.asset(
                              _imagenUnPiso(),
                              fit: BoxFit.fitWidth,
                              scale: 4,
                            ),
                          )
                        ),
                        if(_numero >= 20 && _numero < 400)
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Image.asset(
                                    _imagenDosPisos(2),
                                    fit: BoxFit.fitWidth,
                                    scale: 4,
                                  ),
                                )
                              ),
                              Expanded(
                                child: Center(
                                  child: Image.asset(
                                    _imagenDosPisos(1),
                                    fit: BoxFit.fitWidth,
                                    scale: 4,
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
                        if(_numero == 400)
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Image.asset(
                                    _imagenTresPisos(3),
                                    fit: BoxFit.fitWidth,
                                    scale: 4,
                                  ),
                                )
                              ),
                              Expanded(
                                child: Center(
                                  child: Image.asset(
                                    _imagenTresPisos(2),
                                    fit: BoxFit.fitWidth,
                                    scale: 4,
                                  ),
                                )
                              ),
                              Expanded(
                                child: Center(
                                  child: Image.asset(
                                    _imagenTresPisos(1),
                                    fit: BoxFit.fitWidth,
                                    scale: 4,
                                  ),
                                )
                              ),
                            ],
                          ),
                        )
                      ]
                  ),
                ),
              ),
            ),
            Container(height: 15,),
            Container(
              width: 280,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.brown,
                  width: 3
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  _texto,
                  style: TextStyle(
                    fontSize: 22,
                    color: (_texto == "El número es correcto") ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ),
            Container(height: 20,),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue.withOpacity(0.3),
              child: Center(
                child: TextField(
                  autofocus: true,
                  controller: _controllerNumero,
                  decoration: InputDecoration(
                     hintText: "Número",
                     counterText: "",
                     border: InputBorder.none,
                     hintStyle: TextStyle(
                       fontSize: 23,
                       height: 3.5,
                     )
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                  style: TextStyle(
                    height: 0.8,
                    fontSize: 35,
                  ),
                  maxLength: 3,
                  textAlign: TextAlign.center,
                  cursorHeight: 35,
                ),
              ),
            ),
            Container(height: 10),
            Container(
              height: 40,
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                onPressed: (){
                  setState(() {
                    _comprobarNumero();
                  });
                },
                child: Text('Comprobar Número'),
              )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _numero = Random().nextInt(401);
            _texto = "";
            _controllerNumero.text = "";
          });
        },
        tooltip: "Nuevo número",
        child: Icon(
          Icons.refresh
        ),
      ),
    );
  }
}