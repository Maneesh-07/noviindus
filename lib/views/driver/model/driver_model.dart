class Driver {
  int id;
  String name;
  String mobile;
  String licenseNo;

  Driver({
    required this.id,
    required this.name,
    required this.mobile,
    required this.licenseNo,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        licenseNo: json["license_no"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "license_no": licenseNo,
      };
}
