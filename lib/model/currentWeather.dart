class CurrentWeather {
  Location? location;
  Current? current;

  CurrentWeather({this.location, this.current});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    return data;
  }
}

class Location {
  String? region;
  String? country;
  String? localtime;

  Location({this.region, this.country, this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    region = json['region'];
    country = json['country'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['region'] = this.region;
    data['country'] = this.country;
    data['localtime'] = this.localtime;
    return data;
  }
}

class Current {
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? humidity;
  Condition? condition;

  Current({
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.humidity,
    this.condition,
  });

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'].toDouble();
    tempF = json['temp_f'];
    humidity = json['humidity'];
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_updated'] = this.lastUpdated;
    data['temp_c'] = this.tempC;
    data['temp_f'] = this.tempF;
    data['humidity'] = this.humidity;
    if (this.condition != null) {
      data['condition'] = this.condition!.toJson();
    }
    return data;
  }
}

class Condition {
  String? icon;

  Condition({
    this.icon,
  });

  Condition.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    return data;
  }
}
