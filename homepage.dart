import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firstnum =0;
  int  secondnum=0  ;
  String texttodisplay = "";
  String res=""  ;
  String operatortoperform = "";
  void btnclicked(String btnval) {
    if (btnval == "C") {
      texttodisplay = "";
      firstnum ;
      secondnum ;
      res ;
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "x" ||
        btnval == "/") {
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = btnval;
    } else if (btnval == "=") {
      secondnum = int.parse(texttodisplay);
      if (operatortoperform == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operatortoperform == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (operatortoperform == "x") {
        res = (firstnum * secondnum).toString();
      }
      if (operatortoperform == "/") {
        res = (firstnum / secondnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + btnval).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget custombutton(String btnval) {
    return Expanded(
      child: MaterialButton(
        padding: const EdgeInsets.all(25.0),
        onPressed: () => btnclicked(btnval),
        child: Text(
          "$btnval",
          style: const TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding:const  EdgeInsets.all(25.0),
                child: Text(
                  "$texttodisplay",
                  style:const  TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                ),
              ),
            ),
            Row(
              children: [
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
              ],
            ),
            Row(
              children: [
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),
            Row(
              children: [
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("x"),
              ],
            ),
            Row(
              children: [
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
