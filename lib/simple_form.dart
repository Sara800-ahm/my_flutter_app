import 'package:flutter/material.dart';
import 'sarahcolor.dart';
import 'size.dart';

class sarahFormPage extends StatelessWidget {
  final TextEditingController field1Controller = TextEditingController();
  final TextEditingController field2Controller = TextEditingController();
  final TextEditingController field3Controller = TextEditingController();
  final TextEditingController field4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Page"),
        backgroundColor: AppColors.primaryColor,
      ),
      body:Padding(
        padding:const EdgeInsets.all(sarahAppSizes.spacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: field1Controller,
              decoration: InputDecoration(
                labelText: "",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: field2Controller,
              decoration: InputDecoration(
                labelText: "",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: field3Controller,
              decoration: InputDecoration(
                labelText: "",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: field4Controller,
              decoration: InputDecoration(
                labelText: "",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                print("Field 1: ${field1Controller.text}");
                print("Field 2: ${field2Controller.text}");
                print("Field 3: ${field3Controller.text}");
                print("Field 4: ${field4Controller.text}");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryColor,
                fixedSize: Size(sarahAppSizes.buttonWidth, sarahAppSizes.buttonHeight),
              ),
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
