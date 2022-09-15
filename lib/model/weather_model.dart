class Model {
  Main? main;
  Clouds? clouds;
  String? name;

  Model({this.main, this.clouds, this.name});

  Model.fromJson(Map<String, dynamic> json) {
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (main != null) {
      data['main'] = main!.toJson();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    data['name'] = name;
    return data;
  }
}

class Main {
  double? temp;
  int? pressure;
  int? humidity;

  Main({this.temp, this.pressure, this.humidity});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    return data;
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}
