//import 'dart:io';
//
//import 'package:test1/Utils/planes_to_file.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:camera/camera.dart';
////import 'package:flutter_qr_reader/flutter_qr_reader.dart';
////import 'package:firebase_ml_vision/firebase_ml_vision.dart';
//
//class QRTest extends StatefulWidget {
//  var cameras;
//  QRTest({this.cameras});
//  @override
//  _QRTestState createState() => _QRTestState();
//}
//
//class _QRTestState extends State<QRTest> {
//  CameraController controller;
//
//  int count=0;
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    controller = CameraController(widget.cameras[0], ResolutionPreset.medium);
//    controller.initialize().then((_) {
//      if (!mounted) {
//        return;
//      }
//      setState(() {});
//    });
//  }
//  @override
//  Widget build(BuildContext context) {
////      print(controller);
//    return Column(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        Center(
//          child: new RaisedButton(onPressed: ()
//        {
//            controller.startImageStream((CameraImage img) async {
//           var testimg=img.toString();
//              print(",mmddkdmdm");
//              var png=await convertYUV420toImageColor(img);
////          String data = await QrCodeToolsPlugin.decodeFrom(png);
//
//
//              File file= File.fromRawPath(png);
//
////             String resp= await FlutterQrReader.imgScan(file);
//              //          file.p
////          FirebaseVisionImage visionImage =FirebaseVisionImage.fromFile(file);
////          var detector = FirebaseVision.instance.barcodeDetector();
////          dynamic results =
////              await detector.detectInImage(visionImage) ?? <dynamic>[];
//
////                File file = File
////          print(resp);
//          count++;
//          if(count>5){
//            print("breaking");
//            controller.stopImageStream();
//          }
////          CameraPreview(controller);
//            });})
//        ),
//        new RaisedButton(onPressed: (){
//          controller.stopImageStream();
//        })
//      ],
//    );
//    }
//
//}
