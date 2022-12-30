import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iattened/presentation/screens/sectionscreen.dart';

import '../../router/app_router.gr.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [],
      )),
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
        backgroundColor: const Color(0xFF1E4578),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 1,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          // onPressed: () {
          //   if (isbottomsheetopened) {
          //     if (formKey.currentState!.validate()) {
          //       {
          //         Navigator.pop(context);
          //         isbottomsheetopened = false;
          //       }
          //       ;
          //     }
          //   } else {
          //     Scaffoldkey.currentState!.showBottomSheet((context) => Padding(
          //           padding: const EdgeInsets.all(20.0),
          //           child: Form(
          //             key: formKey,
          //             child: Column(
          //               mainAxisSize: MainAxisSize.min,
          //               children: [
          //                 TextFormField(
          //                   controller: numbercontrol,
          //                   validator: (value) {
          //                     if (value!.isEmpty) {
          //                       return 'Enter The Section Name';
          //                     }
          //                     return null;
          //                   },
          //                   decoration: const InputDecoration(
          //                     labelText: 'Section Name',
          //                     border: OutlineInputBorder(),
          //                   ),
          //                 ),
          //                 const SizedBox(
          //                   height: 20,
          //                 ),
          //                 TextFormField(
          //                   controller: sectioncontrol,
          //                   validator: (value) {
          //                     if (value!.isEmpty) {
          //                       return 'Enter The Section Number';
          //                     }
          //                     return null;
          //                   },
          //                   decoration: const InputDecoration(
          //                     labelText: 'Section Number',
          //                     border: OutlineInputBorder(),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ));
          //     isbottomsheetopened = true;
          //   }
          // },
          child: const Icon(Icons.add)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 120,
                  width: 200,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SectionScreen(),
                          ));
                    },
                    color: const Color(0xFF1E4578),
                    child: const Text(
                      'Java \n Section: 1',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
