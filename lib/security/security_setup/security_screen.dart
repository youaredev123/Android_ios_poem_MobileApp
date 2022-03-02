import 'package:flutter/material.dart';
import 'package:poem_mobile/consolidated_agreement/agreement_screen.dart';
import 'package:poem_mobile/security/security_setup/security_item.dart';
import 'package:poem_mobile/widgets/widgets.dart';

class SecuritySetupScreen extends StatefulWidget {
  @override
  _SecuritySetupScreenState createState() => _SecuritySetupScreenState();
}

class _SecuritySetupScreenState extends State<SecuritySetupScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            PoemAppBar(title: 'Setup security questions'),
            const SizedBox(height: 42),
            Text('Answer 3 security questions', style: TextStyle(color: Color(0xFF5A585D), fontSize: 14, fontWeight: FontWeight.w500),),
            const SizedBox(height: 6),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 15),
                  SecurityItem(itemList: ['How are you', 'what is your school name'], disableOpacity: 1.0, disable: false, onQuestionSelected: (value) {
                    // question1 = value;
                    // questionID1 = findQuestionID(question: question1);
                  }, onAnswerChanged: (value) {
                    // answer1 = value;
                  }, onSubmitted: (value) {
                    // onSubmit();
                  }),
                  const SizedBox(height: 15),
                  SecurityItem(itemList: ['How are you', 'what is your school name'], disableOpacity: 1.0, disable: false, onQuestionSelected: (value) {
                    // question1 = value;
                    // questionID1 = findQuestionID(question: question1);
                  }, onAnswerChanged: (value) {
                    // answer1 = value;
                  }, onSubmitted: (value) {
                    // onSubmit();
                  }),
                  const SizedBox(height: 15),
                  SecurityItem(itemList: ['How are you', 'what is your school name'], disableOpacity: 1.0, disable: false, onQuestionSelected: (value) {
                    // question1 = value;
                    // questionID1 = findQuestionID(question: question1);
                  }, onAnswerChanged: (value) {
                    // answer1 = value;
                  }, onSubmitted: (value) {
                    // onSubmit();
                  })
                ],
              ),
            ),
            const SizedBox(height: 25),
            Text('Create your secret question', style: TextStyle(color: Color(0xFF5A585D), fontSize: 20, fontWeight: FontWeight.w600),),
            const SizedBox(height: 2),
            FractionallySizedBox(widthFactor: 0.9, child: Text('Be careful. Only you must know the answer. You will need it to retrieve or create a username. Don’t use an obvious or easy to guess answer. Enter the question and answer in the boxes.', style: TextStyle(color: Color(0xFF5A585D), fontSize: 12, fontWeight: FontWeight.w500, height: 1.8),)),
            const SizedBox(height: 8),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: PoemInputWidget(
                label: 'Create your question',
              ),
            ),
            const SizedBox(height: 8),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: PoemInputWidget(
                label: 'Create your answer',
              ),
            ),
            const SizedBox(height: 50),
            CustomButton( 
              text: 'Go to agreement',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AgreementScreen()));
              },
            ),
            const SizedBox(height: 50)
          ]),
        )),
      ),
    );
  }
}