import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreHelper{

  FireStoreHelper(){}


  getStream(){
    Firestore.instance.collection("d").getDocuments();
  }

}