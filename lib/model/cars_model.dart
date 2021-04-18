import 'configuration.dart';
import 'make.dart';

class CarsModel {
  Make make;
  String color;
  int year;
  Configuration configuration;
  String origin;
  int mpg;
  String image;
  int price;

  CarsModel(
      {this.make,
      this.color,
      this.year,
      this.configuration,
      this.origin,
      this.mpg,
      this.image,
      this.price});

  CarsModel.fromJson(Map<String, dynamic> json) {
    make = json['make'] != null ? new Make.fromJson(json['make']) : null;
    color = json['color'];
    year = json['year'];
    configuration = json['configuration'] != null
        ? new Configuration.fromJson(json['configuration'])
        : null;
    origin = json['origin'];
    mpg = json['mpg'];
    image = json['image'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.make != null) {
      data['make'] = this.make.toJson();
    }
    data['color'] = this.color;
    data['year'] = this.year;
    if (this.configuration != null) {
      data['configuration'] = this.configuration.toJson();
    }
    data['origin'] = this.origin;
    data['mpg'] = this.mpg;
    data['image'] = this.image;
    data['price'] = this.price;
    return data;
  }
}
