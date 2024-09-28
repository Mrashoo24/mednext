class CourseModel {
  final String id;
  final String name;
  final String categoryid;
  bool? isExpanded;

  CourseModel({required this.id, required this.name,this.isExpanded = false,required this.categoryid});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      name: json['name'],
        categoryid:json['categoryid'],
    );
  }

  // Copy with method
  CourseModel copyWith({String? id, String? name}) {
    return CourseModel(
      id: id ?? this.id,
      name: name ?? this.name,
        categoryid: categoryid ?? this.categoryid,
    );
  }
}