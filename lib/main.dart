import 'package:flutter/material.dart';
import 'package:permission_checker/screens/permissions_screen.dart';

void main(){
  runApp(MaterialApp(
    title: 'Permission Checker',
    home: PermissionsScreen(),
  ));
}