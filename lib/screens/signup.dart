import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../database/firebaseauth.dart';
import 'login.dart';

class signuppage extends StatefulWidget {
  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  var formkey = GlobalKey<FormState>();
  bool showpass = true;
  bool showconpass = true;
  var semail = TextEditingController();
  var spass = TextEditingController();
  var sconpass = TextEditingController();
  var sname=TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Image(
                    image: AssetImage("assets/images/shopingbag.png"),
                    height: 80,
                    width: 80,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Join to Active eCommerce",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: Colors.red),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Name",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: TextFormField(
                    controller: sname,
                    validator: (name) {
                      if(name!.isEmpty){
                        return "Please enter valid name";
                      }else{}
                    },
                    decoration: InputDecoration(
                      hintText: "Enter name",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Email",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: TextFormField(
                    controller: semail,
                    validator: (email) {
                      if (email!.isEmpty ||
                          !email.contains(".") ||
                          !email.contains("@")) {
                        return "Please enter valid email";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Enter email Address",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Password",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: TextFormField(
                    obscuringCharacter: "*",
                    obscureText: true,
                    controller: spass,
                    validator: (password) {
                      if (password!.isEmpty || password.length < 6) {
                        return "please enter valid password";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "* * * * * * *",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Retype Password",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: TextFormField(
                    controller: sconpass,
                    obscuringCharacter: "*",
                    obscureText: true,
                    validator: (conpass) {
                      if (conpass == spass.text) {
                        if (conpass!.isEmpty || conpass.length < 6) {
                          return "please enter valid password";
                        } else {
                          return null;
                        }
                      } else {
                        return "Password not match";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "* * * * * * *",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                        ),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            firebaseHelper()
                                .SignUp(
                                    mail: semail.text!, password: spass.text!)
                                .then((value) {
                              if (value == null) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => loginpage(),
                                    ));
                              } else {
                                Get.snackbar("Error", value);
                              }
                            });
                          } else {}
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(child: Text("Already have an account?? Login",style: TextStyle(color: Colors.grey),)),
                SizedBox(height: 20,),

                Center(
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => loginpage(),
                              ));
                        },
                        child: Text(
                          "Log in",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
