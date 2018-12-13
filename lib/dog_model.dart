import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Dog {
  final String name;
  final String location;
  final String description;
  String imageUrl;

  // All dogs start out at 10, because they're good dogs.
  int rating = 10;

  Dog(this.name, this.location, this.description);

  Future getImageUrl() async {
    // Null check so our app isn't doing extra work
    // If theres already an image, we don't need to get one.
    if (imageUrl != null) {
      return;
    }

    // This is how http calls are done in flutter:
    try {
      var response = await http.get("https://dog.ceo/api/breeds/image/random");
      var data = json.decode(response.body);
      var url = data['message'];
      imageUrl = url;
    } catch (exception) {
      print(exception);
    }
  }
}
