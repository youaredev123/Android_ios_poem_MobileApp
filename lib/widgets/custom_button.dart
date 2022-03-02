import 'package:flutter/material.dart';
import 'package:poem_mobile/widgets/widgets.dart';

enum ButtonStatus {
  Loading,
  Success,
  Failure,
  Normal
}

class CustomButton extends StatelessWidget {
  
  final ButtonStatus status;
  final VoidCallback onPressed;
  final String text;
  final double height;
  final bool isDisabled;
  final bool bordered;
  final double fontSize;
  final double radius;
  final EdgeInsets margin;
  
  CustomButton({@required this.onPressed,@required this.text, this.margin, this.status = ButtonStatus.Normal, this.radius = 5.0, this.fontSize = 22, this.isDisabled = false, this.height = 60, this.bordered = false });
  
  Widget _buildContent() {
    if(status == ButtonStatus.Normal) {
      return Text(text, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Color(0xFF0065FB)));
    } else if(status == ButtonStatus.Loading) {
      return LoadingIndicator();
    } else if(status == ButtonStatus.Failure) {
      return Icon(Icons.error, color: Colors.red, size: 40);
    } else if(status == ButtonStatus.Success) {
      return Icon(Icons.check, color: Colors.green, size: 40);
    } else {
      return Text('');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (builder, constraints) {
        return Container(
            height: height,
            child: InkWell(
              onTap: () {
                if(status == ButtonStatus.Normal) {
                  onPressed();
                }
              },
              child: Align(
                alignment: Alignment.center,
                child: _buildContent(),
              ),
            )
          );
      },
    );
  }
}