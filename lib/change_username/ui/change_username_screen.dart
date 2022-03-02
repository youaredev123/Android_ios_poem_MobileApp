import 'package:flutter/material.dart';
import 'package:poem_mobile/widgets/widgets.dart';

class ChangeUserNameScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: PoemAppBar(
                title: 'Change username',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('Answer your security questions', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF5A585D)),),
                  ),
                  const SizedBox(height: 10),
                  PoemInputWidget(
                    label: 'What is your school name?',
                  ),
                  const SizedBox(height: 10),
                  PoemInputWidget(
                    label: 'What is your school name?',
                  ),
                  const SizedBox(height: 10),
                  PoemInputWidget(
                    label: 'What is your school name?',
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('Answer your secret question', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF5A585D)),),
                  ),
                  const SizedBox(height: 10),
                  PoemInputWidget(
                    label: 'What is your school name?',
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Text('Continue', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF0065FB)),),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 70),
              child: PoemInputWidget(
                label: 'Unique username only used here*',
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(text: 'Update username', onPressed: () {
               
            })
          ]),
        ),
      ),
    );
  }
}