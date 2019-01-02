import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class Rpc<T> {
  final String baseurl;
  final String path;
  final Map<String, dynamic> params;

  Rpc({@required this.baseurl, @required this.path, this.params});
}