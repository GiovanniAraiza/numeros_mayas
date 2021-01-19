import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:numeros_maya/a_arabico.dart';

import 'a_mayas.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Numeros Maya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Menu(),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                '/images/mayas.jpg',
              ),
              fit: BoxFit.cover
            )
        ),
       child: ClipRect(
          child: BackdropFilter(
           filter: ImageFilter.blur(
             sigmaX: 5,
             sigmaY: 5
           ),
           child:  Container(
              color: Colors.black.withOpacity(0.2),
              child: Center(
                child: Column(
                children: [
                  Container(height: 20,),
                  Text(
                    'Aprendiendo los Números Mayas',
                    style: GoogleFonts.codaCaption(
                      fontSize: 40,
                      color: Colors.white 
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(flex: 2,),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 15,
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width - 100,
                    child: RaisedButton(
                      hoverColor: Colors.white12,
                      textColor: Colors.white,
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                        side: BorderSide(color: Colors.red)
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ConversionAMaya()),
                        );
                      },
                      child: Text('De arabico a maya', style: GoogleFonts.montserrat(fontSize: 18),),
                    ),
                  ),
                  Container(height: 10),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 100,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                        side: BorderSide(color: Colors.red)
                      ),
                      textColor: Colors.white,
                      color: Colors.red,
                      hoverColor: Colors.white12,
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ConversionAArabico()),
                        );
                      },
                      child: Text('De maya a arabico', style: GoogleFonts.montserrat(fontSize: 18)),
                    ),
                  ),
                  Spacer(flex: 3),
                ],
              ),
              ),
            ),
         ),
       ), 
      )
    );
  }
}

/*Center(
        child: Column(
        children: [
          Text(
            'Aprendiento los Numeros Mayas',
            style: TextStyle(
              fontSize: 30
            )
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(
              bottom: 15,
            ),
            height: 50,
            width: MediaQuery.of(context).size.width - 100,
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0),
                side: BorderSide(color: Colors.red)
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConversionAMaya()),
                );
              },
              child: Text('De arabico a maya', style: TextStyle(fontSize: 18),),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 100,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0),
                side: BorderSide(color: Colors.red)
              ),

              textColor: Colors.white,
              color: Colors.red,
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConversionAArabico()),
                );
              },
              child: Text('De maya a arabico', style: TextStyle(fontSize: 18),),
            ),
          ),
          Spacer(),
        ],
      ),
      ),*/