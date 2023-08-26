import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  }

class _MyHomePageState extends State<MyHomePage> {


  late int firstnum;
  late int secondnum;
  String texttodisplay = '';
  late String res;
  late String operatortoperfore;

  void btnclicked(String btnval){
    if (btnval == 'C'){
      texttodisplay = '';
      firstnum = 0;
      secondnum = 0;
      res = '';
    }
    else if (btnval == '+' || btnval == '-' || btnval == 'x' || btnval == '/'){
      firstnum = int.parse(texttodisplay);
      res = '';
      operatortoperfore =  btnval;
    }
    else if (btnval == '='){
      secondnum = int.parse(texttodisplay);
      if (operatortoperfore == '+'){
        res = (firstnum + secondnum).toString();
      }

      if (operatortoperfore == '-'){
        res = (firstnum - secondnum).toString();
      }

      if (operatortoperfore == 'x'){
        res = (firstnum * secondnum).toString();
      }

      if (operatortoperfore == '/'){
        res = (firstnum / secondnum).toString();
      }
    }
    else{
      res = int.parse(texttodisplay + btnval).toString();
    }

    setState(() {
      texttodisplay = res;
    });
  }

  Widget customButton(String btnval){
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnclicked(btnval),
        child: Text(
          '$btnval',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),);}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Calculator',
              style: TextStyle(
            color: Colors.white
        ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomRight,
                child: Text(
                '$texttodisplay',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                customButton('9'),
                customButton('8'),
                customButton('7'),
                customButton('+'),
              ],
            ),
            const SizedBox(height: 10,),

            Row(
              children: [
                customButton('6'),
                customButton('5'),
                customButton('4'),
                customButton('-'),
              ],
            ),
            const SizedBox(height: 10,),

            Row(
              children: [
                customButton('3'),
                customButton('2'),
                customButton('1'),
                customButton('x'),
              ],
            ),
            const SizedBox(height: 10,),

            Row(
              children: [
                customButton('C'),
                customButton('0'),
                customButton('='),
                customButton('/'),
              ],
            ),
            const SizedBox(height: 10,),

          ],
        ),

      ),
    );
  }
}
