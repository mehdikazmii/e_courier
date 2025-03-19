import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled5/theme/constant.dart';

class TermAndConditions extends StatelessWidget {
  const TermAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryColor),
        title: const Text('Terms & Conditions',style: TextStyle(color: primaryColor,),),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: secondaryColor,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/privacy.jpeg'),
                  fit: BoxFit.cover,)
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 18,),
                  const SizedBox(height: 15,),
                  Container(

                    padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10,top: 10),
                    child: Wrap(
                      children: const <Widget>[
                        Text('●   No refund between user and app for \n      advertisement.\n'
                            ' \n●   No racism or sexism or bullying will be allowed.\n'
                            ' \n●   We are not liable for any transaction between \n      Users\n '
                            '     If there’s any problem we can’t do nothing.\n'
                          '●   Develped by NaveedQamar.'
                            '\n●   naveedqamar6722@gmail.com.',
                          style: TextStyle(color:Colors.black, fontSize: 14.0),
                          softWrap: false, maxLines: 1114,
                          textAlign: TextAlign.left, overflow: TextOverflow.ellipsis,)
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

