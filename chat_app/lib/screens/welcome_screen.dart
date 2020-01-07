import 'package:chat_app/components/primary_welcome_button.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

/// SingleTickerProvider- ticker for animating a single obj & Mixing for multiple animating
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(

        /// add upperBound: 100 and print it in text for 0-100 loading imitate
        /// controller.value.toInt()
        duration: Duration(seconds: 1),
        vsync: this);

    animation =
        ColorTween(begin: Colors.pink, end: Colors.green).animate(controller);
//    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.forward();
//    controller.reverse(from: 1);

    controller.addListener(() {
      setState(() {
        /// Don't need anything since value is already changing (controller.value),
        /// just adding this allows it to update in screen try: Colors.green.withOpacity(controller.value)
        /// for background
      });
//      print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
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
                    height: 60,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  speed: Duration(seconds: 1),
                  text: ['Flash Chat'],
                  isRepeatingAnimation: false,
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: PrimaryWelcomeButton(
                    text: 'Login',
                    backGroundColour: Colors.lightBlue,
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    })),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: PrimaryWelcomeButton(
                backGroundColour: Colors.blueAccent,
                text: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
