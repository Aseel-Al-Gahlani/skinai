class Doctor {
  String? name;
  String? address;
  int? phone;
  Doctor({this.name, this.address, this.phone});
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
    );
  }
}
