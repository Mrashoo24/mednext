import 'package:mednextnew/data/models/quizmodel.dart';

class CompletedQuizModel {
  String? courseId;
  String? date;
  String? id;
  String? subjectId;
  String? topicId;
  String? uid;
  String? teacherId;
  int? rating;
  String? review;
  List<Question>? questionsList;
  String? videoId;

  CompletedQuizModel(
      {this.courseId,
        this.date,
        this.id,
        this.subjectId,
        this.topicId,
        this.uid,
        this.teacherId,this.rating,this.review,this.questionsList,this.videoId});

  CompletedQuizModel.fromJson(Map<String, dynamic> json) {
    courseId = json['courseId'];
    date = json['date'];
    id = json['id'];
    subjectId = json['subjectId'];
    topicId = json['topicId'];
    uid = json['uid'];
    teacherId = json['teacherId'];
    rating = json["rating"];
    review = json["review"];
    videoId = json["videoId"];
    questionsList = json["questionsList"] == null
        ? []
        : List<Question>.from(
        json["questionsList"].map((e) => Question.fromJson(e)).toList()) ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseId'] = this.courseId;
    data['date'] = this.date;
    data['id'] = this.id;
    data['subjectId'] = this.subjectId;
    data['topicId'] = this.topicId;
    data['uid'] = this.uid;
    data['teacherId'] = this.teacherId;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['videoId'] = this.videoId;
    data['questionsList'] = this.questionsList!.map((e) => e.toJson()).toList();
    return data;
  }
}
