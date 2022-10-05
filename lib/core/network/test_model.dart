class LastPageModel {
  final int? last;
  final int? total;

  LastPageModel({
     this.last,
     this.total,
  });

  factory LastPageModel.fromJson(Map<String, dynamic> json) {
    return LastPageModel(
      last: json['data']['last_page'],
      total: json['data']['total'],
    );

  }
}
