class Disease {
  String? name;
  String? reason;
  String? treatment_method;
  Disease({this.name, this.reason, this.treatment_method});
  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
      name: json['name'],
      reason: json['reason'],
      treatment_method: json['treatment_method'],
    );
  }
}
