import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectCurrency = 'GBP';

  // Option for deciding depending on device
  Widget getPicker() {
    if (Platform.isIOS) {
      return iosScroll();
    } else if (Platform.isAndroid) {
      return androidDropDown();
    }
  }

  /// Android method
  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> dropDowns = [];
    for (String each in currenciesList) {
      dropDowns.add(DropdownMenuItem(
        child: Text(each),
        value: each,
      ));
    }

    return DropdownButton<String>(
        value: selectCurrency,
        items: dropDowns,
        onChanged: (value) {
          setState(() {
            selectCurrency = value;
            print(selectCurrency);
          });
        });
  }

  /// IOS method
  CupertinoPicker iosScroll() {
    List<Text> scroll = [];
    for (String each in currenciesList) {
      scroll.add(Text(each));
    }

    return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 32,
        onSelectedItemChanged: (selectedIndex) {
          print(selectedIndex);
        },
        children: scroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iosScroll() : androidDropDown(),

            /// Choose device
          )
        ],
      ),
    );
  }
}
