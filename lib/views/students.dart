import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend_tfg/views/datatable.dart';
import 'package:frontend_tfg/widgets/navigation_bar_view.dart';

class StudentsView extends StatelessWidget {
  const StudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DataTable Sample'),
          actions: const [NavigationBarView()],
        ),
        body: const StudentScrollView(),
        drawer: const DrawerView(),
      ),
    );
  }
}

class StudentScrollView extends StatelessWidget {
  const StudentScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // Adjust the spacing as needed
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  studentCard(),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16), // Adjust the space between the widgets
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  studentCard(),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16), // Adjust the space between the widgets
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  studentCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class StudentScrollView extends StatelessWidget {
//   const StudentScrollView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 1080,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 studentCard(),
//               ],
//             ),
//           ),
//           SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 studentCard(),
//               ],
//             ),
//           ),
//           SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 studentCard(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

Column studentCard() {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.grey[200],
        child: Image.asset(
          'assets/logo1', // Provide your image path here
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      const Text('Aida Padilla Gonzalez')
    ],
  );
}
