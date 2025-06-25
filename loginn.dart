import 'dart:ui';

import 'package:flutter/material.dart';

import 'app list.dart';

class loga extends StatefulWidget {
  const loga({super.key});

  @override
  State<loga> createState() => _logaState();
}

class _logaState extends State<loga> {
  @override

  final _key6 = GlobalKey<FormState>();

  bool _show5 = false;

  TextEditingController ctrll = TextEditingController();
  TextEditingController ctrll1 = TextEditingController();
  l(){
    setState(() {
      if(ctrll.text.isNotEmpty && ctrll1.text.isNotEmpty ? _show5 = true : _show5 = false);
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _key6,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/duke.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/dp.jpg"),
                  fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: ctrll,
                            onChanged: (i){
                              setState(() {
                                l();
                              });
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Enter Your Email",
                              border: OutlineInputBorder(),
                            ),
                            validator: (input){
                              if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(input!)){
                                return "Enter Valid Email";

                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: ctrll1,
                            onChanged: (i){
                              l();
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              hintText: "Enter Your Password",
                              border: OutlineInputBorder(),
                            ),
                            validator: (input){
                              if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(input!)){
                                return "Enter Valid Password";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 40,),
                       Visibility(
                           visible: _show5,
                         child: ElevatedButton(
                             onPressed: () {
                               if(_key6.currentState!.validate()){
                                 Navigator.push(
                                     context,
                                     MaterialPageRoute(builder: (context)=> const apl()));

                               }

                             }, child: Text("Sign In")),



                       )
                      ],
                    ),


                  ),
                ),
              )
            ],
          ),
        ),
      ),



      ),
    );
  }
}
