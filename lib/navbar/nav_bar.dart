import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interintel/pages/design_screen.dart';
import 'package:interintel/pages/design_screen.dart';
import 'package:interintel/pages/dictionary_screen.dart';
import 'package:interintel/pages/response_screen.dart';
import 'package:interintel/widgets/design_modal.dart';

import 'bounce_tab_bar.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  List<ValueKey<int>> _keys = [
    ValueKey<int>(0),
    ValueKey<int>(1),
    ValueKey<int>(2),
    ValueKey<int>(3)
  ];
  final _kwesi = new GlobalKey<FormState>();

  checkFields() {
    final form = _kwesi.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  String? validatePhone(String value) {
    if (value.length != 10) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  late String legalName;

  late String id;
  late String phoneNumber;
  late String email;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = 0;
              });
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: _currentIndex == 0
              ? Text(
                  'Info',
                  style: GoogleFonts.prompt(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                )
              : _currentIndex == 1
                  ? Text(
                      'Design',
                      style: GoogleFonts.prompt(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    )
                  : _currentIndex == 2
                      ? Text(
                          'Response',
                          style: GoogleFonts.prompt(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          'Dictionary',
                          style: GoogleFonts.prompt(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
          centerTitle: true,
        ),
        extendBody: true,
        body: PageTransitionSwitcher(
          duration: Duration(seconds: 1),
          transitionBuilder: (child, animation, secondaryAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: IndexedStack(
            key: ValueKey<int>(_currentIndex),
            index: _currentIndex,
            children: [
              Container(
                child: Center(
                  child: Form(
                    key: _kwesi,
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (!isKeyboard)
                            Center(
                              child: Text(
                                'We need some info from you',
                                style: GoogleFonts.prompt(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17),
                              ),
                            ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black45.withOpacity(0.5),
                                      width: 2.0),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                controller: nameController,
                                validator: (value) => value!.isEmpty
                                    ? 'Full legal name is required'
                                    : null,
                                keyboardType: TextInputType.text,
                                onChanged: (value) {
                                  this.legalName = value;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Full Legal name',
                                    hintStyle: GoogleFonts.prompt(),
                                    border: InputBorder.none),
                              )),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black45.withOpacity(0.5),
                                      width: 2.0),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                controller: numberController,
                                validator: (value) => value!.isEmpty
                                    ? 'Phone number is required'
                                    : validatePhone(value),
                                keyboardType: TextInputType.phone,
                                onChanged: (value) {
                                  this.phoneNumber = value;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Phone number',
                                    hintStyle: GoogleFonts.prompt(),
                                    border: InputBorder.none),
                              )),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black45.withOpacity(0.5),
                                      width: 2.0),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                controller: emailController,
                                validator: (value) =>
                                    value!.isEmpty ? 'Email is required' : null,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {
                                  this.email = value;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: GoogleFonts.prompt(),
                                    border: InputBorder.none),
                              )),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (checkFields()) {
                                setState(() {
                                  _currentIndex = 1;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Filled in info successfully',
                                            style: GoogleFonts.prompt(
                                                color: Colors.white))));
                              }
                            },
                            child: Container(
                                height: 70,
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF5113AA),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Center(
                                  child: Text('Continue',
                                      style: GoogleFonts.prompt(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18,
                                          color: Colors.white)),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              DesignScreen(
                  size: size,
                  nameController: nameController,
                  numberController: numberController,
                  emailController: emailController),
              ResponseScreen(),
              DictionaryScreen(),
            ],
          ),
        ),
        bottomNavigationBar: BounceTabBar(
          initialIndex: 0,
          onTabChanged: (index) {
            print(index);
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: const Color(0xFFBC53FA),
          items: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.info,
                  color: Colors.white,
                ),
                Text(
                  'Info',
                  style: GoogleFonts.prompt(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.d,
                  color: Colors.white,
                ),
                Text(
                  'Design',
                  style: GoogleFonts.prompt(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.r,
                  color: Colors.white,
                ),
                Text(
                  'Response',
                  style: GoogleFonts.prompt(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.d,
                  color: Colors.white,
                ),
                Text(
                  'Dictionary',
                  style: GoogleFonts.prompt(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
