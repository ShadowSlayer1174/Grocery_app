import 'package:flutter/material.dart';

import 'home_page.dart';
//import 'package:google_fonts/google_fonts.dart';
class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body : Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.only(left: 80.0,right: 80, bottom: 40,top: 160),
            child: Image.asset('lib/images/avocado_new.png'),
          ),

        //deliver groceries to your doorstep
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "We deliver groceries at yout doorstep",
               textAlign: TextAlign.center,
               style : TextStyle(
                 fontSize: 40,
                 fontWeight: FontWeight.bold
               )
            ),
          ),

        //fresh items everyday
          Text(
            "Fresh Items everyday",
            style: TextStyle(
                //fontStyle: FontStyle.italic,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[900]),


          ),
        const Spacer(),
        //get started button
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context){
              return const HomePage();
            })),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
    borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(24),
            child: const Text(
              "Get Started",
              style: TextStyle(color: Colors.white),


              ),

            ),
          ),
          const Spacer(),
        ]
      )
    );
  }
}