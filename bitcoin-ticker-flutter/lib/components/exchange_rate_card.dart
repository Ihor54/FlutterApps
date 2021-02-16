import 'package:flutter/material.dart';

class ExchangeRateCard extends StatelessWidget {
  ExchangeRateCard(
      {@required this.cryptoCurrency, this.currency, this.exchangeValue});

  final String cryptoCurrency;
  final String currency;
  final String exchangeValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            "1 $cryptoCurrency = $exchangeValue $currency",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
