import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zchat/homepage.dart';
import 'signup_screen.dart';
//import 'package:firebase_auth/firebase_auth.dart';
class LoginScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => InitState();
}
final _auth = FirebaseAuth.instance;

class InitState extends State<LoginScreen> {
  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }
  Widget initWidget()
  {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                  color: Color(0xffF5591F),
                  gradient: LinearGradient(
                    colors: [(new Color(0xf1F5591F)),(new Color(0xffF2861E))],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 70,left:10),
                      child: Image.asset("images/logo.png"),
                      height: 130,
                      width: 290,
                    ),
                    Container(
                      margin: EdgeInsets.only(right:20,top:20),
                      alignment: Alignment.bottomRight,
                      child: Text("Login",style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left:20,right: 20,top: 70,),
              padding:EdgeInsets.only(left: 20,right: 20,),
              decoration:BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(50),
                color:Colors.grey[200],
                boxShadow:[BoxShadow(
                  offset: Offset(0,10),
                  blurRadius:50,
                  color:Color(0xffEEEEE),
                )],
              ),
              alignment: Alignment.center,
              child: TextField(
                cursorColor: Color(0xffF5591F),
                onChanged: (value){
                  email=value;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.email,color:Color(0xffF5591F),),
                  hintText: "Enter your Email ID",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left:20,right: 20,top: 40,),
              padding:EdgeInsets.only(left: 20,right: 20,),
              decoration:BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(50),
                color:Colors.grey[200],
                boxShadow:[BoxShadow(
                  offset: Offset(0,10),
                  blurRadius:50,
                  color:Color(0xffEEEEE),
                )],

              ),
              alignment: Alignment.center,
              child: TextField(
                obscureText:true,
                cursorColor: Color(0xffF5591F),
                onChanged: (value){
                  password=value;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.vpn_key,color:Color(0xffF5591F),),
                  hintText: "Enter your password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30,right: 20,),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: Text("Forgot Password?"),
                onTap: () => {

                },
              ),
            ),
            GestureDetector(
              onTap: () async {
                /* write here onclick code */
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) {
                    print("Login Successfully!");
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Homepage()));
                  }
                } catch (e) {
                  print(e);
                }
                //Navigator.push(context,MaterialPageRoute(builder: (context) => Homepage()))
              },
              child: Container(
                margin: EdgeInsets.only(left:20,right:20,top:50, ),
                padding: EdgeInsets.only(left:20,right:20,),
                alignment: Alignment.center,
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [(new Color(0xf1F5591F)),(new Color(0xffF2861E))],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow:[BoxShadow(
                    offset: Offset(0,10),
                    blurRadius:50,
                    color:Color(0xffEEEEE),
                  )],
                ),
                child: Text("Login",style: TextStyle(color: Colors.white),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left:20,right:20,top:20, ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: ()=>{
                      Navigator.push(context,MaterialPageRoute(builder: (context) => SignUpScreen()))
                    },
                    child: Text("SingIn",style: TextStyle(color: Color(0xffF5591F),),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}