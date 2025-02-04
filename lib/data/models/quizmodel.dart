class QuizModel {
  String? courseId;
  String? description;
  int? questions;
  int? ratings;
  String? subjectId;
  String? teacherId;
  String? thumbnail;
  String? title;
  String? uploadDate;
  String? url;
  String? videoId;
  String? quizId;
  bool? paid;
  bool? recommended;
  String? topicId;
  int? totalRating;
  List<String>? slides;
  String? notes_pdf;
  List<Question>? questionsList;

  QuizModel(
      {this.courseId,
      this.description,
      this.questions,
      this.ratings,
      this.subjectId,
      this.teacherId,
      this.thumbnail,
      this.title,
      this.uploadDate,
      this.url,
      this.videoId,
      this.paid,
      this.recommended,
      this.topicId,
      this.totalRating,
      this.slides,
      this.notes_pdf,
      this.questionsList,
      this.quizId});

  QuizModel.fromJson(Map<String, dynamic> json) {
    courseId = json['courseId'];
    description = json['description'];
    questions = json['questions'];
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
    topicId = json["topicId"];
    totalRating = json["totalRating"];
    notes_pdf = json["notes_pdf"];
    slides = json["slides"] == null
        ? []
        : List<String>.from(json["slides"].map((e) => e).toList());
    quizId = json["quizId"];
    questionsList = json["questionsList"] == null
        ? []
        : List<Question>.from(
            json["questionsList"].map((e) => Question.fromJson(e)).toList());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseId'] = this.courseId;
    data['description'] = this.description;
    data['questions'] = this.questions;
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
    data["topicId"] = this.topicId;
    data["totalRating"] = this.totalRating;
    data["slides"] = this.slides;
    data["notes_pdf"] = this.notes_pdf;
    data["quizId"] = this.quizId;
    data["questionsList"] = this.questionsList;

    return data;
  }

  QuizModel copyWith(
      {String? courseId,
      String? description,
      int? questions,
      int? ratings,
      String? subjectId,
      String? teacherId,
      String? thumbnail,
      String? title,
      String? uploadDate,
      String? url,
      String? videoId,
      String? topicId,
      int? totalRating,
      bool? paid,
      List<String>? slides,
      String? notes_pdf,
      List<Question>? questionsList,
      String? quizId}) {
    return QuizModel(
        courseId: courseId ?? this.courseId,
        description: description ?? this.description,
        questions: questions ?? this.questions,
        ratings: ratings ?? this.ratings,
        subjectId: subjectId ?? this.subjectId,
        teacherId: teacherId ?? this.teacherId,
        thumbnail: thumbnail ?? this.thumbnail,
        title: title ?? this.title,
        uploadDate: uploadDate ?? this.uploadDate,
        url: url ?? this.url,
        videoId: videoId ?? this.videoId,
        paid: paid ?? this.paid,
        topicId: topicId ?? this.topicId,
        totalRating: totalRating ?? this.totalRating,
        slides: slides ?? this.slides,
        notes_pdf: notes_pdf ?? this.notes_pdf,
        questionsList: questionsList ?? this.questionsList,
        quizId: quizId ?? this.quizId


    );
  }
}

class Question {
  String? questionId;
  String? questionText;
  List<String>? options;
  String? correctAnswer;
  String? quizId;
  bool? isCorrect = false;
  String? selectedAnswer;

  Question(
      {this.questionId, this.questionText, this.options, this.correctAnswer,this.quizId,this.isCorrect,this.selectedAnswer});

  Question.fromJson(Map<String, dynamic> json) {
    questionId = json['questionId'];
    questionText = json['questionText'];
    options = json['options'] == null
        ? []
        : List<String>.from(json['options'].map((e) => e).toList());
    correctAnswer = json['correctAnswer'];
    quizId = json["quizId"];
    isCorrect = json["isCorrect"];
    selectedAnswer = json["selectedAnswer"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionId'] = this.questionId;
    data['questionText'] = this.questionText;
    data['options'] = this.options;
    data['correctAnswer'] = this.correctAnswer;
    data["quizId"] = this.quizId;
    data["isCorrect"] = this.isCorrect;
    data["selectedAnswer"] = this.selectedAnswer;
    return data;
  }
}
