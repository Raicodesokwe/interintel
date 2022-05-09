import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interintel/model/todo.dart';
import 'package:interintel/services/todo_api.dart';

class ResponseScreen extends StatefulWidget {
  const ResponseScreen({Key? key}) : super(key: key);

  @override
  State<ResponseScreen> createState() => _ResponseScreenState();
}

class _ResponseScreenState extends State<ResponseScreen> {
  Future? futureTodos;
  @override
  void initState() {
    super.initState();
    futureTodos = TodoApi().fetchTodos(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: FutureBuilder(
          future: futureTodos,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  ' Something went wrong',
                  style: GoogleFonts.prompt(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: const Color(0xFF5113AA)),
                ),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Color(0xFF5113AA),
              ));
            }
            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var todoData = snapshot.data![index];
                    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.02,
                                      vertical: size.height * 0.01),
                                  child: Container(
                                    height: size.height * 0.06,
                                    width: size.width * 0.12,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Colors.purple,
                                          Colors.purpleAccent,
                                          const Color(0xFF5113AA)
                                        ]),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Center(
                                      child: Text(
                                        todoData.id.toString(),
                                        style: GoogleFonts.prompt(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                width: size.width * 0.4,
                                child: Text(todoData.title,
                                    style: GoogleFonts.prompt(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Spacer(),
                              Container(
                                height: size.height * 0.03,
                                width: size.width * 0.22,
                                child: Center(
                                  child: todoData.completed == true
                                      ? Text(
                                          'completed',
                                          style: GoogleFonts.prompt(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),
                                        )
                                      : Text(
                                          'incomplete',
                                          style: GoogleFonts.prompt(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),
                                        ),
                                ),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      const Color(0xFF5113AA),
                                      Colors.purpleAccent,
                                      Colors.purple,
                                    ]),
                                    borderRadius: BorderRadius.circular(7.0)),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              )
                            ],
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xFF5113AA),
                          ),
                        ));
                  }),
            );
          }),
    );
  }
}
