
class Bus {
    int id;
    String image;
    String name;
    String type;
    String driverName;
    String driverLicenseNo;

    Bus({
        required this.id,
        required this.image,
        required this.name,
        required this.type,
        required this.driverName,
        required this.driverLicenseNo,
    });

    factory Bus.fromJson(Map<String, dynamic> json) => Bus(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        type: json["type"],
        driverName: json["driver_name"],
        driverLicenseNo: json["driver_license_no"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "type": type,
        "driver_name": driverName,
        "driver_license_no": driverLicenseNo,
    };
}