import 'package:flutter/material.dart';
import 'package:poem_mobile/widgets/widgets.dart';

abstract class OtherItemInputDelegate {
  onItemInputed(String value);
}

class OtherItemInputDialog extends StatelessWidget {

  final BuildContext context;
  final _checkBoxKey = GlobalKey<CustomCheckBoxState>();
  
  final OtherItemInputDelegate _delegate;
  final TextEditingController _controller = TextEditingController();
  OtherItemInputDialog(this._delegate, this.context);

  String inputItem = '';

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

  onSelectedNewItem() {
    if(inputItem == '') {
      _checkBoxKey.currentState?.setUncheck();
      return;
    }

    if(_delegate != null) {
      _delegate.onItemInputed(inputItem);
      dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
        type: MaterialType.transparency,
        child: Opacity(
          opacity: 1.0,
          child: Center(
            child: Container(
              color: Colors.white,
              width: 257, height: 172,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 29, right: 18, bottom: 22),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            dismiss();
                          },
                          child: Image.asset('assets/images/icon_cross.png', width: 33, fit: BoxFit.fitWidth),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 27, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            maxLines: 1,
                            controller: _controller,
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                            decoration: InputDecoration(
                              hintText: 'Type here',
                              hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0x33000000))
                            ),
                            onChanged: (value) {
                              inputItem = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: CustomCheckBox(
                            key: _checkBoxKey,
                            size: 30,
                            checkImage: 'assets/images/checked_payment.png',
                            uncheckImage: 'assets/images/unchecked_payment.png',
                            isChecked: false,
                            onChanged: (value) {
                              if(value) {
                                onSelectedNewItem();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}