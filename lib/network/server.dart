import 'package:http/http.dart' as http;

class Server {
  static Server _instance = new Server.internal();

  Server.internal();

  factory Server() => _instance;

  static Future<http.Response> getCars() async {
    var response = await http.get(
      "https://afterpay-mobile-interview.s3.amazonaws.com/cars.json",
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );

    return response;
  }
}
