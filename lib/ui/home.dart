import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  /* Mars: 0.38
  Pluto: 0.06
  venus: 0.91
  weight = mass * multiplier(surface gravity)
   */
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();

  int radioValue = 0;
  double _finalResult = 0.0;
  String _FormattedText ="";
  void handleRadioVAlueChanged(var value) {
    setState(() {
      radioValue = value;

      switch(radioValue){
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _FormattedText = "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;

        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _FormattedText = "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;

        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _FormattedText = "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
          break;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              'image/planet.png',
              height: 133.9,
              width: 200.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Your Weight on Earth",
                      hintText: 'In Pounds',
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),

                  //three radio buttons
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioVAlueChanged),
                      new Text(
                        "Pluto",
                        style: new TextStyle(color: Colors.white30),
                      ),
                      new Radio<int>(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioVAlueChanged),
                      new Text(
                        "Mars",
                        style: new TextStyle(color: Colors.white30),
                      ),
                      new Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioVAlueChanged),
                      new Text(
                        "Venus",
                        style: new TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),

                  //Result Text
                  new Text(
                    _weightController.text.isEmpty ? "Please enter weight" : _FormattedText + " lbs",
                    //"$_FormattedText lbs",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if(int.parse(weight).toString().isNotEmpty && int.parse(weight)>0){
      return int.parse(weight) * multiplier;
    }else
      {
        print("Wrong!");
        return int.parse("180") * 0.38;
      }
  }
}

//activeColor: active color property used to change color of radio button
//onchanged to used to change state of radio button in a same group

// groupVAlue is The currently selected value for this group of radio buttons.
// This radio button is considered selected if its value matches the groupValue.

//value is unique identifier for every radio button.
//In Radio<int>, <int> is used for using only integer value in radio buttons.

// int.parse(weight) is used to convert String into Number.
// toStirng() is used to Returns a string representation of the integer.

// toStringAsFixed(1) used to string representation of integer and used to fixed digit after decimal.
