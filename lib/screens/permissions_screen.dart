import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({Key? key}) : super(key: key);

  @override
  _PermissionsScreenState createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  var permissionsAccepted = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test App'), centerTitle: true,),
      body: ListView(
        children: [
          Row(
            children: [
              Expanded(child: Text('Storage', style: TextStyle(fontSize: 30.0),)),
              Expanded(child: Text(permissionsAccepted.contains('storage') ? 'true' : 'false',
              style: TextStyle(fontSize: 20.0),),),
            ],
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getPermissions();
    getPermissionStatus();

  }

  Future<void> getPermissions() async{
    Map<Permission, PermissionStatus> status = await[
      Permission.storage,
      Permission.camera,
      Permission.location,
      Permission.bluetooth,
      Permission.sms,
      Permission.microphone,
      Permission.notification
    ].request();
  }
  Future<void> getPermissionStatus() async{
    if(await Permission.storage.isGranted){
      permissionsAccepted.add('storage');
    }
    if(await Permission.camera.isGranted){
      permissionsAccepted.add('camera');
    }
    if(await Permission.location.isGranted){
      permissionsAccepted.add('location');
    }
    if(await Permission.bluetooth.isGranted){
      permissionsAccepted.add('storage');
    }
    if(await Permission.sms.isGranted){
      permissionsAccepted.add('sms');
    }
    if(await Permission.microphone.isGranted){
      permissionsAccepted.add('microphone');
    }
    if(await Permission.notification.isGranted){
      permissionsAccepted.add('notification');
    }
    setState(() {
    });
  }
}
