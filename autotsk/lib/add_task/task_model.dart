import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String uid;
  final String title;
  final String date;
  final String startTime;
  final String endTime;
  final String priority;
  final String location;
  final String notes;

  const TaskModel({
    required this.uid,
    required this.title,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.priority,
    required this.location,
    required this.notes,
  });

  toJson() {
    return {
      "Task ID": uid,
      "Title": title,
      "Date": date,
      "Start Time": startTime,
      "End Time": endTime,
      "Priority": priority,
      "Location": location,
      "Notes": notes,
    };
  }

  // Map tasks fetched from Firebase to fit TaskModel instance
  factory TaskModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return TaskModel(
      uid: doc.id,
      title: data["Title"],
      date: data["Date"],
      startTime: data["Start Time"],
      endTime: data["End Time"],
      priority: data["Priority"],
      location: data["Location"],
      notes: data["Notes"],
    );
  }
}
