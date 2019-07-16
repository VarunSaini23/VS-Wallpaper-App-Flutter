import 'single_image_model.dart';

class ApiResultModel{
  int totalHits;
  List<SingleImageModel> hits;
  int total;

  ApiResultModel({this.totalHits, this.hits, this.total});

  ApiResultModel.fromJson(Map<String, dynamic> json) {
    totalHits = json['totalHits'];
    if (json['hits'] != null) {
      hits = new List<SingleImageModel>();
      json['hits'].forEach((v) {
        hits.add(new SingleImageModel.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalHits'] = this.totalHits;
    if (this.hits != null) {
      data['hits'] = this.hits.map((v) => v.toMap()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}