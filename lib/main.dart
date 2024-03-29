import 'package:flutter/material.dart';

import 'views/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

// class LoginDemo extends StatefulWidget {
//   const LoginDemo({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _LoginDemoState createState() => _LoginDemoState();
// }

// class _LoginDemoState extends State<LoginDemo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("Login Page"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(top: 60.0),
//               child: Center(
//                 child: Container(
//                     width: 200,
//                     height: 150,
//                     /*decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(50.0)),*/
//                     child: Image.asset('asset/images/flutter-logo.png')),
//               ),
//             ),
//             const Padding(
//               //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'UPC email',
//                     hintText: 'name.surname@estudiantat.upc.edu'),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(
//                   left: 15.0, right: 15.0, top: 15, bottom: 0),
//               //padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextField(

//                 obscureText: true,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Password',
//                     hintText: 'Enter secure password'),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(
//                   left: 15.0, right: 15.0, top: 15, bottom: 0),
//             ),
//             Container(
//               height: 50,
//               width: 250,
//               decoration: BoxDecoration(
//                   color: Colors.blue, borderRadius: BorderRadius.circular(20)),
//               child: TextButton (
//                 onPressed: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (_) => Login()));
//                 },
//                 child: const Text(
//                   'SIGN UP',
//                   style: TextStyle(color: Colors.white, fontSize: 25),
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(
//                   left: 15.0, right: 15.0, top: 15, bottom: 0),
//             ),
//             Container(
//               height: 50,
//               width: 250,
//               decoration: BoxDecoration(
//                   color: Colors.blue, borderRadius: BorderRadius.circular(20)),
//               child: TextButton (
//                 onPressed: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (_) => Login()));
//                 },
//                 child: Text(
//                   'LOG IN',
//                   style: TextStyle(color: Colors.white, fontSize: 25),
//                 ),
//               ),
//             ),
//             TextButton (
//               onPressed: (){
//                 //TODO FORGOT PASSWORD SCREEN GOES HERE
//               },
//               child: Text(
//                 'Forgot Password',
//                 style: TextStyle(color: Colors.blue, fontSize: 15),
//               ),
//             ),
            
//             SizedBox(
//               height: 130,
//             ),
//             Text('New User? Create Account')
//           ],
//         ),
//       ),
//     );
//   }
// }