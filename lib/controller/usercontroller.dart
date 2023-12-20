
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


class GetUserDataController extends GetxController{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Object?>>> getUserData(String uId)
  async{
    final QuerySnapshot userData = await _firestore.collection('users').where('uId', isEqualTo: uId).get();
    print('day la user');
    print(uId);
    print(userData.docs);
    print(userData);
    return userData.docs;


  }

}