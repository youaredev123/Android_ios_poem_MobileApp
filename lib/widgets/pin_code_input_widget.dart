library pin_code_text_field;

import 'dart:async';

import 'package:flutter/cupertino.dart' show CupertinoTextField;
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/services.dart';

typedef OnDone = void Function(String text);
typedef PinBoxDecoration = BoxDecoration Function(Color borderColor);

/// class to provide some standard PinBoxDecoration such as standard box or underlined
class ProvidedPinBoxDecoration {
  /// Default BoxDecoration
  static PinBoxDecoration defaultPinBoxDecoration = (Color borderColor) {
    return BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.all(const Radius.circular(5.0)));
  };

  /// Underlined BoxDecoration
  static PinBoxDecoration underlinedPinBoxDecoration = (Color borderColor) {
    return BoxDecoration(
        border: Border(bottom: BorderSide(color: borderColor, width: 2.0)));
  };
}

class ProvidedPinBoxTextAnimation {
  /// A combination of RotationTransition, DefaultTextStyleTransition, ScaleTransition
  static AnimatedSwitcherTransitionBuilder awesomeTransition =
      (Widget child, Animation<double> animation) {
    return RotationTransition(
        child: DefaultTextStyleTransition(
          style: TextStyleTween(
              begin: TextStyle(color: Colors.pink),
              end: TextStyle(color: Colors.blue))
              .animate(animation),
          child: ScaleTransition(
            child: child,
            scale: animation,
          ),
        ),
        turns: animation);
  };

  /// Simple Scaling Transition
  static AnimatedSwitcherTransitionBuilder scalingTransition =
      (child, animation) {
    return ScaleTransition(
      child: child,
      scale: animation,
    );
  };

  /// No transition
  static AnimatedSwitcherTransitionBuilder defaultNoTransition =
      (Widget child, Animation<double> animation) {
    return child;
  };

  /// Rotate Transition
  static AnimatedSwitcherTransitionBuilder rotateTransition =
      (Widget child, Animation<double> animation) {
    return RotationTransition(child: child, turns: animation);
  };
}

class PinCodeTextField extends StatefulWidget {
  final bool isCupertino;
  final int maxLength;
  final TextEditingController controller;
  final bool hideCharacter;
  final bool highlight;
  final bool highlightAnimation;
  final Color highlightAnimationBeginColor;
  final Color highlightAnimationEndColor;
  final Duration highlightAnimationDuration;
  final Color highlightColor;
  final Color defaultBorderColor;
  final PinBoxDecoration pinBoxDecoration;
  final String maskCharacter;
  final TextStyle pinTextStyle;
  final double pinBoxHeight;
  final double pinBoxWidth;
  final OnDone onDone;
  final bool hasError;
  final Color errorBorderColor;
  final Color hasTextBorderColor;
  final Function(String) onTextChanged;
  final bool autofocus;
  final FocusNode focusNode;
  final AnimatedSwitcherTransitionBuilder pinTextAnimatedSwitcherTransition;
  final Duration pinTextAnimatedSwitcherDuration;
  final WrapAlignment wrapAlignment;
  final PinCodeTextFieldLayoutType pinCodeTextFieldLayoutType;
  final TextDirection textDirection;
  final TextInputType keyboardType;

  const PinCodeTextField({
    Key key,
    this.isCupertino = false,
    this.maxLength = 4,
    this.controller,
    this.hideCharacter = false,
    this.highlight = false,
    this.highlightAnimation = false,
    this.highlightAnimationBeginColor = Colors.white,
    this.highlightAnimationEndColor = Colors.black,
    this.highlightAnimationDuration,
    this.highlightColor = Colors.black,
    this.pinBoxDecoration,
    this.maskCharacter = " ",
    this.pinBoxWidth = 70.0,
    this.pinBoxHeight = 70.0,
    this.pinTextStyle,
    this.onDone,
    this.defaultBorderColor = Colors.black,
    this.hasTextBorderColor = Colors.black,
    this.pinTextAnimatedSwitcherTransition,
    this.pinTextAnimatedSwitcherDuration = const Duration(),
    this.hasError = false,
    this.errorBorderColor = Colors.red,
    this.onTextChanged,
    this.autofocus = false,
    this.focusNode,
    this.wrapAlignment = WrapAlignment.start,
    this.pinCodeTextFieldLayoutType = PinCodeTextFieldLayoutType.NORMAL,
    this.textDirection = TextDirection.ltr,
    this.keyboardType = TextInputType.number
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PinCodeTextFieldState();
  }
}

class PinCodeTextFieldState extends State<PinCodeTextField>
    with SingleTickerProviderStateMixin {
  AnimationController _highlightAnimationController;
  Animation _highlightAnimationColorTween;
  FocusNode focusNode;
  String text = "";
  int currentIndex = 0;
  List<String> strList = [];
  bool hasFocus = false;
  double pinWidth;
  double screenWidth;

  @override
  void didUpdateWidget(PinCodeTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    focusNode = widget.focusNode ?? focusNode;

    if (oldWidget.maxLength < widget.maxLength) {
      setState(() {
        currentIndex = text.length;
      });
      widget.controller?.text = text;
      widget.controller?.selection =
          TextSelection.collapsed(offset: text.length);
    } else if (oldWidget.maxLength > widget.maxLength &&
        widget.maxLength > 0 &&
        text.isNotEmpty &&
        text.length > widget.maxLength) {
      setState(() {
        text = text.substring(0, widget.maxLength);
        currentIndex = text.length;
      });
      widget.controller?.text = text;
      widget.controller?.selection =
          TextSelection.collapsed(offset: text.length);
    }
  }

  _calculateStrList() async {
    if (strList.length > widget.maxLength) {
      strList.length = widget.maxLength;
    }
    while (strList.length < widget.maxLength) {
      strList.add("");
    }
  }

  _calculatePinWidth() async {
    if (widget.pinCodeTextFieldLayoutType ==
        PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH) {
      screenWidth = MediaQuery.of(context).size.width;
      var tempPinWidth = widget.pinBoxWidth;
      var maxLength = widget.maxLength;
      while ((tempPinWidth * maxLength) > screenWidth) {
        tempPinWidth -= 4;
      }
      tempPinWidth -= 10;
      setState(() {
        pinWidth = tempPinWidth;
      });
    } else {
      setState(() {
        pinWidth = widget.pinBoxWidth;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.highlightAnimation) {
      _highlightAnimationController = AnimationController(
          vsync: this,
          duration:
          widget.highlightAnimationDuration ?? Duration(milliseconds: 500));
      _highlightAnimationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _highlightAnimationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _highlightAnimationController.forward();
        }
      });
      _highlightAnimationColorTween = ColorTween(
          begin: widget.highlightAnimationBeginColor,
          end: widget.highlightAnimationEndColor)
          .animate(_highlightAnimationController);
      _highlightAnimationController.forward();
    }
    focusNode = widget.focusNode ?? FocusNode();

    _initTextController();
    _calculateStrList();
    widget.controller?.addListener(_controllerListener);
    focusNode?.addListener(_focusListener);
  }

  void _controllerListener() {
    if (mounted == true) {
      setState(() {
        _initTextController();
      });

      if (widget.onTextChanged != null) {
        widget.onTextChanged(widget.controller.text);
      }
    }
  }

  void _focusListener() {
    if (mounted == true) {
      setState(() {
        hasFocus = focusNode.hasFocus;
      });
    }
  }

  void _initTextController() {
    if (widget.controller == null) {
      return;
    }
    strList.clear();
    if (widget.controller.text.isNotEmpty) {
      if (widget.controller.text.length > widget.maxLength) {
        throw Exception("TextEditingController length exceeded maxLength!");
      }
    }

    text = widget.controller.text;
    for (var i = 0; i < text.length; i++) {
      strList.add(widget.hideCharacter ? widget.maskCharacter : text[i]);
    }
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      // Only dispose the focus node if it's internal.  Don't dispose the passed
      // in focus node as it's owned by the parent not this child widget.
      focusNode?.dispose();
    } else {
      focusNode.removeListener(_focusListener);
    }
    _highlightAnimationController?.dispose();
    widget.controller?.removeListener(_controllerListener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _touchPinBoxRow(),
          !widget.isCupertino ? _fakeTextInput() : _fakeTextInputCupertino(),
        ],
      ),
    );
  }

  Widget _touchPinBoxRow() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (hasFocus) {
          FocusScope.of(context).requestFocus(FocusNode());
          Future.delayed(Duration(milliseconds: 100), () {
            FocusScope.of(context).requestFocus(focusNode);
          });
        } else {
          FocusScope.of(context).requestFocus(focusNode);
        }
      },
      child: _pinBoxRow(context),
    );
  }

  Widget _fakeTextInput() {
    var transparentBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0.0,
      ),
    );
    return Container(
      width: 0.1,
      height: 8.0, // RenderBoxDecorator subtextGap constant is 8.0
      child: TextField(
        autofocus: widget.autofocus,
        focusNode: focusNode,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.keyboardType == TextInputType.number
            ? <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly]
            : null,
        style: TextStyle(
          height: 0.1, color: Colors.transparent,
//          color: Colors.transparent,
        ),
        decoration: InputDecoration(
          focusedErrorBorder: transparentBorder,
          errorBorder: transparentBorder,
          disabledBorder: transparentBorder,
          enabledBorder: transparentBorder,
          focusedBorder: transparentBorder,
          counterText: null,
          counterStyle: null,
          helperStyle: TextStyle(
            height: 0.0,
            color: Colors.transparent,
          ),
          labelStyle: TextStyle(height: 0.1),
          fillColor: Colors.transparent,
          border: InputBorder.none,
        ),
        cursorColor: Colors.transparent,
        maxLength: widget.maxLength,
        onChanged: _onTextChanged,
      ),
    );
  }

  Widget _fakeTextInputCupertino() {
    return Container(
      width: 0.1,
      height: 0.1,
      child: CupertinoTextField(
        autofocus: widget.autofocus,
        focusNode: focusNode,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.keyboardType == TextInputType.number
            ? <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly]
            : null,
        style: TextStyle(
          color: Colors.transparent,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: null,
        ),
        cursorColor: Colors.transparent,
        maxLength: widget.maxLength,
        onChanged: _onTextChanged,
      ),
    );
  }

  void _onTextChanged(String text) {
    if (widget.onTextChanged != null) {
      widget.onTextChanged(text);
    }
    setState(() {
      this.text = text;
      if (text.length < currentIndex) {
        strList[text.length] = "";
      } else {
        strList[text.length - 1] =
        widget.hideCharacter ? widget.maskCharacter : text[text.length - 1];
      }
      currentIndex = text.length;
    });
    if (text.length == widget.maxLength) {
      FocusScope.of(context).requestFocus(FocusNode());
      widget.onDone(text);
    }
  }

  Widget _pinBoxRow(BuildContext context) {
    _calculateStrList();
    _calculatePinWidth();
    List<Widget> pinCodes = List.generate(widget.maxLength, (int i) {
      return _buildPinCode(i, context);
    });
    return widget.pinCodeTextFieldLayoutType == PinCodeTextFieldLayoutType.WRAP
        ? Wrap(
      direction: Axis.horizontal,
      alignment: widget.wrapAlignment,
      verticalDirection: VerticalDirection.down,
      textDirection: widget.textDirection,
      children: pinCodes,
    )
        : Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        textDirection: widget.textDirection,
        children: pinCodes);
  }

  Widget _buildPinCode(int i, BuildContext context) {
    Color borderColor;
    BoxDecoration boxDecoration;
    if (widget.hasError) {
      borderColor = widget.errorBorderColor;
    } else if (widget.highlightAnimation && _shouldHighlight(i)) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: AnimatedBuilder(
              animation: _highlightAnimationController,
              builder: (BuildContext context, Widget child) {
                if (widget.pinBoxDecoration != null) {
                  boxDecoration = widget
                      .pinBoxDecoration(_highlightAnimationColorTween.value as Color);
                } else {
                  boxDecoration =
                      ProvidedPinBoxDecoration.defaultPinBoxDecoration(
                          _highlightAnimationColorTween.value as Color);
                }
     
                return Container(
                  key: ValueKey<String>("container$i"),
                  child: Center(child: _animatedTextBox(strList[i], i)),
                  decoration: boxDecoration,
                  width: pinWidth,
                  height: widget.pinBoxHeight,
                );
              }));
    } else if (widget.highlight && _shouldHighlight(i)) {
      borderColor = widget.highlightColor;
    } else if (i < text.length) {
      borderColor = widget.hasTextBorderColor;
    } else {
      borderColor = widget.defaultBorderColor;
    }

    if (widget.pinBoxDecoration != null) {
      boxDecoration = widget.pinBoxDecoration(borderColor);
    } else {
      boxDecoration =
          ProvidedPinBoxDecoration.defaultPinBoxDecoration(borderColor);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Container(
        key: ValueKey<String>("container$i"),
        child: Center(child: _animatedTextBox(strList[i], i)),
        decoration: boxDecoration,
        width: pinWidth,
        height: widget.pinBoxHeight,
      ),
    );
  }

  bool _shouldHighlight(int i) {
    return hasFocus &&
        (i == text.length ||
            (i == text.length - 1 && text.length == widget.maxLength));
  }

  Widget _animatedTextBox(String text, int i) {
    if (widget.pinTextAnimatedSwitcherTransition != null) {
      return AnimatedSwitcher(
        duration: widget.pinTextAnimatedSwitcherDuration,
        transitionBuilder: widget.pinTextAnimatedSwitcherTransition ??
                (Widget child, Animation<double> animation) {
              return child;
            },
        child: Text(
          text,
          key: ValueKey<String>("$text$i"),
          style: widget.pinTextStyle,
        ),
      );
    } else {
      return Text(
        text,
        key: ValueKey<String>("${strList[i]}$i"),
        style: widget.pinTextStyle,
      );
    }
  }
}

enum PinCodeTextFieldLayoutType { NORMAL, WRAP, AUTO_ADJUST_WIDTH }
