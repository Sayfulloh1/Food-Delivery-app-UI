import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:untitled/pages/HomePage.dart';

import '../animations/FadeAnimation.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({Key? key}) : super(key: key);

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> animation;
  bool textVisible = true;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 100,
      ),
    );
    animation = Tween<double>(
      begin: 1.0,
      end: 25.0,
    ).animate(animationController);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void onTap() {
    setState(() {
      textVisible = false;
    });
    animationController.forward().then(
          (value) => Navigator.push(
              context,
              PageTransition(
                child: const HomePage(),
                type: PageTransitionType.fade,
              )),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/starter.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.2),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAnimation(
                  delay: .5,
                  child: Text(
                    "Taking Order for Faster Delivery",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                FadeAnimation(
                  delay: 1,
                  child: Text(
                    "See restaurants nearby by\nadding location",
                    style: TextStyle(
                      height: 1.4,
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                FadeAnimation(
                  delay: 1.2,
                  child: ScaleTransition(
                    scale: animation,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Colors.yellow,
                            Colors.orange,
                          ],
                        ),
                      ),
                      child: AnimatedOpacity(
                        opacity: textVisible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 50),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          child: Text(
                            "Start",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () => onTap(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                AnimatedOpacity(
                  opacity: textVisible?1.0:0.0,
                  duration: Duration(milliseconds: 50),
                  child: Align(
                    child: Text(
                      "Now deliver to your door 7/24",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
