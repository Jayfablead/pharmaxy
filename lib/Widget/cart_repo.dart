// import 'dart:convert';
//
// import 'package:ecommerceapp/Modal/AddCartModal.dart';
// import 'package:ecommerceapp/Widget/Const.dart';
// import 'package:hive/hive.dart';
// import 'package:http/http.dart' as http;
//
//
// class EnquiryDataApi {
//   static final cartbox = "userdata";
//   Box enqdataBox = Hive.box(cartbox);
//   postcart( AddCartModal addcartmodal ) async {
//
//     if (enqdataBox.length > 0) {
//
//       for(int  i = 0 ;i<enqdataBox.length ; i++){
//         var enqybox = enqdataBox.getAt(i);
//         AddCartModal enqy = AddCartModal.fromMap(enqybox);
//         String url = "$baseUrl/addtocart";
//         var postresponse = await http.post(
//           Uri.parse(url),
//           headers: {
//             'Authorization': 'hXuRUGsEGuhGf6KG',
//           },
//           body: jsonEncode(enqy.toJson()),
//         );
//         if (postresponse.statusCode == 200) {
//           var apidata = jsonDecode(postresponse.body);
//         }
//       }
//       enqdataBox.clear();
//     }
//
//
//   enquiryoffline(AddCartModal addcartmodal) {
//     var enqurybox = enqdataBox
//         .toMap()
//         .values
//         .toList();
//     var taskMap = addcartmodal.toMap(addcartmodal);
//     enqdataBox.add(taskMap);
//     print(enqdataBox.length);
//   }
//
// }}
