import 'file:///E:/Own/Courses/Flutter/FlutterApps/bitcoin-ticker-flutter/lib/components/exchange_rate_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "USD";

  Map<String, String> coinValues = {};
  bool isWaiting = true;

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> currencies = [];
    for (var item in currenciesList) {
      currencies.add(DropdownMenuItem(
        child: Text(item),
        value: item,
      ));
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      icon: Icon(Icons.arrow_downward),
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      isExpanded: true,
      items: currencies,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getRates();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> currencies = [];
    for (var cur in currenciesList) {
      currencies.add(Text(cur));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 40.0,
      onSelectedItemChanged: (index) {
        setState(() {
          selectedCurrency = currenciesList[index];
          getRates();
        });
      },
      children: currencies,
    );
  }

  Column getCards() {
    List<Widget> cards = [];
    for (var cryptoCur in cryptoList) {
      cards.add(ExchangeRateCard(
        cryptoCurrency: cryptoCur,
        currency: selectedCurrency,
        exchangeValue: isWaiting ? "?" : coinValues[cryptoCur],
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cards,
    );
  }

  void getRates() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
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
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: getCards()),
          Container(
            height: 150.0,
            width: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0, left: 60, right: 60),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}
