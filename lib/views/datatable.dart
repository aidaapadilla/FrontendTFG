// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend_tfg/widgets/navigation_bar_view.dart';
import 'package:google_fonts/google_fonts.dart';

/// Flutter code sample for [DataTable].

void main() => runApp(const DataTableExampleApp());

class DataTableExampleApp extends StatelessWidget {
  const DataTableExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DataTable Sample'),
          actions: const [NavigationBarView()],
        ),
        body: const DataTableExample(),
        drawer: DrawerView(),
      ),
    );
  }
}

class DataTableExample extends StatelessWidget {
  const DataTableExample({super.key});
  @override
  Widget build(BuildContext context) {
    String title1 = 'Name';
    String title2 = 'Stage';
    String title3 = 'Points';
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(64),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[tableRowItem(title1, title2, title3)],
    );
  }

  TableRow tableRowItem(String text1, String text2, String text3) {
    return TableRow(children: <Widget>[
      Container(
        height: 32,
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.top,
        child: SizedBox(
          height: 32,
          width: 32,
          child: Center(
              child: Text(
            text1,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
            ),
          )),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.top,
        child: SizedBox(
          height: 32,
          width: 32,
          child: Center(
              child: Text(
            text2,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
            ),
          )),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.top,
        child: SizedBox(
          height: 32,
          width: 32,
          child: Center(
              child: Text(
            text3,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
            ),
          )),
        ),
      ),
    ]);
  }
}

TableRow tableRows() {
  return TableRow(children: const <Widget>[
    SizedBox(
        height: 32,
        child: Center(
          child: Text(
            'Name',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
            ),
          ),
        ))
  ]);
}

class ItemRow {
  final String text;
  ItemRow(this.text);
}

final listItemRow = ['Aida Padilla', 'Building', '10'];

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      backgroundColor: Color.fromRGBO(39, 39, 39, 1),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          // const DrawerHeader(
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //   ),
          //   child: Text('Drawer Header'),
          // ),
          ListTile(
            title: const Text('All courses'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Class 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Class 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
