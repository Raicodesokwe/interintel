import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class FunkyOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<FunkyOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/success.png'),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text('Details seen!!',
                      style: GoogleFonts.prompt(
                        color: const Color(0xFF5113AA),
                      )),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      child: Center(
                        child: Text('Okay,great!!!',
                            style: GoogleFonts.prompt(
                              color: Colors.white,
                            )),
                      ),
                      height: 50,
                      width: size.width * 0.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFF5113AA)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}