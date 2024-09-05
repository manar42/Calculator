import 'package:calculator/Widgets/custom_button.dart';
import 'package:calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override

  // ignore: library_private_types_in_public_api
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String exp = '';
  String history = '';
  double num1 = 0;
  double num2 = 0;
  String operations = '';

  void numClick(String btntext) {
    if (btntext == 'Ac') {
      setState(() {
        exp = '';
        history = '';
      });

      num1 = 0;
      num2 = 0;
    } else if (btntext == 'C') {
      setState(() {
        exp = '';
      });
    } else if (btntext == '%' ||
        btntext == '/' ||
        btntext == 'x' ||
        btntext == '-' ||
        btntext == '+') {
      operations = btntext;

      num1 = double.parse(exp);

      setState(() {
        exp = '';
        history = num1.toString();
        history += btntext;
      });
    } else if (btntext == '.') {
      if (exp.contains('.')) {
      } else {
        setState(() {
          exp += btntext;
        });
      }
    } else if (btntext == '=') {
      num2 = double.parse(exp);
      history += exp;

      switch (operations) {
        case '%':
          {
            exp = (num1 % num2).toString();
          }
          break;

        case '/':
          {
            num2 == 0
                ? exp = 'unvalid operation'
                : exp = (num1 / num2).toString();
          }
          break;

        case 'x':
          {
            exp = (num1 * num2).toString();
          }
          break;

        case '-':
          {
            exp = (num1 - num2).toString();
          }
          break;

        case '+':
          {
            exp = (num1 + num2).toString();
          }
          break;

        default:
          break;
      }

      setState(() {});
    } else {
      setState(() {
        exp += btntext;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    //var numClick;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              margin: Constants.textmargin,
              alignment: Constants.textAlignment,
              //alignment: Alignment.centerRight,
              child: Text(
                history,
                style: Constants.style1,
              )),
          const Divider(
            color: Colors.black,
            thickness: 5,
          ),
          Container(
              margin: Constants.textmargin,
              alignment: Constants.textAlignment,
              // alignment: Alignment.centerRight,
              child: Text(
                exp,
                style: Constants.style1,
              )),
          //
          Row(children: [
            CustomButton(
              btnColor: Colors.grey,
              btnText: "Ac",
              callBack: numClick,
            ),
            CustomButton(
              btnColor: Colors.grey,
              btnText: "C",
              callBack: numClick,
            ),
            CustomButton(
              btnColor: Colors.orange,
              btnText: "%",
              callBack: numClick,
            ),
            CustomButton(
              btnColor: Colors.orange,
              btnText: "/",
              callBack: numClick,
            ),
          ]),
          Row(
            children: [
              CustomButton(
                btnColor: Colors.black,
                btnText: "7",
                callBack: numClick,
              ),
              CustomButton(
                btnColor: Colors.black,
                btnText: "8",
                callBack: numClick,
              ),
              CustomButton(
                btnColor: Colors.black,
                btnText: "9",
                callBack: numClick,
              ),
              CustomButton(
                btnColor: Colors.orange,
                btnText: "x",
                callBack: numClick,
              ),
            ],
          ),
          Row(
            children: [
              CustomButton(
                btnColor: Colors.black,
                btnText: "4",
                callBack: numClick,
              ),
              CustomButton(
                btnColor: Colors.black,
                btnText: "5",
                callBack: numClick,
              ),
              CustomButton(
                btnColor: Colors.black,
                btnText: "6",
                callBack: numClick,
              ),
              CustomButton(
                btnColor: Colors.orange,
                btnText: "-",
                callBack: numClick,
              ),
            ],
          ),
          Row(
            children: [
              CustomButton(
                btnColor: Colors.black,
                btnText: "1",
                callBack: numClick,
              ),
              CustomButton(
                btnColor: Colors.black,
                btnText: "2",
                callBack: numClick,
              ),
              CustomButton(
                btnColor: Colors.black,
                btnText: "3",
                callBack: numClick,
              ),
              CustomButton(
                btnColor: Colors.orange,
                btnText: "+",
                callBack: numClick,
              ),
            ],
          ),
          Row(
            children: [
              CustomButton(
                btnColor: Colors.black,
                btnText: "0",
                flex: 2,
                callBack: numClick,
              ),
              CustomButton(
                btnColor: Colors.black,
                btnText: ".",
                callBack: numClick,
              ),
              CustomButton(
                btnColor: Colors.orange,
                btnText: "=",
                callBack: numClick,
              ),
            ],
          )
        ],
      ),
    );
  }
}
