import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:flutter_svg/flutter_svg.dart';
import 'package:water_footprint/app/app_theme.dart';

import '../home/view/home_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(seconds: 25),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // if (_controller.value == 0.8) _controller.reverse();
    final deviceSize = MediaQuery.of(context).size;
    final deviceSizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return ClipPath(
                    clipper: DrawClip(_controller.value),
                    child: Container(
                      height: size.height * 0.5,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              kPrimaryColor,
                              Colors.blue,
                            ]),
                      ),
                    ),
                  );
                },
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 60),
                child: const Text(
                  'Water Footprint Calculator',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                'Mockup App',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          Container(
            width: size.width * 0.8,
            margin: const EdgeInsets.only(top: 18),
            child: input('Nickname'),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            child: Container(
              width: deviceSize.width * 0.4,
              height: deviceSize.height * 0.06,
              decoration: BoxDecoration(
                // // gradient: const LinearGradient(colors: [
                // //   kPrimaryColor,
                // //   kSecondaryColor,
                // ]),
                border: Border.all(color: kPrimaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                // boxShadow: [
                //   BoxShadow(
                //       color: const Color(0xFF6078ea).withOpacity(.3),
                //       offset: const Offset(0.0, 8.0),
                //       blurRadius: 8.0)
                // ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeView()));
                  },
                  child: const Center(
                    child: Text("SIGN IN",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Poppins-Bold",
                            fontSize: 18,
                            letterSpacing: 1.0)),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Made with ♥ by mihai-gabriel8',
                    style: TextStyle(color: Color(0xFFACACAC), fontSize: 14),
                  ),
                  SvgPicture.asset(
                    'assets/icons/github.svg',
                    width: 22,
                    // ignore: deprecated_member_use
                    color: Colors.black38,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/LOGO_UPB_oficial_RO.jpg',
              height: 150,
              width: 70,
            ),
          ),
        ],
      ),
    );
  }
}

Widget input(String hint, {bool isPass = false}) {
  return TextField(
    obscureText: isPass,
    decoration: const InputDecoration(
        hintText: 'nickname',
        hintStyle: TextStyle(color: Color(0xFFACACAC), fontSize: 14),
        contentPadding: EdgeInsets.only(top: 20, bottom: 20, left: 38),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFF1F1F1)),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFC7C7C7)),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        )),
  );
}

class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    double xCenter =
        size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
