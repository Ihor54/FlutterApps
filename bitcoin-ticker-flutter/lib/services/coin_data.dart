import 'package:bitcoin_ticker/services/networking.dart';
import 'package:flutter/material.dart';

class CoinData {
  final String apiKey =
      "5d71762d99f56ba73ff0aa31d8f02d032a9c43f203f6bcb2a72037dd5970adfa";
  final String cryptoApiUrl = "https://min-api.cryptocompare.com/data/price";

  Future<Map<String, String>> getCoinData(String currency) async {
    Map<String, String> coinPrices = {};
    for (var coin in cryptoList) {
      var requestUrl =
          "$cryptoApiUrl?fsym=$coin&tsyms=$currency&api_key=$apiKey";
      print(requestUrl);

      var cryptoData = await NetworkHelper().getData(requestUrl);
      var coinPrice = cryptoData[currency];
      coinPrices[coin] = coinPrice.toStringAsFixed(2);
    }
    return coinPrices;
  }
}

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
