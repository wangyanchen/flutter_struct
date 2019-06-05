class CategoryModel {
  final String name;
  final String id;
  final String parentId;
  final String icon;
  final String image;
  int status;

  CategoryModel(this.name, this.id, this.parentId, this.icon, this.image, this.status);
  factory CategoryModel.fromJson(Map<String, Object> json) {
    return new CategoryModel(
        json['name'], json['id'], json['parentid'], json['icon'], json['image'], json['status']);
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'parentId': parentId,
        'icon': icon,
        'image': image,
        'status': status
      };
}
