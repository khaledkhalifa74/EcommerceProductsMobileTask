import 'package:ecommerce_products/features/Home/data/models/meta_data_model.dart';
import 'package:ecommerce_products/features/Home/data/models/products_data_model.dart';

class DataModel {
  int? results;
  Metadata? metadata;
  List<Data>? data;

  DataModel({this.results, this.metadata, this.data});

  DataModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
