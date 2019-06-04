class Category {
  final String categoryName;
  final String categoryId;
  final String parentId;
  Category(this.categoryId, this.categoryName, this.parentId);
  factory Category.fromJson(Map<String, Object> json) {
    return new Category(json['categoryid'], json['category_name'], json['parentid']);
  }
}