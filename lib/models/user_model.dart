import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
/// The User class defines a model for a user object with properties such as id, email, name, phone, and
/// photo, and includes methods to check if the object is empty or not.

class User extends Equatable {
  // variable defination

  final String id;
  final String? email;
  final String? name;
  final String? phone;
  final String? photo;
  

 const  User({required this.id, this.email, this.name, this.phone, this.photo});

// creating an empty instance of the user object
  
  static const empty = User(id: '');

// two getters to check if the instances of the user object are empty

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [id, email, name, phone, photo];
}
