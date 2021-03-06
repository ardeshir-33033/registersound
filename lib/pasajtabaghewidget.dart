import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:register/Models/BrandModel.dart';
import 'Box/smallBox.dart';
import 'Business/ProfileService.dart';
import 'Component/audioPlayer.dart';
import 'Component/googleMapComponent.dart';
import 'Models/ContactModel.dart';
import 'Models/PersonVM.dart';
import 'Models/Response.dart';
import 'Service/EndPointService.dart';
import 'Widgets/Reccoding.dart';

class PasajTabagheWidget extends StatefulWidget {
  PasajTabagheWidget({this.user, this.title});

  int user;
  final String title;
  bool tap1 = false;

  @override
  _PasajTabagheWidget createState() => _PasajTabagheWidget();
}

class _PasajTabagheWidget extends State<PasajTabagheWidget> {
  PersonVM person;

  String floor;
  String No;
  String passage;
  String storeName;
  String fullname;
  String Raste;
  String car;
  String jobType;
  String importBrand;
  String personalBrand;
  Position position;
  var _controller1 = TextEditingController();
  var _controller2 = TextEditingController();
  var _controller3 = TextEditingController();
  var _controller4 = TextEditingController();

  String dropdownValue;
  String dropdownValue1;
  String dropdownValue2;
  String dropdownValue3;
  String dropdownValue4;
  String dropdownValue5;
  String dropdownValue6;
  String dropdownValue7;
  String dropdownValue8;
  int boxItemCount = 1;

  int checkedValue = 1;
  bool checkedValue1 = false;
  bool checkedValue2 = false;
  bool checkedValue3 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          //بابت فیلد چراغ برق و ...
          child: Column(children: [
        Container(
          margin: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    child: Text('چراغ برق'),
                  ),
                ],
              ),
              SizedBox(
                width: 50,
              ),
              Container(child: Text('اطراف تهران')),
              SizedBox(
                width: 50,
              ),
              Container(child: Text('شهرستان')),
              SizedBox(
                width: 50,
              ),
              Container(child: Text('تعمیرگاه'))
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        //سرچ باکس
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controller1,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(5.0),
              ),
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              border: InputBorder.none,
              prefixIcon: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.string(
                    _svg_8sw3lm,
                    fit: BoxFit.fill,
                    width: 2,
                    height: 2,
                  ),
                ),
              ),
            ),
          ),
        ),

        //باکس طبقه و پاساژ
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "پاساژ",
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          // child: Text(
                          //   ":",
                          // ),
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: Row(
                              children: [
                                SizedBox(
                                  width: 110,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: SvgPicture.string(_svg_m7ofv4),
                                ),
                              ],
                            ),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.deepPurple),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                                passage = newValue;
                              });
                            },
                            items: <String>['1', '2', '3', '4']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),

                        // Container(
                        //   padding: EdgeInsets.all(5.0),
                        //   child: Text(
                        //     "امیران",
                        //   ),
                        // ),
                      ],
                    )
                    // list
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Divider(
                  height: 1.0,
                  thickness: 1.0,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "طبقه",
                              ),
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: dropdownValue1,
                                icon: Row(
                                  children: [
                                    SizedBox(
                                      width: 110,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: SvgPicture.string(_svg_m7ofv4),
                                    ),
                                  ],
                                ),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: Colors.deepPurple),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue1 = newValue;
                                    floor = newValue;
                                  });
                                },
                                items: <String>[
                                  '1',
                                  '2',
                                  '3',
                                  '4'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // باکس پلاک و نام فروشگاه
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "پلاک",
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 200,
                          child: TextField(
                            controller: _controller2,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    )
                    // list
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Divider(
                  height: 1.0,
                  thickness: 1.0,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text(
                                "نام فروشگاه",
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 200,
                              child: TextField(
                                controller: _controller3,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //باکس نام و نام خانوادگی
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "نام و نام خانوادگی",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 200,
                      child: TextField(
                        controller: _controller4,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Divider(
                    height: 1.0,
                    thickness: 1.0,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "رسته",
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(5.0),
                            // child: Text(
                            //   ":",
                            // ),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: dropdownValue7,
                              icon: Row(
                                children: [
                                  SizedBox(
                                    width: 110,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: SvgPicture.string(_svg_m7ofv4),
                                  ),
                                ],
                              ),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(color: Colors.deepPurple),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue7 = newValue;
                                });
                              },
                              items: <String>[
                                '1',
                                '2',
                                '3',
                                '4'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      )
                      // list
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Divider(
                    height: 1.0,
                    thickness: 1.0,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  "خودرو",
                                ),
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: dropdownValue3,
                                  icon: Row(
                                    children: [
                                      SizedBox(
                                        width: 110,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: SvgPicture.string(_svg_m7ofv4),
                                      ),
                                    ],
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(color: Colors.deepPurple),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue3 = newValue;
                                    });
                                  },
                                  items: <String>['1', '2', '3', '4']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 38,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('نوع فعالیت'),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownValue4,
                  icon: Row(
                    children: [
                      SizedBox(
                        width: 110,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: SvgPicture.string(_svg_m7ofv4),
                      ),
                    ],
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue4 = newValue;
                    });
                  },
                  items: <String>['1', '2', '3', '4']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 38,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('برند وارداتی'),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownValue5,
                  icon: Row(
                    children: [
                      SizedBox(
                        width: 110,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: SvgPicture.string(_svg_m7ofv4),
                      ),
                    ],
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue5 = newValue;
                    });
                  },
                  items: <String>['1', '2', '3', '4']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: BrandList.length,
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (BuildContext, int index) {
                  return Container(
                    height: 38,
                    width: MediaQuery.of(context).size.width / 4,
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: BrandBuild(
                      index: index,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: 130,
              height: 30,
            ),
            GestureDetector(
              child: SvgPicture.asset('assets/images/plus.svg'),
              onTap: () {
                return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        content: SmallBox(),
                      );
                    });
              },
            ),
          ],
        ),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(5.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), color: Colors.white),
            child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 38,
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                //آیکون سرچ
                child: SvgPicture.string(
                  _svg_8sw3lm,
                  alignment: Alignment.bottomLeft,
                  width: 15,
                  height: 15,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(10.0),
                child: Column(children: [
                  RadioListTile(
                    title: Text("دایدو"),
                    value: checkedValue == 1 ? true : false,
                    groupValue: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = 1;
                      });
                    },
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  RadioListTile(
                    title: Text("تایهو"),
                    value: checkedValue == 2 ? true : false,
                    groupValue: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = 2;
                      });
                    },
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  RadioListTile(
                    title: Text("فوجی"),
                    value: checkedValue == 3 ? true : false,
                    groupValue: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = 3;
                      });
                    },
                  ),
                ]),
              ),
            ]),
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text("برند شخصی"),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownValue8,
                  icon: Row(
                    children: [
                      SizedBox(
                        width: 110,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: SvgPicture.string(_svg_m7ofv4),
                      ),
                    ],
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue8 = newValue;
                    });
                  },
                  items: <String>['1', '2', '3', '4']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width,
          height: 38,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),

          //آیکون سرچ
        ),
        Container(
          child: Row(
            children: [
              Container(
                width: 300,
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: boxItemCount,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (BuildContext, int index) {
                    return Container(
                      height: 38,
                      width: MediaQuery.of(context).size.width / 4,
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    boxItemCount = boxItemCount + 1;
                  });
                },
                child: SvgPicture.asset('assets/images/plus.svg'),
              ),
              // SvgPicture.string(
              //   _svg_m7ofv4,
              // )
            ],
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 38,
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            //آیکون سرچ
            child: Text('بارگذاری عکس کارت ویزیت')),
        //ردیف دارای آیکوت دوربین
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          content: new SingleChildScrollView(
                            child: new ListBody(
                              children: <Widget>[
                                GestureDetector(
                                  child: new Text('گرفتن عکس'),
                                  onTap: () =>
                                      EndPointService().getImageFromCamera(
                                          //person?.id ??
                                          0,
                                          "image"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(20.0),
                                ),
                                GestureDetector(
                                  child: new Text('انتخاب از گالری'),
                                  onTap: () =>
                                      EndPointService().getImageFromGallery(
                                          //person?.id ??
                                          0,
                                          "image"),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width / 5,
                  // margin: EdgeInsets.all(10.0),
                  // padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/camera.svg',
                    width: 20,
                    fit: BoxFit.cover,
                    height: 20,
                  ),
                ),
              ),
              SizedBox(
                width: 175,
              ),
              Container(
                height: 38,
                width: MediaQuery.of(context).size.width / 8,
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: RecorderExample(
                  id: 0,
                ),
              ),
            ],
          ),
        ),
            AudioPlayer1(),
        Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          child: googleMapComponent(
            myLocation: true,
          ),
        ),
        //دکمه ثبت
        RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: Colors.red)),
          color: Color(0xffeb5151),
          onPressed: () async {
            _controller1.clear();
            _controller2.clear();
            _controller3.clear();
            _controller4.clear();

            PersonVM data = PersonVM(
                fname: fullname,
                nickname: fullname,
                jobId: 'Mechanic',
                //widget.user.toString(),
                creatorId: 10,
                //ProfileService().GetUserData().id,
                contacts: [
                  ContactModel(contactTypeId: "City", value: 'rrffrr'),
                  ContactModel(contactTypeId: "State", value: 'ijijo'),
                  ContactModel(contactTypeId: "Passage", value: 'nihuh'),
                  ContactModel(contactTypeId: "Namayeshgah", value: 'iuhuhi'),
                  ContactModel(contactTypeId: "Tel", value: '49877'),
                  ContactModel(contactTypeId: "Mobile", value: '646846'),
                  ContactModel(contactTypeId: "Address", value: 'jiojij'),
                  // ContactModel(contactTypeId: "floor", value: floor),
                  // ContactModel(contactTypeId: "No", value: No),
                  // ContactModel(contactTypeId: "Passage", value: passage),
                  // ContactModel(contactTypeId: "storeName", value: storeName),
                  // ContactModel(contactTypeId: "fullName", value: fullname),
                  // ContactModel(contactTypeId: "Raste", value: Raste),
                  // ContactModel(contactTypeId: "jobType", value: jobType),
                  // ContactModel(contactTypeId: "car", value: car),
                  // ContactModel(contactTypeId: "importBrand", value: importBrand),
                  // ContactModel(contactTypeId: "personalBrand", value: personalBrand),
                ]);

            if (position != null) {
              data.contacts.add(ContactModel(
                  contactTypeId: "LocationManual",
                  value: position.latitude.toString() +
                      ", " +
                      position.longitude.toString()));
            }

            String json = jsonEncode(data.toJson());

            ResponseModel response = await EndPointService()
                .setupApi("Person", "SetPerson", []).whttpPost(
              json,
              HeaderEnum.BasicHeaderEnum,
              ResponseEnum.ResponseModelEnum,
            );

            if (response.isSuccess) {
              var res = PersonVM.fromJson(response.data);

              if (res != null) {
                person = res;
                return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        content: new SingleChildScrollView(
                          padding: const EdgeInsets.only(right: 0),
                          child: Center(
                            child: Text('اطلاعات شما با موفقیت ثبت شد'),
                          ),
                        ),
                      );
                    });
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Test()));
              }
            }
          },
          textColor: Colors.white,
          child: Text(
            "ثبت",
          ),
        ),
      ])),
    ));
  }

  Widget imagePreviewer() {
    setState(() {
      bool depe;
      if (imagePreview == null) {
        depe = false;
      } else
        depe = true;
      return depe ? Image(image: imagePreview) : Text('data');
    });
  }
}

//آیکون سرچ

const String _svg_8sw3lm =
    '<svg viewBox="9.8 6.0 19.4 19.4" ><path transform="translate(1333.79, 90.46)" d="M -1305.815185546875 -65.26988220214844 L -1310.534423828125 -69.98625946044922 C -1311.9599609375 -68.78908538818359 -1313.797729492188 -68.06724548339844 -1315.800415039063 -68.06724548339844 C -1320.321044921875 -68.06724548339844 -1324 -71.74378204345703 -1324 -76.26252746582031 C -1324 -80.78226470947266 -1320.322021484375 -84.45780181884766 -1315.800415039063 -84.45780181884766 C -1311.279663085938 -84.45780181884766 -1307.601806640625 -80.78126525878906 -1307.601806640625 -76.26252746582031 C -1307.601806640625 -74.26240539550781 -1308.322509765625 -72.42717742919922 -1309.51806640625 -71.00285339355469 L -1304.802001953125 -66.28892517089844 C -1304.546875 -66.04415893554688 -1304.520629882813 -65.61956024169922 -1304.743774414063 -65.33982086181641 C -1304.761962890625 -65.31684112548828 -1304.78125 -65.29486083984375 -1304.802001953125 -65.27487945556641 C -1304.941528320313 -65.13901519775391 -1305.122802734375 -65.06407928466797 -1305.309448242188 -65.06607818603516 L -1305.30859375 -65.06008148193359 C -1305.311157226563 -65.06005096435547 -1305.3134765625 -65.06004333496094 -1305.31591796875 -65.06004333496094 C -1305.5 -65.06004333496094 -1305.677734375 -65.13479614257813 -1305.815185546875 -65.26988220214844 Z M -1322.566040039063 -76.26252746582031 C -1322.566040039063 -72.53403472900391 -1319.53125 -69.50090026855469 -1315.800415039063 -69.50090026855469 C -1313.9873046875 -69.50090026855469 -1312.338745117188 -70.21758270263672 -1311.123413085938 -71.38240814208984 C -1311.113037109375 -71.39763641357422 -1311.102416992188 -71.41256713867188 -1311.091186523438 -71.42707824707031 C -1311.071166992188 -71.45205688476563 -1311.049194335938 -71.47502899169922 -1311.026489257813 -71.49701690673828 C -1310.99462890625 -71.52769470214844 -1310.961181640625 -71.55502319335938 -1310.92626953125 -71.57897186279297 C -1309.756713867188 -72.79499053955078 -1309.036743164063 -74.44629669189453 -1309.036743164063 -76.26252746582031 C -1309.036743164063 -79.99100494384766 -1312.0712890625 -83.02415466308594 -1315.800415039063 -83.02415466308594 C -1319.5302734375 -83.02415466308594 -1322.566040039063 -79.99100494384766 -1322.566040039063 -76.26252746582031 Z M -1321.056396484375 -75.37835693359375 C -1321.2021484375 -76.87294769287109 -1320.680053710938 -78.35155487060547 -1319.6552734375 -79.34961700439453 C -1319.365356445313 -79.62934875488281 -1318.931762695313 -79.62934875488281 -1318.641235351563 -79.34961700439453 C -1318.386108398438 -79.10485076904297 -1318.359619140625 -78.68024444580078 -1318.582885742188 -78.40050506591797 C -1318.60107421875 -78.37752532958984 -1318.620239257813 -78.35555267333984 -1318.641235351563 -78.3355712890625 C -1319.366333007813 -77.62824249267578 -1319.735229492188 -76.57923126220703 -1319.630615234375 -75.52122497558594 C -1319.605834960938 -75.11460113525391 -1319.886474609375 -74.76393890380859 -1320.25732421875 -74.73795318603516 L -1320.272705078125 -74.73596954345703 L -1320.3447265625 -74.73596954345703 L -1320.343872070313 -74.73297119140625 C -1320.352416992188 -74.73262786865234 -1320.361206054688 -74.73246002197266 -1320.369506835938 -74.73246002197266 C -1320.711303710938 -74.73245239257813 -1321.003784179688 -75.00498962402344 -1321.056396484375 -75.37835693359375 Z" fill="#7b7b7b" stroke="#000000" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_uo6bsg =
    '<svg viewBox="0.0 0.0 70.0 48.6" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 70.0, 48.62)" d="M 28.50740051269531 9.018816947937012 C 31.69990539550781 4.584134101867676 38.30009460449219 4.584134101867676 41.49259948730469 9.018816947937012 L 60.87606811523438 35.94423294067383 C 64.68568420410156 41.23613739013672 60.90400695800781 48.61821746826172 54.38346099853516 48.61821746826172 L 15.61653614044189 48.61821746826172 C 9.095993041992188 48.61821746826172 5.314320087432861 41.23613739013672 9.123937606811523 35.94423294067383 Z" fill="#eb5151" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hdr6s2 =
    '<svg viewBox="364.7 92.2 21.3 19.4" ><path transform="translate(1688.73, 176.68)" d="M -1304.058715820313 -65.26988220214844 L -1309.233764648438 -69.98625946044922 C -1310.797119140625 -68.78908538818359 -1312.812255859375 -68.06724548339844 -1315.008422851563 -68.06724548339844 C -1319.965698242188 -68.06724548339844 -1323.999877929688 -71.74378204345703 -1323.999877929688 -76.26252746582031 C -1323.999877929688 -80.78226470947266 -1319.966674804688 -84.45780181884766 -1315.008422851563 -84.45780181884766 C -1310.051025390625 -84.45780181884766 -1306.017822265625 -80.78126525878906 -1306.017822265625 -76.26252746582031 C -1306.017822265625 -74.26240539550781 -1306.808349609375 -72.42717742919922 -1308.119262695313 -71.00285339355469 L -1302.94775390625 -66.28892517089844 C -1302.66796875 -66.04415893554688 -1302.63916015625 -65.61956024169922 -1302.883911132813 -65.33982086181641 C -1302.90380859375 -65.31684112548828 -1302.9248046875 -65.29486083984375 -1302.94775390625 -65.27487945556641 C -1303.100708007813 -65.13901519775391 -1303.299438476563 -65.06407928466797 -1303.504150390625 -65.06607818603516 L -1303.503295898438 -65.06008148193359 C -1303.505981445313 -65.06005096435547 -1303.508544921875 -65.06004333496094 -1303.51123046875 -65.06004333496094 C -1303.713134765625 -65.06004333496094 -1303.907836914063 -65.13479614257813 -1304.058715820313 -65.26988220214844 Z M -1322.427490234375 -76.26252746582031 C -1322.427490234375 -72.53403472900391 -1319.099609375 -69.50090026855469 -1315.008422851563 -69.50090026855469 C -1313.020263671875 -69.50090026855469 -1311.21240234375 -70.21758270263672 -1309.879516601563 -71.38240814208984 C -1309.868408203125 -71.39763641357422 -1309.856689453125 -71.41256713867188 -1309.84423828125 -71.42707824707031 C -1309.822265625 -71.45205688476563 -1309.79833984375 -71.47502899169922 -1309.7734375 -71.49701690673828 C -1309.738525390625 -71.52769470214844 -1309.70166015625 -71.55502319335938 -1309.663452148438 -71.57897186279297 C -1308.380981445313 -72.79499053955078 -1307.591430664063 -74.44629669189453 -1307.591430664063 -76.26252746582031 C -1307.591430664063 -79.99100494384766 -1310.919189453125 -83.02415466308594 -1315.008422851563 -83.02415466308594 C -1319.098510742188 -83.02415466308594 -1322.427490234375 -79.99100494384766 -1322.427490234375 -76.26252746582031 Z M -1320.77197265625 -75.37835693359375 C -1320.931884765625 -76.87294769287109 -1320.359375 -78.35155487060547 -1319.235473632813 -79.34961700439453 C -1318.917724609375 -79.62934875488281 -1318.442260742188 -79.62934875488281 -1318.12353515625 -79.34961700439453 C -1317.84375 -79.10485076904297 -1317.814697265625 -78.68024444580078 -1318.0595703125 -78.40050506591797 C -1318.079467773438 -78.37752532958984 -1318.100463867188 -78.35555267333984 -1318.12353515625 -78.3355712890625 C -1318.918701171875 -77.62824249267578 -1319.3232421875 -76.57923126220703 -1319.208374023438 -75.52122497558594 C -1319.181396484375 -75.11460113525391 -1319.489135742188 -74.76393890380859 -1319.895751953125 -74.73795318603516 L -1319.912719726563 -74.73596954345703 L -1319.99169921875 -74.73596954345703 L -1319.99072265625 -74.73297119140625 C -1320.000122070313 -74.73262786865234 -1320.009521484375 -74.73246002197266 -1320.018676757813 -74.73246002197266 C -1320.3935546875 -74.73245239257813 -1320.71435546875 -75.00498962402344 -1320.77197265625 -75.37835693359375 Z" fill="#7b7b7b" stroke="#000000" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_umtekq =
    '<svg viewBox="-161.3 100.0 13.1 9.0" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, -148.21, 109.0)" d="M 5.749825954437256 1.109143137931824 C 6.149224758148193 0.5610228776931763 6.966825008392334 0.5610228180885315 7.366223335266113 1.109143137931824 L 11.95826148986816 7.41109037399292 C 12.43981552124023 8.071958541870117 11.9677677154541 9 11.15006160736084 9 L 1.965988397598267 9 C 1.148283004760742 9 0.6762350797653198 8.071958541870117 1.157789826393127 7.41109037399292 Z" fill="#eb5151" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e3xmt2 =
    '<svg viewBox="-172.9 80.0 365.9 1.0" ><path transform="translate(-409.93, -4.51)" d="M 237 84.50607299804688 L 602.8571166992188 84.50607299804688" fill="none" stroke="#b4b4b4" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_codpgb =
    '<svg viewBox="-160.8 52.0 13.1 9.0" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, -147.71, 61.0)" d="M 5.749825954437256 1.109143137931824 C 6.149224758148193 0.5610228776931763 6.966825008392334 0.5610228180885315 7.366223335266113 1.109143137931824 L 11.95826148986816 7.41109037399292 C 12.43981552124023 8.071958541870117 11.9677677154541 9 11.15006160736084 9 L 1.965988397598267 9 C 1.148283004760742 9 0.6762350797653198 8.071958541870117 1.157789826393127 7.41109037399292 Z" fill="#eb5151" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ci23ed =
    '<svg viewBox="-172.9 193.0 365.9 1.0" ><path transform="translate(-409.93, 108.49)" d="M 237 84.50607299804688 L 602.8571166992188 84.50607299804688" fill="#ffffff" stroke="#b4b4b4" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_airtea =
    '<svg viewBox="83.9 161.5 1.0 16.0" ><path transform="translate(83.93, 161.5)" d="M 0 0 L 0 16" fill="none" stroke="#cccccc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_v8365p =
    '<svg viewBox="-160.8 372.0 13.1 9.0" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, -147.71, 381.0)" d="M 5.749825954437256 1.109143137931824 C 6.149224758148193 0.5610228776931763 6.966825008392334 0.5610228180885315 7.366223335266113 1.109143137931824 L 11.95826148986816 7.41109037399292 C 12.43981552124023 8.071958541870117 11.9677677154541 9 11.15006160736084 9 L 1.965988397598267 9 C 1.148283004760742 9 0.6762350797653198 8.071958541870117 1.157789826393127 7.41109037399292 Z" fill="#eb5151" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_7q95wf =
    '<svg viewBox="-172.9 352.0 365.9 1.0" ><path transform="translate(-409.93, 267.49)" d="M 237 84.50607299804688 L 602.8571166992188 84.50607299804688" fill="none" stroke="#cacaca" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_p50phh =
    '<svg viewBox="-160.8 324.0 13.1 9.0" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, -147.71, 333.0)" d="M 5.749825954437256 1.109143137931824 C 6.149224758148193 0.5610228776931763 6.966825008392334 0.5610228180885315 7.366223335266113 1.109143137931824 L 11.95826148986816 7.41109037399292 C 12.43981552124023 8.071958541870117 11.9677677154541 9 11.15006160736084 9 L 1.965988397598267 9 C 1.148283004760742 9 0.6762350797653198 8.071958541870117 1.157789826393127 7.41109037399292 Z" fill="#eb5151" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_z3qtjl =
    '<svg viewBox="-172.9 304.0 365.9 1.0" ><path transform="translate(-409.93, 219.49)" d="M 237 84.50607299804688 L 602.8571166992188 84.50607299804688" fill="none" stroke="#cacaca" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_p18y12 =
    '<svg viewBox="-163.3 435.0 13.2 9.0" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, -150.14, 444.0)" d="M 5.770115852355957 1.104724049568176 C 6.169589042663574 0.5581231713294983 6.985377311706543 0.5581231713294983 7.384850025177002 1.104724049568176 L 11.99290943145752 7.409951210021973 C 12.4757776260376 8.070661544799805 12.0038948059082 9 11.18554210662842 9 L 1.969425201416016 9 C 1.15107250213623 9 0.6791895627975464 8.070661544799805 1.162057995796204 7.409951210021973 Z" fill="#eb5151" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xh9cb9 =
    '<svg viewBox="0.0 0.0 381.8 48.0" ><path  d="M 8.066978454589844 0 L 373.7229919433594 0 C 378.1782836914063 0 381.7900085449219 3.581721782684326 381.7900085449219 8 L 381.7900085449219 40 C 381.7900085449219 44.41827774047852 378.1782836914063 48 373.7229919433594 48 L 8.066978454589844 48 C 3.611709117889404 48 0 44.41827774047852 0 40 L 0 8 C 0 3.581721782684326 3.611709117889404 0 8.066978454589844 0 Z" fill="#ffffff" stroke="none" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xbkfx8 =
    '<svg viewBox="17.6 19.0 13.2 9.0" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 30.77, 28.0)" d="M 5.775436878204346 1.103569388389587 C 6.174929141998291 0.5573662519454956 6.990242958068848 0.5573662519454956 7.389734745025635 1.103569388389587 L 12.00199413299561 7.409652233123779 C 12.48520660400391 8.070322036743164 12.01336765289307 9 11.19484519958496 9 L 1.970327019691467 9 C 1.151804685592651 9 0.6799651384353638 8.070322036743164 1.163177847862244 7.409652233123779 Z" fill="#eb5151" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_73o9a4 =
    '<svg viewBox="0.0 0.0 34.7 27.3" ><path transform="translate(-161.87, -191.18)" d="M 192.6919555664063 194.2866973876953 L 187.2147521972656 194.2866973876953 L 187.2147521972656 194.2205352783203 C 187.2147521972656 193.3956756591797 186.8847351074219 192.6036987304688 186.3241577148438 192.0760040283203 L 186.3241577148438 192.0760040283203 C 185.7631530761719 191.5150146484375 185.0040588378906 191.1849822998047 184.17919921875 191.1849822998047 L 174.2810363769531 191.1849822998047 C 173.4228820800781 191.1849822998047 172.6641998291016 191.5150146484375 172.1032104492188 192.0760040283203 L 172.1032104492188 192.0760040283203 C 171.5421905517578 192.6370239257813 171.2126007080078 193.3956756591797 171.2126007080078 194.2205352783203 L 171.2126007080078 194.2866973876953 L 165.7682647705078 194.2866973876953 C 164.6795654296875 194.2866973876953 163.7227935791016 194.7153472900391 163.0298767089844 195.4415740966797 C 162.3369445800781 196.1340789794922 161.875 197.1241455078125 161.875 198.1799774169922 L 161.875 214.6112060546875 C 161.875 215.6998901367188 162.3040771484375 216.6571044921875 163.0298767089844 217.3500366210938 C 163.7227935791016 218.0425262451172 164.7124481201172 218.5044708251953 165.7682647705078 218.5044708251953 L 192.6919555664063 218.5044708251953 C 193.7806854248047 218.5044708251953 194.7374572753906 218.0758361816406 195.4303741455078 217.3500366210938 C 196.123291015625 216.6571044921875 196.5852508544922 215.6670227050781 196.5852508544922 214.6112060546875 L 196.5852508544922 198.1799774169922 C 196.5852508544922 197.0912780761719 196.1565856933594 196.1340789794922 195.4303741455078 195.4415740966797 C 194.7374572753906 194.7153472900391 193.7806854248047 194.2866973876953 192.6919555664063 194.2866973876953 Z M 194.8364868164063 214.6112060546875 C 194.8364868164063 215.2050628662109 194.6055145263672 215.7332000732422 194.2097473144531 216.1289825439453 C 193.8139953613281 216.5247344970703 193.2858581542969 216.7557067871094 192.6919555664063 216.7557067871094 L 165.7682647705078 216.7557067871094 C 165.1743774414063 216.7557067871094 164.6466979980469 216.5247344970703 164.2504730224609 216.1289825439453 C 163.8547210693359 215.7332000732422 163.6237335205078 215.2050628662109 163.6237335205078 214.6112060546875 L 163.6237335205078 198.1799774169922 C 163.6237335205078 197.5861053466797 163.8547210693359 197.0579833984375 164.2504730224609 196.6622009277344 C 164.6466979980469 196.2664337158203 165.1743774414063 196.0354614257813 165.7682647705078 196.0354614257813 L 172.1365051269531 196.0354614257813 C 172.6313323974609 196.0354614257813 173.0270843505859 195.6392669677734 173.0270843505859 195.1444396972656 L 173.0270843505859 194.1876678466797 C 173.0270843505859 193.8247528076172 173.1590118408203 193.4947357177734 173.3899993896484 193.2637481689453 L 173.3899993896484 193.2637481689453 L 173.3899993896484 193.2637481689453 C 173.6209869384766 193.0327911376953 173.9510192871094 192.9008483886719 174.3138885498047 192.9008483886719 L 184.17919921875 192.9008483886719 C 184.5420989990234 192.9008483886719 184.8721160888672 193.0327911376953 185.1031036376953 193.2637481689453 C 185.3340759277344 193.4947357177734 185.4660186767578 193.8247528076172 185.4660186767578 194.1876678466797 L 185.4660186767578 195.1444396972656 C 185.4660186767578 195.6392669677734 185.8622131347656 196.0354614257813 186.3570251464844 196.0354614257813 L 192.7248382568359 196.0354614257813 C 193.3187255859375 196.0354614257813 193.8468475341797 196.2664337158203 194.2426300048828 196.6622009277344 C 194.6388244628906 197.0579833984375 194.8697967529297 197.5861053466797 194.8697967529297 198.1799774169922 L 194.8697967529297 214.6112060546875 L 194.8364868164063 214.6112060546875 Z" fill="#040505" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
//circular black check box
const String _svg_d7whwv =
    '<svg viewBox="9.2 7.1 16.2 16.2" ><path transform="translate(-174.0, -200.49)" d="M 191.3505554199219 207.5859832763672 C 189.1069793701172 207.5859832763672 187.0610809326172 208.5098724365234 185.6094970703125 209.9614715576172 C 184.1245880126953 211.4463653564453 183.2339935302734 213.458984375 183.2339935302734 215.7025451660156 C 183.2339935302734 217.9461059570313 184.1578979492188 219.9920043945313 185.6094970703125 221.443603515625 C 187.0943908691406 222.9285125732422 189.1069793701172 223.8191070556641 191.3505554199219 223.8191070556641 C 193.5941314697266 223.8191070556641 195.6400299072266 222.8952026367188 197.0916137695313 221.443603515625 C 198.5765075683594 219.9587097167969 199.4671325683594 217.9461059570313 199.4671325683594 215.7025451660156 C 199.4671325683594 213.458984375 198.543212890625 211.4130706787109 197.0916137695313 209.9614715576172 C 195.6400299072266 208.5098724365234 193.5941314697266 207.5859832763672 191.3505554199219 207.5859832763672 Z M 195.8376922607422 220.2229766845703 C 194.6828155517578 221.3445587158203 193.0993041992188 222.0703582763672 191.3505554199219 222.0703582763672 C 189.6017913818359 222.0703582763672 188.0182800292969 221.3445587158203 186.8634033203125 220.2229766845703 C 185.7085418701172 219.0680999755859 185.0156097412109 217.4841613769531 185.0156097412109 215.7354125976563 C 185.0156097412109 213.9866485595703 185.7414093017578 212.4031372070313 186.8634033203125 211.2482604980469 C 188.0182800292969 210.0933837890625 189.6017913818359 209.4004669189453 191.3505554199219 209.4004669189453 C 193.0993041992188 209.4004669189453 194.6828155517578 210.1262664794922 195.8376922607422 211.2482604980469 C 196.9925689697266 212.4031372070313 197.6855010986328 213.9866485595703 197.6855010986328 215.7354125976563 C 197.7183532714844 217.4841613769531 196.9925689697266 219.0680999755859 195.8376922607422 220.2229766845703 Z" fill="#040505" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
//RedArrowIcon
const String _svg_m7ofv4 =
    '<svg viewBox="8.3 20.0 13.4 9.0" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 21.66, 29.0)" d="M 5.901299953460693 1.076775193214417 C 6.301180839538574 0.5398858189582825 7.105405807495117 0.5398857593536377 7.505286693572998 1.076775074005127 L 12.21687698364258 7.402667045593262 C 12.70819091796875 8.062315940856934 12.23739624023438 9 11.41488361358643 9 L 1.991703510284424 9 C 1.169191122055054 9.000000953674316 0.6983963847160339 8.062315940856934 1.189710140228271 7.402667045593262 Z" fill="#eb5151" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
