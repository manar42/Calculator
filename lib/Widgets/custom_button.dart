import 'package:calculator/constants/constants.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    @required this.btnColor,
    @required this.btnText,
    this.flex,
    @required this.callBack,
  });

  Color? btnColor;
  String? btnText;
  int? flex;
  Function? callBack;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex == null ? 1 : flex!,
      child: GestureDetector(
          onTap: () {
            callBack!(btnText);
          },
          child: Container(
            width: 50,
            height: 60,
            // ignore: sort_child_properties_last
            child: Text(
              btnText!,
              style: Constants.btnTextStyle,
            ),
            margin: const EdgeInsets.all(3),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: btnColor,
            ),
          )),
    );
  }
}
