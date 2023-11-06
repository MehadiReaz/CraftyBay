import 'package:e_commerce_app/data/models/product.dart';

class WishListModel {
  String? msg;
  List<WishList>? data;

  WishListModel({this.msg, this.data});

  WishListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <WishList>[];
      json['data'].forEach((v) {
        data!.add(new WishList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WishList {
  int? id;
  int? productId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  Product? product;

  WishList(
      {this.id,
      this.productId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.product});

  WishList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}
