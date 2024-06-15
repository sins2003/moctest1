import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:moctest1/screens/home.dart';
import 'package:moctest1/screens/signup.dart';

import '../database/firebaseauth.dart';

class loginpage extends StatefulWidget {
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  var lemail=TextEditingController();
  var lpass=TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Center(
                  child: Image(
                    image: AssetImage("assets/images/shopingbag.png"),
                    height: 80,
                    width: 80,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Text(
                    "Login to Acive eCommerce",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.red),
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
                    validator: (email) {
                      if (email!.isEmpty ||
                          !email.contains(".") ||
                          !email.contains("@")) {
                        return "Please enter valid email";
                      } else {
                        return null;
                      }
                    },
                    controller: lemail,
                    decoration: InputDecoration(
                      hintText: "Enter email Address",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 300),
                  child: TextButton(onPressed: () {}, child: Text("Forgot password")),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Password",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20),
                  child: TextFormField(
                    obscuringCharacter: "*",
                    obscureText: true,
                    validator: (password) {
                      if (password!.isEmpty ||
                          password.length < 6) {
                        return "Please enter valid password";
                      } else {
                        return null;
                      }
                    },
                    controller: lpass,
                    decoration: InputDecoration(
                      hintText: "* * * * * * *",
                      hintStyle: TextStyle(
                        color: Colors.grey
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),

                SizedBox(height : 20),
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
                                .signin(
                                mail: lemail.text!,
                                password: lpass.text!)
                                .then((value) {
                              if (value == null) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => homepage(),
                                    ));
                              } else {
                                Get.snackbar("error", value);
                              }
                            });
                          }
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
                SizedBox(height: 20,),
                Center(child: Text("Dont have an account?? create account",style: TextStyle(color: Colors.grey),)),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => signuppage(),));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
                SizedBox(height: 20,),
                Center(child: Text("Login with",style: TextStyle(color: Colors.grey),)),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/google.png",height: 35,width: 35,),
                    SizedBox(width: 20,),
                    Image.asset("assets/images/facebook.png",height: 35,width: 35,),
                    SizedBox(width: 20,),
                    Image.asset("assets/images/twitter.png",height: 35,width: 35,),


                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
