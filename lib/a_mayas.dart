import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:google_fonts/google_fonts.dart';
class ConversionAMaya extends StatefulWidget {
  ConversionAMaya({Key key,}) : super(key: key);


  @override
  _ConversionAMayaState createState() => _ConversionAMayaState();
}

class _ConversionAMayaState extends State<ConversionAMaya> {
int _numero = Random().nextInt(401);

bool _ceroTercero = false;
bool _ceroArriba = false;
bool _ceroAbajo = false;

String _texto = "";

List<String> _unosTextoTercero = [];
List<String> _cincosTextoTercero = [];

List<String> _unosTextoArriba = [];
List<String> _cincosTextoArriba = [];

List<String> _unosTextoAbajo = [];
List<String> _cincosTextoAbajo = [];

_verificarNumeros(){
  if(_numero < 20) {
    if((_unosTextoAbajo.length) + (_cincosTextoAbajo.length * 5) == _numero){
      _texto = "El número ingresado es correcto";
    }
    else {
      _texto = "El número es incorrecto";
    }
  }
  else {
    int numeroArriba = (_unosTextoArriba.length + (_cincosTextoArriba.length * 5)) * 20;
    int numeroAbajo = _unosTextoAbajo.length + (_cincosTextoAbajo.length * 5);
    if(_numero < 400){
      int total = numeroAbajo + numeroArriba;
      if(total == _numero){
        if((total % 20) == 0)
        {
          if(_ceroAbajo){
            _texto = "El número ingresado es correcto";
          }
          else{
            _texto = "El número es incorrecto";
          }
        }
        else{
          _texto = "El número ingresado es correcto";
        }
      }
      else {
        _texto = "El número es incorrecto";
      }
    }
    else{
      int numeroTercero = (_unosTextoTercero.length + (_cincosTextoTercero.length * 5)) * 400;
      int total = numeroAbajo + numeroArriba + numeroTercero;
      if(total == _numero){
        if(_ceroAbajo && _ceroArriba){
          _texto = "El número ingresado es correcto";
        }
        else {
          _texto = "El número es incorrecto";
        }
      }
      else {
        _texto = "El número es incorrecto";
      }
    }
    
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow[100].withOpacity(0.6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ShapeOfView(
              shape: ArcShape(
                direction: ArcDirection.Outside,
                height: 30,
                position: ArcPosition.Bottom
              ),
              child: Container(
                color: Colors.brown,
                width: MediaQuery.of(context).size.width, 
                height: 100,
                child: Row(
                  children: [
                    Container(
                        height: 100,
                        width: 70,
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
                          right: 55
                        ),
                        height: 65,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            ' De Arabico a Maya',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                        ),
                        )
                      ),
                    )
                  ],
            ),
              )
            ),
            Container(height: 30,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
                shape: BoxShape.circle
              ),
              constraints: BoxConstraints(
                minHeight: 120,
                minWidth: 120
              ),
              padding: EdgeInsets.all(20),
              child: Text(
                '$_numero',
                style: TextStyle(
                  fontSize: 50
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info
                ),
                Text('Arrastra los números hacia el espacio debajo', style: GoogleFonts.roboto(fontSize: 20)),
              ],
            ),
            Container(height: 3,),
            Container(
              constraints: BoxConstraints(
                maxWidth: 270,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 20
                    ),
                    child: Draggable<String>(
                      data: "cero",
                      child: Image.asset('assets/images/cero.png', scale: 10,),
                      feedback: Image.asset('assets/images/cero.png', scale: 10,),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 20
                    ),
                    child: Draggable<String>(
                      data: "uno",
                      child:  Image.asset('assets/images/uno.png', scale: 3.5,),
                      feedback:  Image.asset('assets/images/uno.png', scale: 3.5,),
                    ),
                  ),
                  Draggable<String>(
                    data: "cinco",
                    child:  Image.asset('assets/images/cinco.png', scale: 4,),
                    feedback:  Image.asset('assets/images/cinco.png', scale: 4,),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  flex: 20,
                  child: Column(
                    children: [
                      if(_texto == "El número es incorrecto")
                      Container(
                        height: 60,
                        child: Text("$_texto", style: GoogleFonts.righteous(fontSize: 20, color: Colors.red), textAlign: TextAlign.center,),
                      ),
                      if(_texto != "El número es incorrecto")
                      Container(
                        height: 60,
                        child: Text("$_texto", style: GoogleFonts.righteous(fontSize: 20, color: Colors.green), textAlign: TextAlign.center,),
                      ),
                      Container(height: 20,),
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20
                        ),
                        width: 200,
                        height: 40,
                        child: RaisedButton(
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                          onPressed: (){
                            setState(() {
                              _verificarNumeros();
                            });
                          },
                          child: Text('Verificar Resultado', textAlign: TextAlign.center,),
                        ),
                      )
                    ],
                  ),
                ),
                if(_numero < 20)
                Container(
                  width: 220,
                  height: 300,
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
                    shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    child: DragTarget<String>(
                      builder: (context, aceptado, rechazado){
                        return Column(
                          children: [
                            Expanded(
                              child: InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        for(int x = 0; x < _unosTextoAbajo.length; x++)
                                        Image.asset('assets/images/uno.png', scale: 5,),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            for(int x = 0; x < _cincosTextoAbajo.length; x++)
                                            Image.asset('assets/images/cinco.png', scale: 3.7,),
                                          ],
                                        )
                                      ],
                                    ),
                                    if(_ceroAbajo)
                                    Image.asset('assets/images/cero.png', scale: 10,),
                                  ],
                                ),
                                mouseCursor: MouseCursor.uncontrolled,
                                onDoubleTap: (){
                                  setState(() {
                                    _unosTextoAbajo.clear();
                                    _cincosTextoAbajo.clear();
                                    _ceroAbajo = false;
                                    _texto = "";
                                  });
                                },
                                hoverColor: Colors.transparent,
                              )
                            ),
                          ],
                        );
                      },
                      onAccept: (data){
                        setState(() {
                          if(data == "cero") {
                            _ceroAbajo = true;
                            _unosTextoAbajo.clear();
                            _cincosTextoAbajo.clear();
                          }
                          if(data == "uno") {
                            if(_ceroAbajo){
                              _ceroAbajo = false;
                            }
                            if(_unosTextoAbajo.length < 4) {
                              _unosTextoAbajo.add("uno");
                            }
                          }
                          if(data == "cinco") {
                            if(_ceroAbajo){
                              _ceroAbajo = false;
                            }
                            if(_cincosTextoAbajo.length < 3) {
                              _cincosTextoAbajo.add("cinco");
                            }
                          }
                        });
                      },
                    ),
                  ),
                ),
                if(_numero >= 20 && _numero < 400)
                Container(
                  width: 220,
                  height: 300,
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
                    shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    child: Column(
                    children: [
                      //expanded de la parte de arriba
                      Expanded(
                        child: DragTarget<String>(
                          builder: (context, aceptado, rechazado){
                            return InkWell(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      for(int x = 0; x < _unosTextoArriba.length; x++)
                                      Image.asset('assets/images/uno.png', scale: 5,),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          for(int x = 0; x < _cincosTextoArriba.length; x++)
                                          Image.asset('assets/images/cinco.png', scale: 3.7,),
                                        ],
                                      )
                                    ],
                                  ),
                                  if(_ceroArriba)
                                  Image.asset('assets/images/cero.png', scale: 10,),
                                ],
                              ),
                              hoverColor: Colors.transparent,
                              mouseCursor: MouseCursor.uncontrolled,
                              onDoubleTap: (){
                                setState(() {
                                  _unosTextoArriba.clear();
                                  _cincosTextoArriba.clear();
                                  _ceroArriba = false;
                                  _texto = "";
                                });
                              },
                            );
                          },
                          onAccept: (data){
                            setState(() {
                              if(data == "cero") {
                                _ceroArriba = true;
                                _unosTextoArriba.clear();
                                _cincosTextoArriba.clear();
                              }
                              if(data == "uno") {
                                if(_ceroArriba){
                                  _ceroArriba = false;
                                }
                                if(_unosTextoArriba.length < 4) {
                                  _unosTextoArriba.add("uno");
                                }
                              }
                              if(data == "cinco") {
                                if(_ceroArriba){
                                  _ceroArriba = false;
                                }
                                if(_cincosTextoArriba.length < 3) {
                                  _cincosTextoArriba.add("uno");
                                }
                              }
                            });
                          },
                        )
                      ),
                      //expanded de la parte de abajo
                      Expanded(
                        child: DragTarget<String>(
                          builder: (context, aceptado, rechazado) {
                            return InkWell(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        for(int x = 0; x < _unosTextoAbajo.length; x++)
                                        Image.asset('assets/images/uno.png', scale: 5,),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            for(int x = 0; x < _cincosTextoAbajo.length; x++)
                                            Image.asset('assets/images/cinco.png', scale: 3.7,),
                                          ],
                                        )
                                      ],
                                    ),
                                    if(_ceroAbajo)
                                    Image.asset('assets/images/cero.png', scale: 10,),
                                ],
                              ),
                              hoverColor: Colors.transparent,
                              mouseCursor: MouseCursor.uncontrolled,
                              onDoubleTap: (){
                                setState(() {
                                  _unosTextoAbajo.clear();
                                  _cincosTextoAbajo.clear();
                                  _ceroAbajo = false;
                                  _texto = "";
                                });
                              },
                            );
                          },
                          onAccept: (data){
                            setState(() {
                              if(data == "cero") {
                                _ceroAbajo = true;
                                _unosTextoAbajo.clear();
                                _cincosTextoAbajo.clear();
                              }
                              if(data == "uno") {
                                if(_ceroAbajo){
                                  _ceroAbajo = false;
                                }
                                if(_unosTextoAbajo.length < 4) {
                                  _unosTextoAbajo.add("uno");
                                }
                              }
                              if(data == "cinco") {
                                if(_ceroAbajo){
                                  _ceroAbajo = false;
                                }
                                if(_cincosTextoAbajo.length < 3) {
                                  _cincosTextoAbajo.add("cinco");
                                }
                              }
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  ),
                ),
                if(_numero == 400)
                Container(
                  width: 220,
                  height: 300,
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
                    shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    child: Column(
                      children: [
                        //De la tercera parte, lo mas arriba
                        Expanded(
                          child: DragTarget<String>(
                            builder: (context, aceptado, rechazado){
                              return InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        for(int x = 0; x < _unosTextoTercero.length; x++)
                                        Image.asset('assets/images/uno.png', scale: 6,),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            for(int x = 0; x < _cincosTextoTercero.length; x++)
                                            Image.asset('assets/images/cinco.png', scale: 4.7,),
                                          ],
                                        )
                                      ],
                                    ),
                                    if(_ceroTercero)
                                    Image.asset('assets/images/cero.png', scale: 10,),
                                  ],
                                ),
                                hoverColor: Colors.transparent,
                                mouseCursor: MouseCursor.uncontrolled,
                                onDoubleTap: (){
                                  setState(() {
                                    _unosTextoTercero.clear();
                                    _cincosTextoTercero.clear();
                                    _ceroTercero = false;
                                    _texto = "";
                                  });
                                },
                              );
                            },
                            onAccept: (data){
                              setState(() {
                                if(data == "cero") {
                                  _ceroTercero = true;
                                  _unosTextoTercero.clear();
                                  _cincosTextoTercero.clear();
                                }
                                if(data == "uno") {
                                  if(_ceroTercero){
                                    _ceroTercero = false;
                                  }
                                  if(_unosTextoTercero.length < 4) {
                                    _unosTextoTercero.add("uno");
                                  }
                                }
                                if(data == "cinco") {
                                  if(_ceroTercero){
                                    _ceroTercero = false;
                                  }
                                  if(_cincosTextoTercero.length < 3) {
                                    _cincosTextoTercero.add("uno");
                                  }
                                }
                              });
                            },
                          )
                        ),
                        //expanded de la parte de arriba
                        Expanded(
                          child: DragTarget<String>(
                            builder: (context, aceptado, rechazado){
                              return InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        for(int x = 0; x < _unosTextoArriba.length; x++)
                                        Image.asset('assets/images/uno.png', scale: 6,),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            for(int x = 0; x < _cincosTextoArriba.length; x++)
                                            Image.asset('assets/images/cinco.png', scale: 4.7,),
                                          ],
                                        )
                                      ],
                                    ),
                                    if(_ceroArriba)
                                    Image.asset('assets/images/cero.png', scale: 10,),
                                  ],
                                ),
                                hoverColor: Colors.transparent,
                                mouseCursor: MouseCursor.uncontrolled,
                                onDoubleTap: (){
                                  setState(() {
                                    _unosTextoArriba.clear();
                                    _cincosTextoArriba.clear();
                                    _ceroArriba = false;
                                    _texto = "";
                                  });
                                },
                              );
                            },
                            onAccept: (data){
                              setState(() {
                                if(data == "cero") {
                                  _ceroArriba = true;
                                  _unosTextoArriba.clear();
                                  _cincosTextoArriba.clear();
                                }
                                if(data == "uno") {
                                  if(_ceroArriba){
                                    _ceroArriba = false;
                                  }
                                  if(_unosTextoArriba.length < 4) {
                                    _unosTextoArriba.add("uno");
                                  }
                                }
                                if(data == "cinco") {
                                  if(_ceroArriba){
                                    _ceroArriba = false;
                                  }
                                  if(_cincosTextoArriba.length < 3) {
                                    _cincosTextoArriba.add("uno");
                                  }
                                }
                              });
                            },
                          )
                        ),
                        //expanded de la parte de abajo
                        Expanded(
                          child: DragTarget<String>(
                            builder: (context, aceptado, rechazado) {
                              return InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          for(int x = 0; x < _unosTextoAbajo.length; x++)
                                          Image.asset('assets/images/uno.png', scale: 6,),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              for(int x = 0; x < _cincosTextoAbajo.length; x++)
                                              Image.asset('assets/images/cinco.png', scale: 4.7,),
                                            ],
                                          )
                                        ],
                                      ),
                                      if(_ceroAbajo)
                                      Image.asset('assets/images/cero.png', scale: 10,),
                                  ],
                                ),
                                hoverColor: Colors.transparent,
                                mouseCursor: MouseCursor.uncontrolled,
                                onDoubleTap: (){
                                  setState(() {
                                    _unosTextoAbajo.clear();
                                    _cincosTextoAbajo.clear();
                                    _ceroAbajo = false;
                                    _texto = "";
                                  });
                                },
                              );
                            },
                            onAccept: (data){
                              setState(() {
                                if(data == "cero") {
                                  _ceroAbajo = true;
                                  _unosTextoAbajo.clear();
                                  _cincosTextoAbajo.clear();
                                }
                                if(data == "uno") {
                                  if(_ceroAbajo){
                                    _ceroAbajo = false;
                                  }
                                  if(_unosTextoAbajo.length < 4) {
                                    _unosTextoAbajo.add("uno");
                                  }
                                }
                                if(data == "cinco") {
                                  if(_ceroAbajo){
                                    _ceroAbajo = false;
                                  }
                                  if(_cincosTextoAbajo.length < 3) {
                                    _cincosTextoAbajo.add("cinco");
                                  }
                                }
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(flex: 8),
              ],
            ),
            Container(height: 8,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _texto = "";
            _ceroTercero = false;
            _ceroArriba = false;
            _ceroAbajo = false;
            _unosTextoTercero.clear();
            _unosTextoArriba.clear();
            _unosTextoAbajo.clear();
            _cincosTextoTercero.clear();
            _cincosTextoArriba.clear();
            _cincosTextoAbajo.clear();
            _numero = Random().nextInt(401);
          });
        },
        tooltip: 'Nuevo número',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
