import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zchat/login_screen.dart';


class SignUpScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUpScreen>{

final _auth = FirebaseAuth.instance;

  String name= '';
  String email= '';
  String phone= '';
  String password= '';

  //bool isLoading = false;

  @override
  Widget build(BuildContext context) {
   
    return initWidget();

  }
  Widget initWidget(){
    return Scaffold(
      body: /*isLoading
          ? Center(child: Container(
       height:50,width:50,child:CircularProgressIndicator() ,
      ),):*/SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Container(
                height: 270,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(90)),
                    gradient: LinearGradient(
                      colors: [(new Color(0xffF5591F)),(new Color(0xffF2861E))],
                      begin:Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50,left:20),
                        child: Image.asset("images/logo.png"),
                        height: 150,
                        width: 270,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20,top: 20,),
                        alignment: Alignment.bottomRight,
                        child:Text("SignIn",style:TextStyle(
                          fontSize:30,
                          color: Colors.white,
                        ),),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left:20,right: 20,top: 50,),
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
                child: TextFormField(
                  cursorColor: Color(0xffF5591F),
                  onChanged: (val){
                    setState(()=>name=val);
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.person,color:Color(0xffF5591F),),
                    hintText: "Full Name",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left:20,right: 20,top: 20,),
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
                child: TextFormField(
                  cursorColor: Color(0xffF5591F),
                  onChanged: (val){
                    setState(()=>email=val);
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.email,color:Color(0xffF5591F),),
                    hintText: "Enter your Email ID",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),Container(
                margin: EdgeInsets.only(left:20,right: 20,top: 20,),
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
                child: TextFormField(
                  cursorColor: Color(0xffF5591F),
                  onChanged: (val){
                    setState(()=>phone=val);
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone,color:Color(0xffF5591F),),
                    hintText: "Enter your Phone Number",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),Container(
                margin: EdgeInsets.only(left:20,right: 20,top: 20,),
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
                child: TextFormField(
                  cursorColor: Color(0xffF5591F),
                  onChanged: (val){
                    setState(()=>password=val);
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key,color:Color(0xffF5591F),),
                    hintText: "Enter your password",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            GestureDetector(
                onTap: () async
                {
                  /*setState((){
                    isLoading=true;
                  });*/
                  try{
                    final newUser=await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                if (newUser != null) {
                  /*setState((){
                    isLoading=false;
                  });*/
                  print("Account Created Successfully!");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                }
                } catch (e) {
                print(e);
                }
                return null;
                },
                child: Container(
                  margin: EdgeInsets.only(left:20,right:20,top:40, ),
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
                  child: Text("SignIn",style: TextStyle(color: Colors.white),),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left:20,right:20,top:20, ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () => {
                        Navigator.pop(context)
                      },
                      child: Text("Login",style: TextStyle(color: Color(0xffF5591F),),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }

}