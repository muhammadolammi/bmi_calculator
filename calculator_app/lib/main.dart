import 'package:flutter/material.dart';

void main() {
  runApp(const  Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Calculator_Home(),

    );
  }
}
class Calculator_Home extends StatefulWidget {
  const Calculator_Home({Key? key}) : super(key: key);

  @override
  State<Calculator_Home> createState() => _Calculator_HomeState();
}

class _Calculator_HomeState extends State<Calculator_Home> {
  Widget btn (String btntxt, Color btncolor, Color txtcolor){
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
          shape: CircleBorder(

          ),
          backgroundColor: btncolor,
          padding: EdgeInsets.all(20),
        ),
        onPressed: (){
          calculation(btntxt);
        },
        child: Text(btntxt,
        style: TextStyle(
          color: txtcolor,
          fontSize: 35,
        ),
        ),
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,

        title:
        Text('Calculator',

          style: TextStyle(
            fontSize: 40,
          ),

        ),
        centerTitle: true,

      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 100,
                    ),
                  )
                ],
              ),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Expanded(child: btn('AC', Colors.grey, Colors.black)),
                Expanded(child: btn('+/-', Colors.grey, Colors.black)),
                Expanded(child: btn('%', Colors.grey, Colors.black)),
                Expanded(child: btn('/', Colors.amber[700]!, Colors.white)),
              ],
            ),

            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Expanded(child: btn('9', Colors.grey[850]!, Colors.white)),
                Expanded(child: btn('8', Colors.grey[850]!, Colors.white)),
                Expanded(child: btn('7', Colors.grey[850]!, Colors.white)),
                Expanded(child: btn('x', Colors.amber[700]!, Colors.white)),
              ],
            ),

            SizedBox(height: 10,),


            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Expanded(child: btn('6', Colors.grey[850]!, Colors.white)),
                Expanded(child: btn('5', Colors.grey[850]!, Colors.white)),
                Expanded(child: btn('4', Colors.grey[850]!, Colors.white)),
                Expanded(child: btn('-', Colors.amber[700]!, Colors.white)),
              ],
            ),

            SizedBox(height: 10,),


            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Expanded(child: btn('3', Colors.grey[850]!, Colors.white)),
                Expanded(child: btn('2', Colors.grey[850]!, Colors.white)),
                Expanded(child: btn('1', Colors.grey[850]!, Colors.white)),
                Expanded(child: btn('+', Colors.amber[700]!, Colors.white)),
              ],
            ),

            SizedBox(height: 10,),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Colors.grey[850],
                      padding: EdgeInsets.fromLTRB(32, 20, 120, 20)

                  ),
                  onPressed: () {
                  }, child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),),
                Expanded(
                    child: btn('.', Colors.grey[850]!, Colors.white)),
                Expanded(child: btn('=', Colors.amber[700]!, Colors.white)),

              ],
            ),

            SizedBox(height: 20,),


          ],
        ),
      ),
    );
  }
  //Calculator logic
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }




}





