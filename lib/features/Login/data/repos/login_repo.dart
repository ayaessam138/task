import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:task/core/utilits/failure.dart';

abstract class LoginRepo {
  Future<Either<failure, dynamic>> login({required Map<String, dynamic> body});
}
