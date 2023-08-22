class UniversityModel {
  String? country;
  List<String>? domains;
  String? alphaTwoCode;
  dynamic stateProvince;
  List<String>? webPages;
  String? name;

  UniversityModel({
    this.country,
    this.domains,
    this.alphaTwoCode,
    this.stateProvince,
    this.webPages,
    this.name,
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      UniversityModel(
        country: json["country"],
        domains: json["domains"] == null
            ? []
            : List<String>.from(json["domains"]!.map((x) => x)),
        alphaTwoCode: json["alpha_two_code"],
        stateProvince: json["state-province"],
        webPages: json["web_pages"] == null
            ? []
            : List<String>.from(json["web_pages"]!.map((x) => x)),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "domains":
            domains == null ? [] : List<dynamic>.from(domains!.map((x) => x)),
        "alpha_two_code": alphaTwoCode,
        "state-province": stateProvince,
        "web_pages":
            webPages == null ? [] : List<dynamic>.from(webPages!.map((x) => x)),
        "name": name,
      };
}
