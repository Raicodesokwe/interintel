import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interintel/widgets/design_modal.dart';

class DesignScreen extends StatelessWidget {
  const DesignScreen({
    Key? key,
    required this.size,
    required this.nameController,
    required this.numberController,
    required this.emailController,
  }) : super(key: key);

  final Size size;
  final TextEditingController nameController;
  final TextEditingController numberController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF5113AA),
                  border: Border.all(
                      width: 4,
                      color: Colors.black.withOpacity(0.2))),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle),
                          child: Center(
                              child: Icon(
                            Icons.person,
                            color: const Color(0xFF5113AA),
                            size: 50,
                          ))),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      'Name',
                      style: GoogleFonts.prompt(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    Text(
                      nameController.text,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.prompt(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      'Phone number',
                      style: GoogleFonts.prompt(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    Text(
                      numberController.text,
                      style: GoogleFonts.prompt(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      'Email',
                      style: GoogleFonts.prompt(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    Text(
                      emailController.text,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.prompt(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            GestureDetector(
              onTap: () {
               FocusScope.of(context).unfocus();
                showDialog(
                  context: context,
                  builder: (_) => FunkyOverlay(),
                );
              },
              child: Container(
                height: 50,
                width: size.width * 0.7,
                decoration: BoxDecoration(
                    color: const Color(0xFF5113AA),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                  'Click here',
                  style: GoogleFonts.prompt(
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
