class SubjectModel {
  String? subjectId;
  String? subjectName;
  String? description;
  List<String>? courseIds; // Changed from String to List<String>
  List<String>? teachers;
  int? totalStudents;
  int? totalVideos;
  int? totalNotes;
  int? totalTestSeries;
  int? totalQuestions;

  SubjectModel({
    this.subjectId,
    this.subjectName,
    this.description,
    this.courseIds,
    this.teachers,
    this.totalStudents,
    this.totalVideos,
    this.totalNotes,
    this.totalTestSeries,
    this.totalQuestions,
  });

  // Factory method to create an instance from Firestore data (JSON)
  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      subjectId: json['subjectId'],
      subjectName: json['subjectName'],
      description: json['description'],
      courseIds: List<String>.from(json['courseIds'] ?? []), // Handle List<String>
      teachers: List<String>.from(json['teachers'] ?? []),
      totalStudents: json['totalStudents'] ?? 0,
      totalVideos: json['totalVideos'] ?? 0,
      totalNotes: json['totalNotes'] ?? 0,
      totalTestSeries: json['totalTestSeries'] ?? 0,
      totalQuestions: json['totalQuestions'] ?? 0,
    );
  }

  // Convert instance to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'subjectId': subjectId,
      'subjectName': subjectName,
      'description': description,
      'courseIds': courseIds ?? [], // Handle List<String>
      'teachers': teachers ?? [],
      'totalStudents': totalStudents ?? 0,
      'totalVideos': totalVideos ?? 0,
      'totalNotes': totalNotes ?? 0,
      'totalTestSeries': totalTestSeries ?? 0,
      'totalQuestions': totalQuestions ?? 0,
    };
  }

  // copyWith method to allow updates to specific fields while maintaining immutability
  SubjectModel copyWith({
    String? subjectId,
    String? subjectName,
    String? description,
    List<String>? courseIds, // Changed to List<String>
    List<String>? teachers,
    int? totalStudents,
    int? totalVideos,
    int? totalNotes,
    int? totalTestSeries,
    int? totalQuestions,
  }) {
    return SubjectModel(
      subjectId: subjectId ?? this.subjectId,
      subjectName: subjectName ?? this.subjectName,
      description: description ?? this.description,
      courseIds: courseIds ?? this.courseIds, // Handle List<String>
      teachers: teachers ?? this.teachers,
      totalStudents: totalStudents ?? this.totalStudents,
      totalVideos: totalVideos ?? this.totalVideos,
      totalNotes: totalNotes ?? this.totalNotes,
      totalTestSeries: totalTestSeries ?? this.totalTestSeries,
      totalQuestions: totalQuestions ?? this.totalQuestions,
    );
  }
}
