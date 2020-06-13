import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapplist/Widgets/TaskWidget.dart';
import 'package:todoapplist/Widgets/homeWrapContainer.dart';
import 'package:todoapplist/constants.dart';
import 'package:todoapplist/screens/taskPage.dart';
import 'package:todoapplist/services/auth.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _auth = AuthService();

  FirebaseUser mCurrentUser;
  String uid;
  String userName = "";

  @override
  void initState() {
    super.initState();
    //     FirebaseUser user = .currentUser();
    // setState(() async{
    //   currentUser = await getCurrentUser();
    // });
    _getCurrentUser();
  }

  _getCurrentUser() async {
    mCurrentUser = await FirebaseAuth.instance.currentUser();
    setState(() {
      userName = mCurrentUser.displayName.toString();
      uid = mCurrentUser.uid.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(new DateFormat.EEEE().format(new DateTime.now()));

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            color: kHomeBackGroundColor,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Hello",
                              style: TextStyle(
                                color: Color(0xff453F83),
                                fontFamily: 'LatoLight',
                                fontSize: 45,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.32,
                          ),
                          FlatButton(
                            child: Text(
                              "Log Out",
                              style: TextStyle(
                                fontSize: 18,
                                color: kTitleColor,
                              ),
                            ),
                            onPressed: () {
                              _auth.signOut();
                            },
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          userName,
                          style: TextStyle(
                            color: kTitleColor,
                            fontFamily: 'Lato_Bold',
                            fontSize: 55,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Text(
                              "${new DateFormat.EEEE().format(new DateTime.now())}, ",
                              style: TextStyle(
                                color: kDateColor,
                                fontFamily: 'Lato_Bold',
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              " ${new DateFormat.MMMMd().format(new DateTime.now())}",
                              style: TextStyle(
                                color: kDateColor,
                                fontFamily: 'LatoLight',
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TasksWidget(tasks: "57", taskTextUp: "Created"),
                      TasksWidget(tasks: "35", taskTextUp: "Completed"),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Wrap(
                  children: <Widget>[
                    HomeWrapContainer(
                      leadIcon: Icons.note_add,
                      titleText: "All\nSchedule",
                      taskNum: 57,
                    ),
                    HomeWrapContainer(
                      leadIcon: Icons.person,
                      titleText: "Personal\nErrands",
                      taskNum: 7,
                    ),
                    HomeWrapContainer(
                      leadIcon: Icons.work,
                      titleText: "Work\nProjects",
                      taskNum: 13,
                    ),
                    HomeWrapContainer(
                      leadIcon: Icons.shopping_basket,
                      titleText: "Grocery\nList",
                      taskNum: 0,
                    ),
                    HomeWrapContainer(
                      leadIcon: Icons.school,
                      titleText: "School",
                      taskNum: 6,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0XFFFE4853),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskPage(),
            ),
          );
        },
      ),
    );
  }
}
