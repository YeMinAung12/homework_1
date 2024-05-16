import 'package:flutter/material.dart';

import 'package:flutter_homework_1/screen/product_screen.dart';
import 'package:flutter_homework_1/service/api_service.dart';
import 'package:flutter_homework_1/ulti/my_share.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MySharePreferance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userController.text = 'kminchelle';
    passController.text = '0lelplR';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
            child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.1)),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: width * 0.8,
          height: height * 0.35,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 150),
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.redAccent),
                ),
              ),
              TextField(
                controller: userController,
                decoration: InputDecoration(
                  hintText: 'yourmail@gmail.com',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
              TextField(
                controller: passController,
                decoration: InputDecoration(
                    hintText: 'Enter your password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black.withOpacity(0.3),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 100),
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                      color: Colors.pinkAccent, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 200,
                height: 45,
                child: ElevatedButton(
                    onPressed: () async {
                      var response =
                          await login(userController.text, passController.text);
                      if (response == null) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: Text('Your password is wrong'),
                                ));
                      } else {
                        MySharePreferance.setToken(response.token);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllProduct()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              )
            ],
          ),
        )),
        Column(
          children: [
            Text(
              'Join with',
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.red,
                        ),
                        Positioned(
                          bottom: -10,
                          right: -10,
                          top: -10,
                          left: -10,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(FontAwesomeIcons.google),
                            iconSize: 20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.red,
                        ),
                        Positioned(
                          bottom: -10,
                          right: -10,
                          top: -10,
                          left: -10,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(FontAwesomeIcons.twitter),
                            iconSize: 20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.red,
                        ),
                        Positioned(
                          bottom: -10,
                          right: -10,
                          top: -10,
                          left: -10,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(FontAwesomeIcons.instalod),
                            iconSize: 20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.red,
                        ),
                        Positioned(
                          bottom: -10,
                          right: -10,
                          top: -10,
                          left: -10,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(FontAwesomeIcons.facebookF),
                            iconSize: 20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
