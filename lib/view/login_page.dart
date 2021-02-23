import 'package:flutter/material.dart';
import 'package:flutter_app/utils/resize.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Are your sure?'),
          content: new Text('Do you want init session?'),
          actions: <Widget>[
            new FlatButton(
                onPressed: (){
                  Navigator.of(context).pushReplacementNamed('/articles', arguments: 'Rafo');
                },
                child: new Text('Yes')
            ),
            new FlatButton(onPressed: (){
              Navigator.pushNamed(context, '/second', arguments: 'Hello World!');
            }, child: new Text('No')
            ),
            new FlatButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: new Text('Cancel')
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration (
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: AssetImage('assets/img/backbit.png'),
                    colorFilter: ColorFilter.mode(Colors.white, BlendMode.softLight)
                  )
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: resizeH(mediaQ: _height, size: 40),
                left: 25,
                right: 25
              ),
              height: MediaQuery.of(context).size.height*5/8,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(80, 110), bottomRight: Radius.elliptical(80, 110))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome To",
                    style: GoogleFonts.signika(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                  Image.asset('assets/img/BitLogo.png',
                  width: resizeH(mediaQ: _height, size: 157),
                  height: resizeH(mediaQ: _height, size: 63),
                  fit: BoxFit.contain,),
                  Text("Please login to continue",
                    style: GoogleFonts.signika(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                  Container(
                      padding: EdgeInsets.only(
                          top: 50
                      )
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: 'User Name'
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          top: 20
                      )
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blueAccent,
                      hintText: "Filled Color text...",
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          top: 10
                      )
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Filled Color text...",
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          top: 10
                      )
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'User Name',
                    ),
                  ),
                  TextButton(
                    child: Text('Go!'),
                    onPressed: () {
                      _showDialog();
                  }),
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}

