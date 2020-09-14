import 'package:http/http.dart' as http;
import 'dart:convert';

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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '4D5BF7C2-8665-4319-98AF-8C9BAD860CBB';

class CoinData {
  //'https://rest.coinapi.io/v1/exchangerate/BTC/AUD/?apikey=4D5BF7C2-8665-4319-98AF-8C9BAD860CBB'
  Future getData(String cryptoCurrency, String selectedCurrency) async {
    Map<String, double> map = {};
    for (String cryptoCurrency in cryptoList) {
      http.Response response = await http
          .get('$coinAPIURL/$cryptoCurrency/$selectedCurrency/?apikey=$apiKey');
      if (response.statusCode == 200) {
        String data = response.body;
        var currencyData = jsonDecode(data);
        double currencyPrice = currencyData['rate'].toDouble();
        map.addAll({cryptoCurrency: currencyPrice});
      }
      return map;
    }
  }
}
