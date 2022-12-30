import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class abbsence extends StatefulWidget {
  const abbsence({super.key});

  @override
  State<abbsence> createState() => _abbsenceState();
}

class _abbsenceState extends State<abbsence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E4578),
        title: const Text(
          'I Attend',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: (() {}), icon: const Icon(Icons.save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: (() {}),
                color: Colors.blue,
                child: const Text(
                  'Waleed Khater',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: (() {}),
                color: Colors.blue,
                child: const Text(
                  'Hatem Alsharif',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: (() {}),
                color: Colors.blue,
                child: const Text(
                  'Hamzeh Hushki',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: (() {}),
                color: Colors.blue,
                child: const Text(
                  'Sarah Shamaileh',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: (() {}),
                color: Colors.blue,
                child: const Text(
                  'Gaith Rawashda',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
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
    );
  }
}
