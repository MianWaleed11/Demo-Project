class Configuration {
  String body;
  int cylinders;
  int horsepower;

  Configuration({this.body, this.cylinders, this.horsepower});

  Configuration.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    cylinders = json['cylinders'];
    horsepower = json['horsepower'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['cylinders'] = this.cylinders;
    data['horsepower'] = this.horsepower;
    return data;
  }
}
