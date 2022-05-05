import 'package:flutter/material.dart';

extension MyContext on BuildContext{
  MediaQueryData get mq=>MediaQuery.of(this);
  double get he=>mq.size.height;
}