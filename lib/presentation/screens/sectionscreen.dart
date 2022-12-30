import 'package:flutter/material.dart';
import 'package:iattened/presentation/screens/repor.dart';

import 'abbsence.dart';

class SectionScreen extends StatelessWidget {
  var col = Color.fromARGB(255, 0, 0, 0);
  void selectSecreen(BuildContext c, int n) {
    Navigator.of(c).push(MaterialPageRoute(builder: (_) {
      if (n == 1) return report();
      return report();
    }));
  }

  @override
  Widget build(BuildContext context) {
    var btnStyle = const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Color(0xFF1E4578)),
        padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0)),
        foregroundColor:
            MaterialStatePropertyAll(Color.fromARGB(255, 255, 255, 255)),
        elevation: MaterialStatePropertyAll(10));
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'I Attend',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF1E4578),
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
          elevation: 1,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 250,
                  height: 80,
                  child: OutlinedButton(
                      style: btnStyle,
                      onPressed: () {
                        selectSecreen(context, 1);
                      },
                      child: const Text("View Report",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SizedBox(
                width: 250,
                height: 80,
                child: OutlinedButton(
                    style: btnStyle,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => abbsence(),
                          ));
                    },
                    child: const Text("Take Absence",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ))),
              ),
            ]),
          ],
        ));
  }
}
