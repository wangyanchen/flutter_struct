class CommodityModel {
  final String name;
  final String id;
  final String masterImage;
  final int salePrice;
  int status;

  CommodityModel(this.name, this.id, this.masterImage, this.salePrice, this.status);
  factory CommodityModel.fromJson(Map<String, Object> json) {
    return new CommodityModel(
        json['name'], json['id'], json['master_image'], json['sale_price'], json['status']);
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'masterImage': masterImage,
        'salePrice': salePrice,
        'status': status
      };
}
