import 'dart:io';
import 'package:flutter/material.dart';
import 'package:poem_mobile/helpers/helpers.dart';
import 'package:poem_mobile/widgets/image_capture.dart';
import 'package:poem_mobile/widgets/widgets.dart';
import 'package:dotted_border/dotted_border.dart';

class IdentityScreen extends StatefulWidget {

  final VoidCallback onNext;

  const IdentityScreen({Key key, this.onNext}) : super(key: key);
  
  @override
  IdentifyWidgetState createState() {
    return IdentifyWidgetState();
  }
}

class IdentifyWidgetState extends State<IdentityScreen> with ImagePickListener {
  
  File govtIdImage;
  
  onSubmit() {
    
    if(govtIdImage ==  null) {
      showToastMessage('Take a picture of your identify card');
      return;
    }
    
    // int id;
    // id = SessionManager.getUserID();
    
    // String path = govtIdImage.path;
    // print(path);
    // String govtId = fromImageFile(govtIdImage);
    // print(govtId);
    // String prefix;
    
    // String extension = path.split('.').last;
    // if(extension == 'png') {
    //  prefix = 'data:image/png,';
    // } else if(extension == 'jpg' || extension == 'jpeg') {
    //   prefix = 'data:image/jpeg,';
    // } else {
    //   Global.showToastMessage('Only png and jpg are allowed');
    //   return;
    // }
    // govtId = prefix + govtId;
    // PoemApiClient.completeIdentify(id, govtId).then((res) {
    //   widget.onNext();
    // });
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: <Widget>[
              PoemAppBar(
                title: 'Confirm identity',
              ),
              const SizedBox(height: 35),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Please complete all fields', style: TextStyle(
                  color: Color(0xff4A4E5A), fontSize: 12
                ),
              )),
              const SizedBox(height: 5),
              Text('Scan/take a picture of Government issued ID Examples are State identity or drivers license cards, military ID\'s, valid passport, student picture ID issued by a recognized educational institution',
                  style: TextStyle(
                    fontSize: 12, height: 1.3, color: Color(0xFF4A4E5A)
                  ),),
              const SizedBox(height: 12),
              CaptureButton(file: this.govtIdImage, onPressed: () {
                ImagePickerDialog(this, context).show();
              }),
              const SizedBox(height: 12),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x11333333),
                        blurRadius: 1.5,
                        spreadRadius: 1.5
                      ),
                    ]
                ),
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(children: <Widget>[
                      SizedBox(height: 8),
                      Image.asset('assets/images/avatar.jpg', width: 45, height: 45, fit: BoxFit.fill),
                      SizedBox(height: 5),
                      Text('Take a selfie', style: TextStyle(color: Colors.black, fontSize: 12)),
                      SizedBox(height: 6),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            OptionItem(content: 'We have to confirm your identity in a brief video call using your mobile device’s (Android or iOS) capability.',),
                            SizedBox(height: 10),
                            OptionItem(content: 'Make sure you have decent internet access. We do not charge for this step. Check with your internet service provider if connection charges may apply.',),
                            SizedBox(height: 10),
                            OptionItem(content: 'When ready, click ‘Video call’ (button) and we will call you back to perform this step.'),
                            SizedBox(height: 10),
                            OptionItem(content: 'If you don’t perform this step, you will have limited access to features until your identity is confirmed when you appear in person before a participating provider'),
                            SizedBox(height: 10)
                          ]
                      )
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: CustomButton(onPressed: () {}, fontSize: 24, text: 'Video Call', bordered: true)
              ),
              SizedBox(height: 10),
              Center(
                child: TextButton(text: 'Complete Later', style: TextStyle(color: Color(0xFF4A4E5A), fontSize: 14), onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => InsuranceScreen()));
                }),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: CustomButton(onPressed: () {
                  onSubmit();
                }, text: 'Fill insurance information', fontSize: 24),
              ),
              const SizedBox(height: 20)
            ]),
          ),
        ),
      ),
    );
  }
  
  @override
  onImagePicked(File image) {
    setState(() {
      govtIdImage = image;
    });
    return null;
  }
}

class OptionItem extends StatelessWidget {
  
  final String content;
  
  const OptionItem({Key key, this.content}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 3),
          child: Image.asset('assets/images/ellipse.jpg'),
        ),
        SizedBox(width: 5),
        Expanded(
          child: Text(content, style: TextStyle(
            fontSize: 12, color: Colors.black
          )),
        )
      ]
    );
  }
}

class CaptureButton extends StatelessWidget {
  
  final VoidCallback onPressed;
  final File file;
  
  CaptureButton({Key key, this.file, this.onPressed}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        child: DottedBorder(radius: Radius.circular(10), borderType: BorderType.RRect, color: Color(0x880085fe),child: Material(
          child: InkWell(
            onTap: () {
              onPressed();
            },
            child: FractionallySizedBox(
              widthFactor: 0.7,
              child: AspectRatio(
                aspectRatio: 7/4,
                child: Container(
                  color: Color(0xffF3F7FA),
                  child: this.file == null ?  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset('assets/images/camer_capture.jpg', width: 25, fit: BoxFit.fitWidth),
                      ],
                    ),
                  ) : Row(children: <Widget>[
                    Expanded(
                      child: Image.file(file, fit: BoxFit.fill)
                    )
                  ],),
                ),
              ),
            )
          ),
        ))
    );
  }
}