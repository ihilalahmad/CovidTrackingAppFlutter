import 'package:flutter/material.dart';

import '../constants.dart';

class CustomDialog extends StatefulWidget {

  final String activeCases, totalDeaths, totalRecovered, countryFlag, countryName;

  CustomDialog({
    required this.countryName,
    required this.countryFlag,
    required this.activeCases,
    required this.totalDeaths,
    required this.totalRecovered
});

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: Constants.padding,top: Constants.avatarRadius
              + Constants.padding, right: Constants.padding,bottom: Constants.padding
          ),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(widget.countryName,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Active cases: ",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                  SizedBox(width: 15,),
                  Text(widget.activeCases,style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total deaths: ",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                  SizedBox(width: 15,),
                  Text(widget.totalDeaths,style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total recovered: ",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                  SizedBox(width: 15,),
                  Text(widget.totalRecovered,style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
                ],
              ),
              SizedBox(height: 22,),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text("Close",style: TextStyle(fontSize: 18),)),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: Image(image: NetworkImage(widget.countryFlag))
            ),
          ),
        ),
      ],
    );
  }
}
