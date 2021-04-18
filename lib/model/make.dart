class Make {
  String manufacturer;
  String model;

  Make({this.manufacturer, this.model});

  Make.fromJson(Map<String, dynamic> json) {
    manufacturer = json['manufacturer'];
    model = json['model'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['manufacturer'] = this.manufacturer;
    data['model'] = this.model;
    return data;
  }
}
