import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddFormDB {
  // define all relevant variables
  final String uid;
  final String title;
  final String date;
  final String priority;
  final String category;
  final String location;
  final String notes;

  // Constructor for class
  const AddFormDB({
    required this.uid,
    required this.title,
    required this.date,
    required this.priority,
    required this.category,
    required this.location,
    required this.notes,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'priority': priority,
        'category': category,
        'location': location,
        'notes': notes,
      };
}
