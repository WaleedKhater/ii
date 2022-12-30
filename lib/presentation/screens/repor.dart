import 'dart:math';

import 'package:flutter/material.dart';

class report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('I Attend',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold ,
          fontSize: 40 ,
          
        ),
        ),
        actions: [
          IconButton(onPressed: (() {
            
          }), icon: Icon (Icons.print))
        ],
        centerTitle: true,
        backgroundColor: Color(0xFF1E4578),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            child: DataTable(columns: const [
              DataColumn(
                label: Text('ID'),
              ),
              DataColumn(
                label: Text('Name'),
              ),
              DataColumn(
                label: Text('Number'),
              ),
              DataColumn(
                label: Text('Absence'),
              ),
            ], rows: const [
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Sarah Shmaileh')),
                DataCell(Text('2037410')),
                DataCell(Text('3')),
              ]),
              DataRow(cells: [
                DataCell(Text('2')),
                DataCell(Text('Waleed Khater')),
                DataCell(Text('2036565')),
                DataCell(Text('6' , 
                style: TextStyle(
                  color: Colors.red ,
                ),)),
              ]),
              DataRow(cells: [
                DataCell(Text('3')),
                DataCell(Text('Hatem Alsharef')),
                DataCell(Text('1935904')),
                DataCell(Text('1')),
              ]),
              DataRow(cells: [
                DataCell(Text('4')),
                DataCell(Text('Hamza Hushki')),
                DataCell(Text('2036562')),
                DataCell(Text('2')),
              ]),
              DataRow(cells: [
                DataCell(Text('5')),
                DataCell(Text('Gaith Rwashdeh')),
                DataCell(Text('1935116')),
                DataCell(Text('2')),
              ])
            ])),
      ),
    );
  }
}