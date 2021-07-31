import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:flash_chat/components/rounded_btn.dart';

class WelcomeScreen extends StatefulWidget {
  static String id='welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
} 

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation animation;
  Animation animation3;
  @override
  void initState() {
    super.initState();
    controller=AnimationController(
      duration:Duration(seconds: 2),
      vsync: this,
      
    );
    animation=CurvedAnimation(parent: controller,curve: Curves.easeIn);
     animation3 = ColorTween(begin:Colors.grey[800] , end: Colors.white).animate(controller);
    controller.forward();
    /*controller.addStatusListener((status) {
      if(status==AnimationStatus.completed)
        controller.reverse(from: 1.0);
      else if(status==AnimationStatus.dismissed) 
        controller.forward();  
    });*/
    controller.addListener(() {
      setState(() {
        
      });
      print(controller.value);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor:animation3.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                    child: Container(
                    child: Image.asset('images/logo.png'),
                    height:animation.value*100,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log In',colour: Colors.lightBlueAccent,
              onpressed:  () {
            //Go to login screen.
            Navigator.pushNamed(context,LoginScreen.id) ;
          },

            ),
            RoundedButton(
              title: 'Register',colour: Colors.blueAccent,
              onpressed:  () {
            //Go to login screen.
            Navigator.pushNamed(context,RegistrationScreen.id) ;
          },
            ),
          ],
        ),
      ),
    );
  }
}


