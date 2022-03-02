import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'custom_button.dart';

abstract class ImagePickListener {
  onImagePicked(File image);
}

class ImagePickerDialog extends StatelessWidget {

  final BuildContext context;

  final ImagePickListener _listener;
  
  ImagePickerDialog(this._listener, this.context);
  
  show() {
    showDialog(
      context: context,
      builder: (context) => Container(
        child: this
      )
    );
  }

  dismiss() {
    Navigator.pop(context);
  }
  
  cropImage(File file) async {
    var _image = await ImageCropper.cropImage(sourcePath: file.path,
      maxWidth: 512,
      maxHeight: 512,
    );
    _listener.onImagePicked(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Opacity(
          opacity: 1.0,
          child: Container(
            padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
            child: Center(
              child: Container(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              dismiss();
                            },
                            child: Image.asset('assets/images/icon_close.png'),
                          ),
                        )
                      ),
                      SizedBox(height: 50),
                      CustomButton(
                        text: 'Select From Photos',
                        radius: 30,
                        bordered: true,
                        onPressed: () async {
                          dismiss();
                          var image = await ImagePicker.pickImage(source: ImageSource.gallery);
                          cropImage(image);
                        },
                      ),
                      SizedBox(height: 15),
                      CustomButton(
                        text: 'Take a Picture',
                        radius: 30,
                        onPressed: () async {
                          dismiss();
                          var image = await ImagePicker.pickImage(source: ImageSource.camera);
                          cropImage(image);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ),
        ));
  }

  Widget roundedButton(
      String buttonLabel, EdgeInsets margin, Color bgColor, Color textColor) {
    var loginBtn = Container(
      margin: margin,
      padding: EdgeInsets.all(15.0),
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(const Radius.circular(100.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF696969),
            offset: Offset(1.0, 6.0),
            blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        buttonLabel,
        style: TextStyle(
            color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
    return loginBtn;
  }
}