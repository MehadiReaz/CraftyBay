class ReviewModel {
  String? msg;
  List<ReviewData>? data;

  ReviewModel({this.msg, this.data});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <ReviewData>[];
      json['data'].forEach((v) {
        data!.add(new ReviewData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReviewData {
  int? id;
  String? description;
  String? rating;
  int? customerId;
  int? productId;
  String? createdAt;
  String? updatedAt;
  Profile? profile;

  ReviewData(
      {this.id,
      this.description,
      this.rating,
      this.customerId,
      this.productId,
      this.createdAt,
      this.updatedAt,
      this.profile});

  ReviewData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    rating = json['rating'];
    customerId = json['customer_id'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['customer_id'] = this.customerId;
    data['product_id'] = this.productId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  int? id;
  String? cusName;

  Profile({this.id, this.cusName});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cusName = json['cus_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cus_name'] = this.cusName;
    return data;
  }
}
