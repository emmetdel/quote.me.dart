import 'dart:html';
import 'package:http/http.dart';
import 'dart:convert';

var quote = querySelector('#quote');
var author = querySelector('#author');
var refreshBtn = querySelector('#refresh-button');

void main() {
  getQuote();
  refreshBtn.onClick.listen((_) {
    getQuote();
  });
}

Future<void> getQuote() async {
  const url = 'https://api.quotable.io/random';
  quote.text = 'Loading...';
  author.text = '';
  Response response = await get(url);
  var body = json.decode(response.body);
  quote.text = '"' + body['content'] + '"';
  author.text = body['author'];
}
