
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryModel {
  String? id ;
  String? title;
  String? image;
  double? rating;
Timestamp? timestamp;

HistoryModel(
    this.id,
    this.title,
    this.image,
    this.rating,
    this.timestamp
    );



Map<String,dynamic> toJson(){
  return {
    // "id" : id,
    "title" : title,
    "image": image,
    "rating":rating,
    "timestamp": timestamp
  };
}
  HistoryModel.fromJson (Map<String,dynamic> json, String docId){
  id = docId ;
  title = json['title'];
  image = json['image'];

  rating = json['rating'] != null
      ? (json['rating'] as num).toDouble()
      : null;
  timestamp = json["timestamp"] as Timestamp? ;
  }
}