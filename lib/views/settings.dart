// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontend_tfg/views/datatable.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          actions: const [SettingsInfo()],
        ),
        body: const SettingsInfo(),
        drawer: const DrawerView(),
        backgroundColor: Color.fromRGBO(203, 221, 209, 1),
      ),
    );
  }
}

class SettingsInfo extends StatelessWidget {
  const SettingsInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left column for text
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            color: Color.fromRGBO(246, 246, 233, 1),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Configuration'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text('Temperature'),
                              SizedBox(width: 24),
                              Text('30ºC'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text('Airplane'),
                              SizedBox(width: 24),
                              Text('A320'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text('Altitude'),
                              SizedBox(width: 24),
                              Text('2000'),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Save button logic
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: Size(100, 30),
                            ),
                            child: Text(
                              'Save',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ])),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        color: Color.fromRGBO(246, 246, 233, 1),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Class configuration'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text('Year'),
                          SizedBox(width: 24),
                          Text('2023 / 2024'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text('Season'),
                          SizedBox(width: 24),
                          Text('Spring'),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Create a new class button logic
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                minimumSize: Size(150, 30),
                              ),
                              child: Text(
                                'Create a new class',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            SizedBox(width: 16),
                            ElevatedButton(
                              onPressed: () {
                                // Change year button logic
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                minimumSize: Size(120, 30),
                              ),
                              child: Text(
                                'Change year',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ]),
                    ],
                  ),
                )
              ],
            ),
          ),
          // Right column for the image
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.grey[200],
                  child: Image.asset(
                    'assets/logo1', // Provide your image path here
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Text('Aida Padilla Gonzalez')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
