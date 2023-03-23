import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:expense_tracker/pages/homepage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    navigatetohome();
  }

  navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), (() {}));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
      return HomePage();
    })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Lottie.asset(
                  'assets/splash.json',
                  fit: BoxFit.cover,
                ),
                ShaderMask(
                  shaderCallback: (bounds) =>
                      const LinearGradient(colors: [Colors.red, Colors.yellow])
                          .createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
                  child: Text(
                    "YELLA",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Spacer(),
            ShaderMask(
              shaderCallback: (bounds) =>
                  const LinearGradient(colors: [Colors.red, Colors.blue])
                      .createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              ),
              child: Text(
                "Made By Phenomes",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
