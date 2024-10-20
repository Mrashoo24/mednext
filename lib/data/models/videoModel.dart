class VideoModel {
  String? courseId;
  String? description;
  int? duration;
  int? ratings;
  String? subjectId;
  String? teacherId;
  String? thumbnail;
  String? title;
  String? uploadDate;
  String? url;
  String? videoId;
  bool? paid;
  bool? recommended;

  VideoModel(
      {this.courseId,
        this.description,
        this.duration,
        this.ratings,
        this.subjectId,
        this.teacherId,
        this.thumbnail,
        this.title,
        this.uploadDate,
        this.url,
        this.videoId,
        this.paid,
        this.recommended});

  VideoModel.fromJson(Map<String, dynamic> json) {
    courseId = json['courseId'];
    description = json['description'];
    duration = json['duration'];
    ratings = json['ratings'];
    subjectId = json['subjectId'];
    teacherId = json['teacherId'];
    thumbnail = json['thumbnail'];
    title = json['title'];
    uploadDate = json['uploadDate'];
    url = json['url'];
    videoId = json['videoId'];
    paid = json['paid'];
    recommended = json['recommended'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseId'] = this.courseId;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['ratings'] = this.ratings;
    data['subjectId'] = this.subjectId;
    data['teacherId'] = this.teacherId;
    data['thumbnail'] = this.thumbnail;
    data['title'] = this.title;
    data['uploadDate'] = this.uploadDate;
    data['url'] = this.url;
    data['videoId'] = this.videoId;
    data['paid'] = this.paid;
    data['recommended'] = this.recommended;
    return data;
  }

  VideoModel copyWith({
    String? courseId,
    String? description,
    int? duration,
    int? ratings,
    String? subjectId,
    String? teacherId,
    String? thumbnail,
    String? title,
    String? uploadDate,
    String? url,
    String? videoId,
  }) {
    return VideoModel(
      courseId : courseId ?? this.courseId,
      description : description ?? this.description,
      duration : duration ?? this.duration,
    ratings : ratings ?? this.ratings,
    subjectId : subjectId ?? this.subjectId,
    teacherId :  teacherId ?? this.teacherId,
    thumbnail : thumbnail ?? this.thumbnail,
    title :  title ?? this.title,
    uploadDate : uploadDate ?? this.uploadDate,
    url :  url ?? this.url,
    videoId :  videoId ?? this.videoId,
    );
  }
}