import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:test1/Models/config.dart';
import 'package:test1/Values/colors.dart';
import 'package:dio/dio.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
//import 'face_qr_detector.dart';
//import 'camera_file.dart' as cam;
import 'package:flutter_camera_ml_vision/flutter_camera_ml_vision.dart';
class QrReader extends StatefulWidget {
  String name,venue,time;
  QrReader({this.name,this.venue,this.time});
  @override
  _QrReaderState createState() => _QrReaderState();
}

class _QrReaderState extends State<QrReader> {
  GlobalKey<_QrReaderState> key=new GlobalKey();
//  GlobalKey<QrcodeReaderViewState> qrViewKey = GlobalKey();
  bool barCode=false;
//  QRReaderController controller;
  dynamic widget1= new Container();
  Widget wid=new Container();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 3),(){
//      Scaffold.of(key.currentState.context).showSnackBar(new SnackBar(content: new Text("Now Scan Face")));
    });
//    qrViewKey.currentState.startScan();
//    print(Config.cameras);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: new AppBar(backgroundColor: Colors.white,elevation: 0,iconTheme: IconThemeData(color: Colors.black),),
      body: Column(

        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:20.0,bottom: 40),
                child: new Text("Good Job",style: TextStyle(fontSize: 32,color: themeColor),),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top:90.0),
                    child: SizedBox(
                      width: 300,
                     height: 300,
                     child: (barCode)?CameraMlVision<List<Face>>(
                       cameraLensDirection: CameraLensDirection.front,
                        resolution: ResolutionPreset.medium,
                       detector:(image1) => FirebaseVision.instance.faceDetector().processImage(image1),
                       onResult: (List<Face> barcodes) async {

                       if(barcodes.length>0)
                       {

                         // print(barcodes.keys.toList());
//                         File file=barcodes["image"];

                         // FirebaseVisionImage image=barcodes['image'];

//                         print(image.bytes);
//                         String base64=base64Encode(image.bytes);
//
//                         Dio dio = new Dio();
//                         dio.post("http://192.168.43.69:5000/test",data: {"base64img":image.bytes});
////                         var resp =Dio().post("192.168.43.69:5000/test",data: {"base64img":1});


                          Future.delayed(Duration(seconds: 1),(){
                            Navigator.pop(context); 
                          });
                       }
                         if (!mounted || true) {
                           return;
                         }
                       },
                     ):CameraMlVision<List<Barcode>>(
                       detector: FirebaseVision.instance.barcodeDetector().detectInImage,
                       onResult: (List<Barcode> barcodes) {

                         if (!mounted ) {
                           return;
                         }
                         print(barcodes);
                         if (barcodes.isNotEmpty)
                           {
                             var barcode  =barcodes[0];
                             print(barcode.displayValue);
                             print(barcode.valueType);
                             print(barcode);
                             print(barcode.toString());
                             if (barcode.displayValue == "12341234444444444456788991234123444444444445678899")
                               {
                                 setState(() {
                                   barCode = true;
                                 });
                               }
                           }
                         setState(() {
                           // barCode=true;

                         });
                         },
                     )
                    ),
                  ),
                ),
              ),
              widget1,
            ],
          ),
          wid
        ],
      ),

    );
  }
}
