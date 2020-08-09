import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashBoard'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              colors: [
                Colors.green[800],
                Colors.green[700],
                Colors.green[600],
                Colors.green[500],
                Colors.green[400],
                Colors.green[300],
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Now you are logged in',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: RaisedButton(
                  child: Center(
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance
                        .signOut()
                        .then((value) => {
                              Navigator.of(context)
                                  .pushReplacementNamed('/landingpage')
                            })
                        .catchError((e) {
                      print(e);
                    });
                  },
                  color: Colors.lightGreen,
                  elevation: 5,
                  highlightColor: Colors.green[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
