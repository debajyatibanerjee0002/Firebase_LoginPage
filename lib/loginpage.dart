import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './Animation/FadeAnimation.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String _email;
  String _password;
  FirebaseUser user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // create a container
      // this is the container which holds entire tree (main container #1)
      body: Container(
        width: double.infinity,
        // give the color of the container by using BoxDecoration widget
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.green[900],
              Colors.green[600],
              Colors.green[400],
            ],
          ),
        ),
        // create a column widget
        // this is the column which holds entire tree (main column #1)
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // give a height sized box
            SizedBox(
              height: 20,
            ),
            // give padding
            // this is the padding for "login page" and "welcome" text
            Padding(
              padding: EdgeInsets.fromLTRB(5, 40, 20, 40),
              // add a column for those "login page" and "welcome" text
              // this column holes those "login page" and "welcome" text (column #2)
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // give some animation from Animation class
                  FadeAnimation(
                    1,
                    // "login page" text
                    Text(
                      'Login Page ',
                      style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                        color: Colors.lightGreen[200],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // same
                  FadeAnimation(
                    1.2,
                    // "welcome" text
                    Text(
                      'Welcome !!',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                        color: Colors.lightGreen[200],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ^ end
            // now create expanded widget
            Expanded(
              // create a container
              // this is the container which holds entire tree (second main container #2)
              child: Container(
                // give some decoration using Boxdecoration widget
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                // create SingleChildScrollView widget to avoid **button overflow
                child: SingleChildScrollView(
                  // give some padding
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    // create a column
                    // this is the column which holds entire buttons and stuff (column #3)
                    child: Column(
                      children: <Widget>[
                        // give some height using sized box
                        SizedBox(
                          height: 30,
                        ),
                        // create a container
                        // this is the container which holds "email id" and "password" (container #3)
                        FadeAnimation(
                          1.4,
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                              color: Colors.white,
                              // craete a boxShadow property to give some shadow
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(225, 10, 150, 30),
                                  blurRadius: 20,
                                  offset: Offset(5, 8),
                                ),
                              ],
                            ),
                            // create a column
                            // this is the column which holds "email id" and "password" (column #4)
                            child: Column(
                              children: <Widget>[
                                // create a container
                                // this is container which holds "email id" (container #4)
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ),
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        _email = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Email id or phone number',
                                      hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ),
                                ),
                                // ^ end
                                // create a container
                                // this is container which holds "passwoed" (container #5)
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ),
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        _password = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    obscureText: true,
                                  ),
                                ),
                                // ^ end
                              ],
                            ),
                            // ^ end
                          ),
                          // ^ end
                        ),
                        // create a sized box to give some height space
                        SizedBox(
                          height: 30,
                        ),
                        // create a "Forgot password?" text
                        FadeAnimation(
                          1.5,
                          Text(
                            'Forgot password?',
                          ),
                        ),
                        // create a sized box to give some height space
                        SizedBox(
                          height: 30,
                        ),
                        // create a botton for "log in"
                        FadeAnimation(
                          1.6,
                          FlatButton(
                            splashColor: Colors.greenAccent,
                            highlightColor: Colors.green,
                            onPressed: () {
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: _email, password: _password)
                                  .then((user) {
                                Navigator.of(context)
                                    .pushReplacementNamed('/home');
                              }).catchError((e) {
                                print(e);
                              });
                            },
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.green[700],
                              ),
                              child: Center(
                                child: Text(
                                  'Log in',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[100],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // ^ end
                        // create a sized box to give some height space
                        SizedBox(
                          height: 30,
                        ),
                        // create a "Continue with social media" text
                        // FadeAnimation(
                        //   1.7,
                        //   Text(
                        //     'Continue with social media',
                        //   ),
                        // ),
                        // create a sized box to give some height space
                        SizedBox(
                          height: 40,
                        ),
                        // create a row for two button "Facebook" and "GitHub"
                        Row(
                          children: <Widget>[
                            // create a expanded widget for "Facebook" button
                            Expanded(
                              child: FadeAnimation(
                                1.8,
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/signup');
                                  },
                                  splashColor: Colors.blue[300],
                                  highlightColor: Colors.blue[300],
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.blue[700],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green[100]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // ^ end
                            // create a sized box to give some height space
                            SizedBox(
                              width: 20,
                            ),
                            // create a expanded widget for "GitHub" button
                            // Expanded(
                            //   child: FadeAnimation(
                            //     1.9,
                            //     FlatButton(
                            //       onPressed: () {},
                            //       splashColor: Colors.black54,
                            //       highlightColor: Colors.black54,
                            //       child: Container(
                            //         height: 50,
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(30),
                            //           color: Colors.black,
                            //         ),
                            //         child: Center(
                            //           child: Text(
                            //             'GitHub',
                            //             style: TextStyle(
                            //                 fontSize: 20,
                            //                 fontWeight: FontWeight.bold,
                            //                 color: Colors.green[100]),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // ^ end
                          ],
                        ),
                        // ^ end
                      ],
                    ),
                    // ^ end
                  ),
                  // ^ end
                ),
                // ^ end
              ),
              // ^ end
            ),
            // ^ end
          ],
        ),
        // ^ end
      ),
      // ^ end
      //
    );
  }
}
