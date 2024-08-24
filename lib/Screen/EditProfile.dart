import 'dart:convert';
import 'dart:io';

import 'package:ecommerce/Modal/EditprofileModal.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

ImagePicker picker = ImagePicker();

bool isLoading = true;
bool back = false;

String selected = 'male';

TextEditingController firstname = TextEditingController();
TextEditingController lastname = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController add = TextEditingController();
TextEditingController gender = TextEditingController();

final _formKey = GlobalKey<FormState>();

File? selectedimage = null;

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    viewap();

    setState(() {
      selected = profilemodal?.profileDetails?.userGander == '' ||
              profilemodal?.profileDetails?.userGander == null
          ? ''
          : (profilemodal?.profileDetails?.userGander).toString();
      print(selected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 4.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 25.sp,
                      )),
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: "task",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(null)),
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  child: selectedimage == null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(150),
                          child: Image.network(
                            profilemodal?.profileDetails?.profileimage ?? '',
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(150),
                          child: Image.file(
                            selectedimage!,
                            fit: BoxFit.cover,
                          )),
                ),
                Positioned(
                  top: 79,
                  right: 5,
                  child: GestureDetector(
                      onTap: () async {
                        final XFile? photo =
                            await picker.pickImage(source: ImageSource.gallery);
                        setState(() {
                          selectedimage = File(photo!.path);
                          print(selectedimage);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(2.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 1, color: Colors.white),
                          color: Color(0xfff7941d),
                        ),
                        child: Icon(
                          Icons.add_a_photo_sharp,
                          color: Colors.white,
                          size: 20,
                        ),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 3.5.h,
            ),
            SizedBox(
              width: 90.w,
              child: Row(
                children: [
                  SizedBox(
                    width: 3.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: 90.w,
              child: Row(
                children: [
                  SizedBox(
                    width: 3.w,
                  ),
                  Container(
                    width: 85.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "First Name",
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: "task",
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: firstname,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter The FirstName";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 3.w),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey)),
                            hintText: 'Name',
                            hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 16.sp,
                                fontFamily: "task"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: 90.w,
              child: Row(
                children: [
                  SizedBox(
                    width: 3.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 90.w,
              child: Row(
                children: [
                  SizedBox(
                    width: 3.w,
                  ),
                  Container(
                    width: 85.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Last Name",
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: "task",
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: lastname,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter The LastName";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 3.w),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey)),
                            hintText: 'Name',
                            hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 16.sp,
                                fontFamily: "task"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: 90.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 2.2.w),
                    child: Text(
                      "Gender",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: "task",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: Container(
                      height: 8.h,
                      width: 85.w,
                      child: DropdownButtonFormField(
                        borderRadius: BorderRadius.circular(30),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 3.w),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              borderSide: BorderSide(color: Colors.grey)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                              borderSide: BorderSide(color: Colors.grey)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                              borderSide: BorderSide(color: Colors.grey)),
                          // filled: true,
                          hintStyle: TextStyle(
                              // color: Colors.grey[800]
                              ),
                        ),
                        value: selected,
                        onChanged: (val) {
                          setState(() {
                            selected = val!;
                          });
                        },
                        items: [
                          DropdownMenuItem<String>(
                            child: Text("Select you Gender"),
                            value: "",
                          ),
                          DropdownMenuItem<String>(
                            child: Text("Male"),
                            value: "male",
                          ),
                          DropdownMenuItem<String>(
                            child: Text("Female"),
                            value: "female",
                          )
                        ],
                        // Initialize this variable with the selected value.
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 90.w,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 3.w,
                        ),
                        Container(
                          width: 85.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Phone",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: "task",
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: phone,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter The Number";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 1.h, horizontal: 3.w),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  hintText: 'Phone',
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 16.sp,
                                      fontFamily: "task"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    width: 90.w,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 3.w,
                        ),
                        Container(
                          width: 85.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Address",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: "task",
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: add,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter The Address";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 1.h, horizontal: 3.w),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  hintText: 'Address',
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 16.sp,
                                      fontFamily: "task"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Container(
                      width: 85.w,
                      height: 6.5.h,
                      child: ElevatedButton(
                        onPressed: () {
                          selected != ''
                              ? editap()
                              : buildErrorDialog(context, 'Field Error',
                                  "Please select Gender");
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            backgroundColor: Color(0xfff7941d)),
                        child: Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontFamily: "task"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  editap() {
    final Map<String, String> data = {};
    data['userId'] = usermodal?.userId ?? '';
    data['firstName'] = firstname.text.toString();
    data['lastName'] = lastname.text.toString();
    data['address'] = add.text.toString();
    data['gender'] = selected.toString();
    data['phone'] = phone.text.toString();
    data['email'] = email.text;
    data['city'] = "1";
    data['state'] = "1";
    data['profile_img'] =
        selectedimage?.path == null ? '' : selectedimage?.path ?? "";
    checkInternet().then((internet) async {
      print('hello');
      if (internet) {
        authprovider().profileupdateapi(data).then((response) async {
          editprofilemodal =
              EditprofileModal.fromJson(json.decode(response.body));
          print(response.body);
          print(response.statusCode);
          print(editprofilemodal?.status);
          if (response.statusCode == 200 &&
              editprofilemodal?.status == "success") {
            update(context, 'Profile', 'Profile Updated Successfully',
                callback: () {
              Navigator.pop(context);
              setState(() {
                back = true;
              });
              back
                  ? Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ProfilePage()))
                  : null;
            });
            setState(() {
              isLoading = false;
            });
          } else {
            buildErrorDialog(
                context, 'Field Error', editprofilemodal?.message ?? '');
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  viewap() {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().ViewProfile(data).then((response) async {
          profilemodal = ProfileModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && profilemodal?.status == "success") {
            setState(() {
              isLoading = false;
              firstname.text =
                  profilemodal?.profileDetails?.userFirstName ?? "";
              lastname.text = profilemodal?.profileDetails?.userLastName ?? "";
              add.text = profilemodal?.profileDetails?.userAddress ?? "";
              phone.text = profilemodal?.profileDetails?.userPhone ?? "";
              email.text = profilemodal?.profileDetails?.userEmail ?? "";
            });
            print(profilemodal?.status);
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
