import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:register/Models/BrandModel.dart';

class SmallBox extends StatelessWidget {
  String LatinName;
  String FarsiName;
  String Country;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [Center(child: Text('ساخت برند جدید'))],
              ),
              Container(
                width: 100,
                padding: EdgeInsets.all(5.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'نام لاتین',
                  ),
                  onChanged: (String value) {
                    LatinName = value;
                  },
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
                width: 100,
                padding: EdgeInsets.all(5.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'نام فارسی',
                  ),
                  onChanged: (String value) {
                    FarsiName = value;
                  },
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
                width: 100,
                padding: EdgeInsets.all(5.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'نام کشور',
                  ),
                  onChanged: (String value) {
                    Country = value;
                  },
                ),
              ),
            ],
          ),
          Align(
            child: Expanded(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.red)),
                color: Color(0xffeb5151),
                onPressed: () {
                  BrandList.add(
                    BrandModel(
                      LatinName: LatinName,
                      FarsiName: FarsiName,
                      Country: Country,
                    ),
                  );
                },
                textColor: Colors.white,
                child: Text(
                  "ثبت",
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}

class BrandBuild extends StatefulWidget {
  int index;

  BrandBuild({this.index});

  @override
  _BrandBuildState createState() => _BrandBuildState();
}

class _BrandBuildState extends State<BrandBuild> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(BrandList[widget.index].LatinName),
        Text(BrandList[widget.index].FarsiName),
        Text(BrandList[widget.index].Country),
      ],
    );
  }
}
